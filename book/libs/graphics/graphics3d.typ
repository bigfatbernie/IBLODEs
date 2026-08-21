#import "../common.typ": *
#import "graphics.typ": merge_strokes

//
// Minimal 3d vector helpers.
//

#let _v_dot(a, b) = a.at(0) * b.at(0) + a.at(1) * b.at(1) + a.at(2) * b.at(2)

#let _v_cross(a, b) = (
  a.at(1) * b.at(2) - a.at(2) * b.at(1),
  a.at(2) * b.at(0) - a.at(0) * b.at(2),
  a.at(0) * b.at(1) - a.at(1) * b.at(0),
)

#let _v_len(a) = calc.sqrt(calc.max(_v_dot(a, a), 0.0))

#let _v_scale(a, s) = a.map(x => x * s)

#let _v_normalize(a) = {
  let l = _v_len(a)
  if l < 1e-12 { a } else { _v_scale(a, 1 / l) }
}

/// Linearly interpolate between the 3d points `a` and `b`.
#let _v_lerp(a, b, t) = (0, 1, 2).map(i => a.at(i) + (b.at(i) - a.at(i)) * t)

/// Produce `count + 1` evenly spaced values covering `[lo, hi]`.
#let _linspace(lo, hi, count) = {
  let count = calc.max(int(count), 1)
  range(count + 1).map(i => lo + (hi - lo) * i / count)
}

//
// Tick generation and formatting.
//

/// Choose "nice" round tick locations inside `[lo, hi]`. Returns `(ticks: (..), step: <step>)`.
#let _nice_ticks(lo, hi, count: 4) = {
  if hi - lo <= 0 {
    return (ticks: (lo,), step: 1)
  }
  let raw = (hi - lo) / calc.max(count, 1)
  let mag = calc.pow(10.0, calc.floor(calc.log(raw)))
  let norm = raw / mag
  let step = if norm <= 1.5 { 1 } else if norm <= 3 { 2 } else if norm <= 7 { 5 } else { 10 }
  let step = step * mag
  let start = calc.ceil(lo / step - 1e-9) * step
  let res = ()
  let i = 0
  while start + i * step <= hi + step * 1e-6 and i < 200 {
    res.push(start + i * step)
    i += 1
  }
  (ticks: res, step: step)
}

/// Format `v` for display, using a number of decimals appropriate for a tick spacing of `step`.
#let _fmt_num(v, step) = {
  let digits = calc.min(calc.max(0, -calc.floor(calc.log(calc.max(step, 1e-12)))), 6)
  let v = calc.round(v, digits: digits)
  // Avoid printing "-0"
  let v = if calc.abs(v) < calc.pow(10.0, -digits) / 2 { 0.0 } else { v }
  if digits == 0 { str(int(calc.round(v))) } else { str(v) }
}

//
// The camera.
//

/// Build an orthographic camera that maps 3d data coordinates onto the 2d cetz canvas.
///
/// The data box `xlim × ylim × zlim` is first rescaled onto a box with side lengths `box_aspect`
/// (so the picture does not depend on the units of the data), and that box is then projected
/// orthographically onto the plane perpendicular to `view_direction`.
///
/// - `view_direction`: A normal vector pointing *from the scene towards the camera*. The default
///   puts the $x$-axis 13 degrees below horizontal going right, the $y$-axis 31 degrees above it,
///   and the $z$-axis straight up. Pass `(1, -1, 1)` for a true isometric view instead, in which
///   all three axes are equally foreshortened -- at the cost of a pair of opposite corners of the
///   box landing on exactly the same point of the page.
/// - `up`: The world direction that should appear vertical in the image.
/// - `box_aspect`: Relative side lengths of the drawn box.
/// - `width` / `height`: The projected box is scaled to fit these.
///
/// Returns a dictionary with
/// - `project(p)`: 3d data point -> `(x, y)` canvas coordinates,
/// - `depth(p)`: 3d data point -> depth (larger is closer to the camera),
/// - `project_dir(d)`: 3d direction -> `(dx, dy)` canvas direction (no translation),
/// - `dir_depth(d)`: how much of a 3d direction points along the view axis,
/// - `depth_range`: `(min, max)` depth over the corners of the box,
/// - `scale`, `basis`: the scale factor and the `(u, v, n)` screen basis.
#let make_camera_3d(
  xlim: (0, 1),
  ylim: (0, 1),
  zlim: (0, 1),
  view_direction: (1, -1.6, 0.75),
  up: (0, 0, 1),
  box_aspect: (1, 1, 1),
  width: 6cm,
  height: auto,
) = {
  let lims = (xlim, ylim, zlim)
  let mins = lims.map(l => l.at(0))
  let ranges = lims.map(l => {
    let r = l.at(1) - l.at(0)
    if calc.abs(r) < 1e-12 { 1e-12 } else { r }
  })

  let n = _v_normalize(view_direction)
  let up = _v_normalize(up)
  // If the requested "up" is (nearly) parallel to the view direction it cannot orient the
  // image; fall back to another world axis.
  let up = if calc.abs(_v_dot(up, n)) > 0.999 {
    if calc.abs(n.at(1)) < 0.9 { (0, 1, 0) } else { (1, 0, 0) }
  } else {
    up
  }
  let u = _v_normalize(_v_cross(up, n))
  let v = _v_cross(n, u)

  /// Data coordinates -> normalized box coordinates.
  let to_box(p) = (0, 1, 2).map(i => (p.at(i) - mins.at(i)) / ranges.at(i) * box_aspect.at(i))
  /// Data directions -> normalized box directions (the same map, without the translation).
  let dir_to_box(d) = (0, 1, 2).map(i => d.at(i) / ranges.at(i) * box_aspect.at(i))

  // Project the corners of the box so we can center and scale the picture.
  let corners = ()
  for i in (0, 1) {
    for j in (0, 1) {
      for k in (0, 1) {
        corners.push((i * box_aspect.at(0), j * box_aspect.at(1), k * box_aspect.at(2)))
      }
    }
  }
  let flat = corners.map(q => (_v_dot(q, u), _v_dot(q, v)))
  let depths = corners.map(q => _v_dot(q, n))
  let xs = flat.map(p => p.at(0))
  let ys = flat.map(p => p.at(1))
  let (x0, x1) = (calc.min(..xs), calc.max(..xs))
  let (y0, y1) = (calc.min(..ys), calc.max(..ys))
  let (cx, cy) = ((x0 + x1) / 2, (y0 + y1) / 2)

  let s = width.cm() / calc.max(x1 - x0, 1e-9)
  let s = if height != auto {
    calc.min(s, height.cm() / calc.max(y1 - y0, 1e-9))
  } else { s }

  (
    project: p => {
      let q = to_box(p)
      ((_v_dot(q, u) - cx) * s, (_v_dot(q, v) - cy) * s)
    },
    depth: p => _v_dot(to_box(p), n),
    project_dir: d => {
      let q = dir_to_box(d)
      (_v_dot(q, u) * s, _v_dot(q, v) * s)
    },
    /// The component of a direction along the view axis: how much of it points at the camera.
    dir_depth: d => _v_dot(dir_to_box(d), n),
    dir_to_box: dir_to_box,
    depth_range: (calc.min(..depths), calc.max(..depths)),
    scale: s,
    basis: (u, v, n),
    lims: lims,
  )
}

//
// Depth-sorted drawing primitives.
//
// Every drawable is a dictionary `(depth: <float>, content: <cetz elements>)`. All drawables are
// collected, sorted from far to near, and then emitted in that order. Because each drawable paints
// its own white halo immediately before its own ink, a nearer segment erases whatever lies behind
// it -- a painter's algorithm standing in for a z-buffer.
//

/// The thickness of `s`, falling back to `default` when it is `auto`.
#let _thickness_of(s, default: 1pt) = {
  let t = stroke(s).thickness
  if t == auto { default } else { t }
}

/// Build the (halo, ink) pair for a canvas-space segment from `a` to `b`.
#let _halo_line(a, b, stroke_style, halo: none, halo_color: white, halo_cap: "round") = {
  let res = ()
  if halo != none {
    res += cetz.draw.line(
      a,
      b,
      stroke: stroke((
        paint: halo_color,
        thickness: _thickness_of(stroke_style) + 2 * halo,
        cap: halo_cap,
      )),
    )
  }
  res + cetz.draw.line(a, b, stroke: stroke_style)
}

/// Turn the 3d segment `a`--`b` into an array of drawables, subdividing it into `subdiv` pieces so
/// that long segments sort correctly against the rest of the scene.
///
/// Set `polyline` when the segment is one link of a longer chain. A chain is depth sorted link by
/// link, so a link's halo would otherwise eat the ink of the neighbouring links it is drawn after,
/// leaving the curve looking like a dotted line. Butt caps confine the halo to the sides of the
/// link, where it belongs.
#let _segment_drawables(
  cam,
  a,
  b,
  stroke_style: 1pt,
  halo: none,
  halo_color: white,
  subdiv: 1,
  polyline: false,
  shade_fn: none,
) = {
  let subdiv = calc.max(int(subdiv), 1)
  let halo_cap = if polyline or subdiv > 1 { "butt" } else { "round" }
  range(subdiv).map(i => {
    let p0 = _v_lerp(a, b, i / subdiv)
    let p1 = _v_lerp(a, b, (i + 1) / subdiv)
    let d = ((cam.depth)(p0) + (cam.depth)(p1)) / 2
    let st = if shade_fn == none { stroke_style } else { shade_fn(stroke_style, d) }
    (
      depth: d,
      content: _halo_line(
        (cam.project)(p0),
        (cam.project)(p1),
        st,
        halo: halo,
        halo_color: halo_color,
        halo_cap: halo_cap,
      ),
    )
  })
}

/// Place a label on a white backing, so a dense field does not run through the text.
#let _label(pos, body) = cetz.draw.content(
  pos,
  body,
  anchor: "center",
  frame: "rect",
  fill: white,
  stroke: none,
  padding: .02,
)

/// Emit an array of drawables in far-to-near order.
#let _emit_sorted(drawables) = {
  drawables.sorted(key: d => d.depth).map(d => d.content).join()
}

//
// Colour helpers.
//

#let _default_slope_color = rgb("#3b3f8f")

/// Lighten `paint` towards the background as it recedes from the camera. `t` is 0 at the far
/// plane and 1 at the near plane.
#let _shaded(paint, t, amount) = {
  if amount == none or amount == 0 {
    paint
  } else {
    paint.lighten(calc.max(calc.min((1 - t) * amount, 1.0), 0.0) * 100%)
  }
}

//
// Curves.
//

/// Normalize a user-supplied curve specification into `(points: (..3d points..), ..style..)`.
#let _normalize_curve(spec) = {
  let spec = if type(spec) == array { (points: spec) } else { spec }
  let points = spec.at("points", default: ())
  let points = if type(points) == function {
    let (t0, t1) = spec.at("tlim", default: (0, 1))
    _linspace(t0, t1, spec.at("samples", default: 200)).map(points)
  } else {
    points
  }
  (
    points: points.map(p => (p.at(0), p.at(1), p.at(2))),
    stroke: spec.at("stroke", default: 1.2pt + rgb("#c1121f")),
    halo: spec.at("halo", default: 1pt),
    halo_color: spec.at("halo_color", default: white),
    clip: spec.at("clip", default: true),
    shade: spec.at("shade", default: auto),
    // `auto` splits each link by how long it is on the page. A curve given as a handful of far
    // apart points would otherwise sort as a few long sticks at a single depth each, and punch
    // through whatever it crosses.
    subdiv: spec.at("subdiv", default: auto),
  )
}

/// Drop points that land within `min_step` canvas units of the previously kept point. Densely
/// sampled curves gain nothing from links shorter than the pen is wide, and every extra link is
/// another halo joint to go wrong.
#let _simplify_screen(cam, pts, min_step: 0.035) = {
  if pts.len() <= 2 {
    return pts
  }
  let res = (pts.first(),)
  let last = (cam.project)(pts.first())
  for p in pts.slice(1, pts.len() - 1) {
    let s = (cam.project)(p)
    let (dx, dy) = (s.at(0) - last.at(0), s.at(1) - last.at(1))
    if dx * dx + dy * dy >= min_step * min_step {
      res.push(p)
      last = s
    }
  }
  res.push(pts.last())
  res
}

/// Is the 3d point `p` inside the box described by `lims` (with a small tolerance)?
#let _in_box(p, lims) = {
  (0, 1, 2).all(i => {
    let (lo, hi) = (calc.min(..lims.at(i)), calc.max(..lims.at(i)))
    let tol = (hi - lo) * 1e-6
    p.at(i) >= lo - tol and p.at(i) <= hi + tol
  })
}

//
// The main entry point.
//

/// Plot a three-dimensional slope field for the system `(x, y, z)' = F(x, y, z)`.
///
/// Unlike a two-dimensional slope field, a three-dimensional one has to be projected onto the page,
/// so nearby and distant slopes overlap. Two devices keep it readable: every slope is drawn with
/// the *same visible length* regardless of how it is oriented in space, and slopes are painted from
/// back to front, each with a thin white halo, so a nearer slope visibly interrupts a farther one.
///
/// - `F`: A function `(x, y, z) => (dx, dy, dz)` giving the direction of the field. Only the
///   direction matters; the magnitude is discarded.
/// - `xlim`, `ylim`, `zlim`: The extent of the plotted box in data coordinates.
/// - `spacing`: Spacing between sampled slopes in data coordinates; a number or a triple. `auto`
///   picks roughly six slopes along each axis.
/// - `view_direction`: A normal vector pointing from the scene *towards the camera*. See
///   `make_camera_3d` for the default. Pass `(1, -1, 1)` for a true isometric view.
/// - `up`: The world direction drawn vertically.
/// - `box_aspect`: Relative side lengths of the drawn box. The data ranges are rescaled onto it, so
///   axes with wildly different units still produce a sensible picture.
/// - `width`, `height`: The size the projected box is scaled to fit.
/// - `segment_length`: The visible length of each slope, as a fraction of the spacing between
///   neighbouring slopes. `scale_segments` multiplies it.
/// - `stroke_style`: The stroke used for the slopes.
/// - `slope_color`: A color, or a function `(x, y, z) => color`. `auto` uses the default color.
/// - `halo`: Half-width of the white border around each slope, or `none` for no border.
/// - `shade`: How strongly distant slopes fade towards the background, between 0 and 1.
///   `none` disables depth shading.
/// - `foreshorten`: If `true`, draw the true projected length instead of a constant visible length.
/// - `min_projection`: A slope whose projection is shorter than this fraction of its own length is
///   pointing essentially straight at the camera, so its direction on the page carries no
///   information. Such slopes are drawn as dots instead of being stretched to full length.
/// - `curves`: An array of parametric curves to embed in the field. Each is either an array of 3d
///   points or a dictionary `(points: <array or function>, tlim: .., samples: .., stroke: ..,
///   halo: .., clip: ..)`.
/// - `frame`: Whether to draw the wireframe box.
/// - `axes`: Whether to draw labelled axis arrows. They are depth sorted along with the field, so
///   slopes in the foreground are drawn over them.
/// - `axes_on_top`: Lift the axes, ticks and labels out of the depth sort and draw them over the
///   whole scene. Worth turning on for a densely sampled field, where an axis running along the
///   back of the box can end up with most of its labels painted over.
/// - `ticks`: `auto` for automatic tick marks, `none` for no ticks, or a triple of arrays of tick
///   locations.
/// - `body`: A function `camera => <cetz elements>` drawn on top of everything, for annotations.
#let slope_field_3d(
  F,
  xlim: (0, 1),
  ylim: (0, 1),
  zlim: (0, 1),
  spacing: auto,
  view_direction: (1, -1.6, 0.75),
  up: (0, 0, 1),
  box_aspect: (1, 1, 1),
  width: 6cm,
  height: auto,
  segment_length: 0.55,
  scale_segments: 1.0,
  stroke_style: .8pt,
  slope_color: auto,
  halo: .7pt,
  halo_color: white,
  shade: 0.45,
  foreshorten: false,
  min_projection: 0.02,
  curves: (),
  frame: true,
  frame_stroke: rgb("#9a9a9a") + .4pt,
  axes: true,
  axes_on_top: false,
  axis_stroke: rgb("#8a8a8a") + 1.1pt,
  xlabel: $x$,
  ylabel: $y$,
  zlabel: $z$,
  ticks: auto,
  tick_length: .12,
  label_size: .85em,
  body: none,
) = {
  let lims = (xlim, ylim, zlim)
  let ranges = lims.map(l => l.at(1) - l.at(0))

  let cam = make_camera_3d(
    xlim: xlim,
    ylim: ylim,
    zlim: zlim,
    view_direction: view_direction,
    up: up,
    box_aspect: box_aspect,
    width: width,
    height: height,
  )
  let project = cam.project
  let depth = cam.depth

  // Depth shading is measured against the extent of the box, which is stable no matter which
  // slopes happen to be sampled.
  let (d_min, d_max) = cam.depth_range
  let d_span = calc.max(d_max - d_min, 1e-9)
  let shade_amount = if shade == none { 0 } else { shade }
  let shade_stroke(st, d) = {
    if shade_amount == 0 { return st }
    let st = stroke(st)
    let paint = if st.paint == auto { black } else { st.paint }
    merge_strokes(st, stroke(_shaded(paint, (d - d_min) / d_span, shade_amount)))
  }

  //
  // Sample the field.
  //
  let spacing = if type(spacing) == array {
    spacing
  } else if type(spacing) == int or type(spacing) == float {
    (spacing, spacing, spacing)
  } else {
    ranges.map(r => r / 5)
  }
  // Keep the number of slopes (and therefore the size of the output) under control.
  let counts = (0, 1, 2).map(i => {
    let c = calc.round(calc.abs(ranges.at(i)) / calc.max(calc.abs(spacing.at(i)), 1e-12))
    calc.min(calc.max(int(c), 1), 20)
  })
  let samples = (0, 1, 2).map(i => _linspace(lims.at(i).at(0), lims.at(i).at(1), counts.at(i)))

  // A slope is drawn `segment_length` times the (projected) distance to its nearest neighbour, so
  // the field stays legible no matter how the box is scaled. An axis pointing straight at the
  // camera contributes a gap of zero -- neighbours along it land on top of each other -- and must
  // not be allowed to shrink every slope to nothing.
  let gaps = (0, 1, 2)
    .map(i => {
      let step = (0, 0, 0)
      let step = step.slice(0, i) + (ranges.at(i) / counts.at(i),) + step.slice(i + 1)
      let (dx, dy) = (cam.project_dir)(step)
      calc.sqrt(dx * dx + dy * dy)
    })
    .filter(g => g > width.cm() * 1e-3)
  let neighbour_gap = if gaps.len() == 0 { width.cm() / 8 } else { calc.min(..gaps) }
  let seg_len = neighbour_gap * segment_length * scale_segments

  let base_stroke = merge_strokes(stroke((thickness: .8pt, cap: "round")), stroke(stroke_style))

  let drawables = ()

  for x in samples.at(0) {
    for y in samples.at(1) {
      for z in samples.at(2) {
        let p = (x, y, z)
        let d = F(x, y, z)
        let (dx, dy) = (cam.project_dir)(d)
        let proj_len = calc.sqrt(dx * dx + dy * dy)
        // A slope pointing (nearly) straight at the camera projects to nothing, and its projected
        // direction is numerically meaningless. Draw a dot rather than a stick pointing whichever
        // way the round-off happens to fall.
        let along_view = (cam.dir_depth)(d) * cam.scale
        let full_len = calc.sqrt(proj_len * proj_len + along_view * along_view)
        let degenerate = proj_len < min_projection * calc.max(full_len, 1e-12)

        let paint = if slope_color == auto {
          _default_slope_color
        } else if type(slope_color) == function {
          slope_color(x, y, z)
        } else {
          slope_color
        }
        let st = merge_strokes(base_stroke, stroke(paint))
        let dep = depth(p)
        let st = shade_stroke(st, dep)

        let (cx, cy) = project(p)
        if degenerate {
          drawables.push((
            depth: dep,
            content: {
              let r = _thickness_of(st).cm() * 1.6
              let res = ()
              if halo != none {
                res += cetz.draw.circle(
                  (cx, cy),
                  radius: r + halo.cm(),
                  stroke: none,
                  fill: halo_color,
                )
              }
              res + cetz.draw.circle((cx, cy), radius: r, stroke: none, fill: stroke(st).paint)
            },
          ))
        } else {
          // Same *visible* length for every slope: normalize in canvas space, not in data space.
          let scale = if foreshorten { scale_segments } else { seg_len / proj_len }
          let (hx, hy) = (dx * scale / 2, dy * scale / 2)
          drawables.push((
            depth: dep,
            content: _halo_line(
              (cx - hx, cy - hy),
              (cx + hx, cy + hy),
              st,
              halo: halo,
              halo_color: halo_color,
            ),
          ))
        }
      }
    }
  }

  //
  // The wireframe box, depth sorted along with the field.
  //
  if frame {
    let corner(i, j, k) = (
      lims.at(0).at(i),
      lims.at(1).at(j),
      lims.at(2).at(k),
    )
    let edges = ()
    for j in (0, 1) {
      for k in (0, 1) {
        edges.push((corner(0, j, k), corner(1, j, k)))
      }
    }
    for i in (0, 1) {
      for k in (0, 1) {
        edges.push((corner(i, 0, k), corner(i, 1, k)))
      }
    }
    for i in (0, 1) {
      for j in (0, 1) {
        edges.push((corner(i, j, 0), corner(i, j, 1)))
      }
    }
    for (a, b) in edges {
      drawables += _segment_drawables(
        cam,
        a,
        b,
        stroke_style: frame_stroke,
        subdiv: 16,
        shade_fn: shade_stroke,
      )
    }
  }

  //
  // Embedded parametric curves.
  //
  for spec in curves {
    let c = _normalize_curve(spec)
    let pts = _simplify_screen(cam, c.points)
    let shade_fn = if c.shade == none { none } else { shade_stroke }
    let curve_stroke = merge_strokes(stroke((cap: "round",)), stroke(c.stroke))
    for i in range(calc.max(pts.len() - 1, 0)) {
      let (a, b) = (pts.at(i), pts.at(i + 1))
      if c.clip and not (_in_box(a, lims) and _in_box(b, lims)) {
        continue
      }
      let subdiv = if c.subdiv != auto { c.subdiv } else {
        let (ax, ay) = project(a)
        let (bx, by) = project(b)
        let len = calc.sqrt(calc.pow(bx - ax, 2) + calc.pow(by - ay, 2))
        calc.min(calc.max(int(calc.ceil(len / 0.12)), 1), 64)
      }
      drawables += _segment_drawables(
        cam,
        a,
        b,
        stroke_style: curve_stroke,
        halo: c.halo,
        halo_color: c.halo_color,
        subdiv: subdiv,
        polyline: true,
        shade_fn: shade_fn,
      )
    }
  }

  //
  // Axes, ticks and labels. By default these live in the scene rather than floating above it: they
  // are depth sorted along with the field, so a slope in the foreground paints over the label of an
  // axis running along the back of the box. Each label keeps its white backing, which hides
  // whatever is *behind* it -- exactly what an opaque object at that depth should do.
  //
  let axis_drawables = ()
  if axes {
    let origin = lims.map(l => l.at(0))
    let labels = (xlabel, ylabel, zlabel)
    let tick_spec = if ticks == auto {
      (0, 1, 2).map(i => _nice_ticks(lims.at(i).at(0), lims.at(i).at(1)))
    } else if ticks == none {
      (0, 1, 2).map(i => (ticks: (), step: 1))
    } else {
      (0, 1, 2).map(i => (ticks: ticks.at(i), step: 1))
    }

    for i in (0, 1, 2) {
      let far = (0, 1, 2).map(k => if k == i { lims.at(k).at(1) } else { origin.at(k) })

      // Point ticks and labels away from the box, along the two axes we are not drawing.
      let out3 = (0, 1, 2).map(k => if k == i { 0 } else { -1 })
      let (ox, oy) = (cam.project_dir)((0, 1, 2).map(k => out3.at(k) * ranges.at(k)))
      let olen = calc.sqrt(ox * ox + oy * oy)
      let out = if olen < 1e-9 { (0, -1) } else { (ox / olen, oy / olen) }

      let (sx, sy) = project(origin)
      let (fx, fy) = project(far)
      // Extend the axis past the box so the arrowhead, and then the label, clear both the box
      // and the tick label sitting at the end of the axis.
      let (ax, ay) = (fx - sx, fy - sy)
      let alen = calc.sqrt(ax * ax + ay * ay)
      // An axis pointing (nearly) straight at the camera projects to a point. Its arrow, ticks
      // and label would all pile up on the origin, so leave it out entirely.
      if alen < 0.05 {
        continue
      }
      let (ux, uy) = (ax / alen, ay / alen)
      let tip = (fx + ux * 0.4, fy + uy * 0.4)
      let d_far = depth(far)

      // The shaft runs the length of the box and so spans a range of depths; the arrowhead sticks
      // out past the box in screen space, so it belongs at the depth of the far end.
      axis_drawables += _segment_drawables(cam, origin, far, stroke_style: axis_stroke, subdiv: 16)
      axis_drawables.push((
        depth: d_far,
        content: cetz.draw.line(
          (fx, fy),
          tip,
          stroke: axis_stroke,
          mark: (end: "stealth", fill: stroke(axis_stroke).paint, scale: .5),
        ),
      ))
      // Push the label out along the axis rather than sideways, so it clears the tick label that
      // sits at the far end of the axis.
      axis_drawables.push((
        depth: d_far,
        content: _label(
          (tip.at(0) + ux * 0.45 + out.at(0) * 0.16, tip.at(1) + uy * 0.45 + out.at(1) * 0.16),
          text(size: label_size, labels.at(i)),
        ),
      ))

      for t in tick_spec.at(i).ticks {
        // All three axes meet at the origin corner, so a tick there would be drawn three times
        // on top of itself.
        if calc.abs(t - lims.at(i).at(0)) < calc.abs(ranges.at(i)) * 1e-6 {
          continue
        }
        let p = (0, 1, 2).map(k => if k == i { t } else { origin.at(k) })
        let (px, py) = project(p)
        let (qx, qy) = (px + out.at(0) * tick_length, py + out.at(1) * tick_length)
        axis_drawables.push((
          depth: depth(p),
          content: {
            cetz.draw.line((px, py), (qx, qy), stroke: axis_stroke)
            _label(
              (qx + out.at(0) * 0.14, qy + out.at(1) * 0.14),
              text(size: label_size * 0.85, _fmt_num(t, tick_spec.at(i).step)),
            )
          },
        ))
      }
    }
  }

  //
  // Draw everything, far to near.
  //
  cetz.canvas({
    if axes_on_top {
      _emit_sorted(drawables)
      _emit_sorted(axis_drawables)
    } else {
      _emit_sorted(drawables + axis_drawables)
    }

    if body != none {
      body(cam)
    }
  })
}

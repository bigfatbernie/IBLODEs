#import "graphics3d.typ": *
#import "../numerics/ode_solvers.typ": solve_2d_ivp

#set page(width: auto, height: auto, margin: 1cm)

#let F(a, p) = (a + 0.5 * p - 10, 0.5 * a - 0.5 * p)
#let field(a, p, t) = (..F(a, p), 1)

/// Turn a solution of the 2d system into a curve in $(P_"ant", P_"aphid", t)$ space.
#let trajectory(v_0, steps: 300, Delta: 0.01) = {
  solve_2d_ivp(F, v_0, steps, Delta: Delta, method: "rk4")
    .enumerate()
    .map(((i, v)) => (v.at(0), v.at(1), i * Delta))
}

#pagebreak(weak: true)
= A plain slope field

The ant-and-aphid system, plotted in $(P_"ant", P_"aphid", t)$ space.

#slope_field_3d(
  field,
  xlim: (0, 30),
  ylim: (0, 30),
  zlim: (0, 3),
  width: 8cm,
  xlabel: $P_"ant"$,
  ylabel: $P_"aphid"$,
  zlabel: $t$,
)

#pagebreak(weak: true)
= With embedded solution curves

One solution runs down the stable direction into the equilibrium; the other two leave the box.

#slope_field_3d(
  field,
  xlim: (0, 30),
  ylim: (0, 30),
  zlim: (0, 3),
  width: 8cm,
  xlabel: $P_"ant"$,
  ylabel: $P_"aphid"$,
  zlabel: $t$,
  curves: (
    (points: trajectory((5.17, 11.62)), stroke: 1.4pt + rgb("#c1121f")),
    (points: trajectory((4, 12)), stroke: 1.4pt + rgb("#0b6e4f")),
    (points: trajectory((14, 22)), stroke: 1.4pt + rgb("#1d5fa8")),
  ),
)

#pagebreak(weak: true)
= Denser sampling, coloured by height, axes lifted on top

#slope_field_3d(
  field,
  xlim: (0, 30),
  ylim: (0, 30),
  zlim: (0, 3),
  spacing: (4, 4, 0.5),
  axes_on_top: true,
  shade: none,
  slope_color: (x, y, z) => color.mix((rgb("#1d5fa8"), (3 - z) / 3 * 100%), (rgb("#c1121f"), z / 3 * 100%)),
  width: 8cm,
  xlabel: $P_"ant"$,
  ylabel: $P_"aphid"$,
  zlabel: $t$,
)

#pagebreak(weak: true)
= A different view direction, curve given as a function

#slope_field_3d(
  (x, y, z) => (-y, x, 0.6),
  xlim: (-1, 1),
  ylim: (-1, 1),
  zlim: (0, 2),
  spacing: (0.5, 0.5, 0.5),
  view_direction: (2, -3, 1.2),
  box_aspect: (1, 1, 1.2),
  width: 7cm,
  curves: (
    (
      points: t => (0.8 * calc.cos(t * 1rad), 0.8 * calc.sin(t * 1rad), t * 0.6),
      tlim: (0, 3.3),
      samples: 300,
      stroke: 1.4pt + rgb("#0b6e4f"),
    ),
    // A bare array of points is also accepted, and picks up the default styling.
    ((-1, -1, 0), (1, 1, 2)),
  ),
)

#pagebreak(weak: true)
= Foreshortened, for comparison

Slopes pointing towards the camera shrink instead of keeping a constant visible length.

#slope_field_3d(
  (x, y, z) => (-y, x, 0.6),
  xlim: (-1, 1),
  ylim: (-1, 1),
  zlim: (0, 2),
  spacing: (0.5, 0.5, 0.5),
  foreshorten: true,
  scale_segments: 0.35,
  width: 7cm,
)

#pagebreak(weak: true)
= Viewed straight down the $y$-axis

The $y$-axis itself projects to a point, so it is left undrawn. Slopes that lie in a plane of
constant $y$ still stack up five deep at each screen position.

#slope_field_3d(
  (x, y, z) => (-y, x, 0.6),
  xlim: (-1, 1),
  ylim: (-1, 1),
  zlim: (0, 2),
  spacing: (0.5, 0.5, 0.5),
  view_direction: (0, -1, 0),
  width: 6cm,
)

#pagebreak(weak: true)
= Slopes pointing straight at the camera

Along the line $x = z = 0$ the field points directly at the viewer, so its direction on the page
carries no information at all. Those slopes are drawn as dots rather than being stretched to full
length in an arbitrary direction.

#slope_field_3d(
  (x, y, z) => (x, 4, z),
  xlim: (-1, 1),
  ylim: (-1, 1),
  zlim: (-1, 1),
  spacing: (0.5, 0.5, 0.5),
  view_direction: (0, -1, 0),
  width: 6cm,
)

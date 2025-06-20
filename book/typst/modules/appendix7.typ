// This file is meant to be imported and not compiled on its own.
#import "../common/settings-book.typ": workbook, show_def
#import "../libs/_workbook.typ": simple_table, label_appendix
#let (sans, serif, module, definition, example, theorem) = workbook

#label_appendix(<app:complex>)

In this appendix#footnote[Special thanks to Rhupert Ashmore-Sharpe for authoring the bulk of this appendix.] you will learn:
- What a complex numbers is,
- The geometry of complex numbers, and
- The basics of manipulating complex numbers.

== Preliminaries

XXX This was copy-and-pasted from the PCE that Rhupert wrote for complex numbers. It needs to be edited and the figures need to be recreated.

The imaginary numbers are built from a special symbol $i$, whose square is
$i^2 = -1$. An _imaginary_ number is a pure multiple of $i$, like $b i$, where $b$ is real. A
_complex_ number is a sum of a real and imaginary number, and generally
looks like $a + b i$. The set of all complex numbers, denoted $CC$, is
$
  CC = { a + b i : a, b in RR }.
$
Complex numbers can be multiplied and added in
all the same ways real numbers can.

If $z = a + b i$, we call $a$ the _real part_ of $z$ and $b$ the _imaginary part_ of $z$.

== Geometry of the Complex Numbers

The real numbers ($RR$) can be identified with a number
line. Multiplying by a real number stretches, compresses, or reflects this number line (depending on whether
the number is greater than 1, less than 1, or negative). For example,
consider the bolded region $[1, 2]$ below. The figure
on the left shows the effect of multiplication by $-1$ and on the right
multiplication by $2$:

#{
  import "@preview/cetz:0.4.0"
  let left_diagram = cetz.canvas({
    import cetz.draw: *

    let draw_axis() = {
      line(
        (-2.7, 0),
        (2.7, 0),
        mark: (start: "stealth", end: "stealth", fill: black),
        stroke: .5pt,
      )

      for x in range(-2, 3) {
        line((x, -.1), (x, 0.1), stroke: .5pt)
        content(
          (x, -.2),
          anchor: "north",
          text($#x$),
        )
      }
    }

    group({
      draw_axis()

      // The interval [1, 2]
      line((1, 0), (2, 0), stroke: 2pt + blue)
    })

    group({
      translate((0, -3))

      draw_axis()

      arc(
        (1, .2),
        start: 0deg,
        stop: 180deg,
        mark: (end: "stealth", fill: black),
        stroke: (dash: (2pt, 2pt)),
      )

      // The interval [1, 2]
      line((-2, 0), (-1, 0), stroke: 2pt + blue)
    })
  })

  let right_diagram = cetz.canvas({
    import cetz.draw: *

    let draw_axis() = {
      line(
        (-.7, 0),
        (4.7, 0),
        mark: (start: "stealth", end: "stealth", fill: black),
        stroke: .5pt,
      )

      for x in range(-0, 5) {
        line((x, -.1), (x, 0.1), stroke: .5pt)
        content(
          (x, -.2),
          anchor: "north",
          text($#x$),
        )
      }
    }

    group({
      draw_axis()

      // The interval [1, 2]
      line((1, 0), (2, 0), stroke: 2pt + blue)
    })

    line(
      (1.1, -.2),
      (2, -2.8),
      mark: (end: "stealth", fill: black),
      stroke: (dash: (2pt, 2pt)),
    )
    line(
      (2.1, -.2),
      (4, -2.8),
      mark: (end: "stealth", fill: black),
      stroke: (dash: (2pt, 2pt)),
    )
    line(
      (1.6, -.2),
      (3, -2.8),
      mark: (end: "stealth", fill: black),
      stroke: (dash: (2pt, 2pt)),
    )

    group({
      translate((0, -3))

      draw_axis()

      // The interval [1, 2]
      line((2, 0), (4, 0), stroke: 2pt + blue)
    })
  })

  align(
    center,
    stack(
      dir: ltr,
      spacing: 1cm,
      left_diagram,
      right_diagram,
    ),
  )
}

Just like the real numbers, the complex numbers have a geometric meaning.
A complex number $1 + 2 i$ can be thought of as a point in the complex plane (with one axis the _real axis_
and the other axis the _imaginary axis_).

XXX diagram

If we
multiply $1 + 2 i$ by $i$, we get:

$ i (1 + 2 i) = i + 2 i^2 = -2 + i $

//#align(center)[
//  // Complex plane before multiplication
//  #diagram[
//    grid((-3.1, -3.1), (3.1, 3.1), dotted)
//    line((-3.3, 0), (3.3, 0), arrow: both)
//    line((0, -3.3), (0, 3.3), arrow: both)
//    point((1, 2), label: "1 + 2 i")
//  ]
//  // Arrow indicating multiplication
//  #diagram[
//    arrow((0, 2.4), (2, 2.4))
//    text("Multiply by $i$", position: (1, 2.4))
//  ]
//  // Complex plane after multiplication
//  #diagram[
//    grid((-3.1, -3.1), (3.1, 3.1), dotted)
//    line((-3.3, 0), (3.3, 0), arrow: both)
//    line((0, -3.3), (0, 3.3), arrow: both)
//    point((-2, 1), label: "-2 + i")
//  ]
//]

Graph the points $-1$, $i$, and $3 - i$ in the complex plane, as well as their result
after multiplying by $i$. You might notice that the result is rotated by 90
degrees! The fact that complex numbers *model rotations in the plane* is
the secret to their usefulness across science and engineering.

Since complex numbers have all the same algebraic operations that real numbers
have, we can multiply two complex numbers like we would binomials:

$ (a + b i)(c + d i) = (a c - b d) + (b c + a d) i $

For example, $(2 + 3 i)(4 - 2 i) = 14 + 8 i$. Try graphing the points $1 + 2 i$, $3 + 2 i$, $-1 - i$, and then their result after multiplying by $1 + i$.

For a complex number $z = a + b i$, we define the *complex conjugate* as $overline(z) = a - b i$. The complex conjugate can be thought of as a reflection over the real axis. For example, take $z = 2 + 2 i$ drawn below with its complex conjugate:

//#align(center)[
//  #diagram[
//    grid((-3.1, -3.1), (3.1, 3.1), dotted)
//    line((-3.3, 0), (3.3, 0), arrow: both)
//    line((0, -3.3), (0, 3.3), arrow: both)
//    point((2, 2), label: "z = 2 + 2 i")
//    point((2, -2), label: "overline(z) = 2 - 2 i")
//  ]
//]

If $z = a + b i$, then $z overline(z) = a^2 + b^2$. The length or *modulus* of $z = a + b i$ is $|z| = sqrt(a^2 + b^2)$ and can be written succinctly as $|z|^2 = z overline(z)$. Here is a short list of other nice properties of the complex conjugate, which you can check yourself with some examples:

- $overline(z^n) = (overline(z))^n$
- $overline(z_1 / z_2) = overline(z_1) / overline(z_2)$
- $overline(z_1 + z_2) = overline(z_1) + overline(z_2)$

The reciprocal, $1 / z$, of a complex number can be written nicely as well, by multiplying the numerator and denominator by $overline(z)$:

$ 1 / z = overline(z) / (z overline(z)) = overline(z) / abs(z)^2 $

== Euler's Formula and Polar Form for Complex Numbers

Similar to how we can represent any point in the plane in polar coordinates, we
can also write a complex number in polar form. There is a real number $r$ and
angle $theta$ so that any complex number $z$ looks like:

$ z = r (cos(theta) + i sin(theta)) $

We call $theta$ the *argument* of $z$, and write $theta = arg(z)$. $r$
is usually the length or modulus of $z$. See below:

//#align(center)[
//  #diagram[
//    grid((-3.1, -3.1), (3.1, 3.1), dotted)
//    line((-3.3, 0), (3.3, 0), arrow: both)
//    line((0, -3.3), (0, 3.3), arrow: both)
//    point((2, 2), label: "z = 2 + 2 i")
//    line((0, 0), (2, 2))
//    arc(center: (0.5, 0.5), radius: 0.7, start: 45, end: 0)
//    text("theta", position: (0.6, 0.4))
//  ]
//]

Polar coordinates have a simple representation in terms of Euler's formula:

$ e^(i theta) = cos(theta) + i sin(theta) $

You'll see more about why Euler's formula is true later in the course. For now,
just note that all of the familiar properties of exponentials, even when the
inputs are complex, hold. In particular:

$ e^(i theta_1) e^(i theta_2) = e^(i (theta_1 + theta_2)) $

With the polar form $z = r e^(i theta)$ it is straightforward to see what multiplying
complex numbers does. Suppose $z_1 = r_1 e^(i theta_1)$ and
$z_2 = r_2 e^(i theta_2)$. Then

$ z_1 z_2 = r_1 r_2 e^(i (theta_1 + theta_2)) $

So multiplying $z_2$ by $z_1$ i) rotates $z_2$ counterclockwise about
$0$ by $theta_1$ and ii) stretches $z_2$ by a factor of $r_1$.

== Solving Polynomial Equations

Since the square of any real number $x$ is positive, there are some polynomial
equations which have no real solutions. For example, the equation $x^2 + 1 = 0$
has no real solutions. If we allow solutions which are complex, then we can solve
any polynomial. We can factor $x^2 + 1$ by a "difference" of squares:

$ x^2 + 1 = (x + i)(x - i) = 0 $

For the quadratic equation $x^2 + 2 x + 2 = 0$, the quadratic formula gives us the
solutions:

$ z_1 = (-2 + sqrt(4 - 8)) / 2 = -1 + sqrt(-1) = -1 + i $
$ z_2 = (-2 - sqrt(4 - 8)) / 2 = -1 - i $

Notice that the real part of $z_1$ and $z_2$ are the same, and the imaginary
parts are off by a factor of $-1$; in other words, $z_1 = overline(z_2)$.
All roots of polynomials with real coefficients come in complex conjugate
pairs.

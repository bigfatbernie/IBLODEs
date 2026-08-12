This week is about:
- Equilibrium solutions
- Concept of stability of an equilibrium solution

== Equilibrium solutions

Equilibrium solutions are key for studying the long-term behaviour of solutions to differential
equations. We take care to define them as "constant solutions" and then relate that to "the
derivative of an equilibrium solution is zero", rather than the other way around.#footnote[
  Students who memorize "set the derivative to zero" will misapply this method as soon as they
  encounter a non-autonomous differential equation.]

Equilibrium solutions in component space *look like horizontal lines*, but equilibrium solutions in
phase space *look like dots*. This confusion presents an opportunity for students to wrestle with
the difference between phase space and component space.#footnote[
  Even if you spend a lot of class time on this distinction, expect students to carry this confusion
  well past the midterm...]

== Stability

Formal definitions of stability are provided for students with a background in proofs and
quantifiers. However, class should focus on the informal definitions. Our goal is not to "trick"
students with definitional subtleties; what we want is for students to have an intuition about what
attracting/repelling/etc. _looks like_.

=== "Locally"

The informal definitions use the term "locally" to avoid the use of quantifiers. This will need
explanation, and is best explained with examples.


// The definition of *phase portrait* in the text is specific: it is a plot of the vector field, _not_
// a plot of trajectories. Though broader definitions are used elsewhere, we find restricting what a
// phase portrait is makes it useful

// We use vocab "plot in phase space" "plot in component space" to avoid confusions.

// We start with systems before doing the 1-d case because...

// Formal and inform definitions of equilibrium solutions. Don't focus on formal ones. All arguments can be done with informal definitions.

== Slope fields

At the end of this week, slope fields are introduced.#footnote[
  Students may already be familiar with slope fields from their calculus classes.] Since we focus
primarily on systems of differential equations, slope fields play a minimal role in this course.
However, they are valuable and are a key component for motivating phase portraits in
@mod:phase-portraits.

== Vocabulary difference with other textbooks

Some textbooks define the terms like _asymptotically stable_/_semistable_/_source_/_sink_/etc.. We
do not.

#table(
  columns: (auto, 1fr),
  align: (left + top, left + top),
  inset: (x: 6pt, y: 5pt),
  table.header([*In this course*], [*Elsewhere*]),

  [stable and attracting],
  [_asymptotically stable_ (Boyce, Zill, Lebl, Wiggins); _attractor_ (Zill); _sink_ (Blanchard,
    Judson)],

  [stable and not attracting],
  [_stable but not asymptotically stable_ (Boyce); _Lyapunov stable_ but not asymptotically stable
    (Wiggins).],

  [unstable and repelling],
  [_unstable_ (most books); _repeller_ (Zill); _source_ (Blanchard, Judson)],

  [unstable and not repelling],
  [_unstable_ (no distinction from other cases). In one dimension, this is called _semistable_
    (Zill, Boyce, Lebl) if the equilibrium attracts on one side and repels on the other.],
)

== Education literature

#cite(
  <zandieh1999>,
  form: "prose",
) found that many students don't think of equilibrium solutions as functions. One cause is that an
equilibrium solution is a constant function, and students think of constants as numbers and not
functions. #cite(
  <rasmussen2001new>,
  form: "prose",
) calls the general difficulty the _function-as-solution dilemma_, and #cite(
  <keene2012gestures>,
  form: "prose",
) studies how meaning for equilibrium solutions gets built over time.


#cite(
  <rasmussen2001new>,
  form: "prose",
) explains the danger of the "derivative equals zero" definition of equilibrium solution. In that
study, some students claimed that $y = t$ was an equilibrium solution of $y' = y - t$. Additionally,
#cite(
  <zandieh1999>,
  form: "prose",
) document how some students use the word "equilibrium" to describe any point when "the derivative
equals zero". They advocate for giving students vocabulary like _isocline_ or _nullcline_ so that
students can draw a better distinction between equilibrium solutions and places where "the
derivative equals zero".


=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

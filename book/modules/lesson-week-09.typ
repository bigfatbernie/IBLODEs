// Motivated by tree model.

// Calculus "linear approximation" vs our language "affine approximation"

// Have students review linear approximations before this week (from calc and multivariable calc).

// Note about vocabulary usage. How do we use the word "approximation"? e.g. "approximation of a model? function? differential equation (you don't approximate an equation)?"
//   Note: the exercises are a little loose with this language. E.g. 57 talks about "approximation to the original system"

== AI Draft

=== Before the week

Have students review linear approximation / tangent lines from calculus, and partial derivatives and
the total derivative (Jacobian) from multivariable calculus. Some students will never have seen the
total derivative as a matrix; the exercise supplies the formula, and the thing to stress is how
closely the 2-d formula mirrors the 1-d one.

=== Motivation

The week opens by returning to the tree model, which we have been unable to classify since Week 5.
Students look at its phase portrait and try to call the stability of the equilibria as $b$ varies.

- If their intuition fails here, they have not looked at enough phase portraits. Say so, and tell
  them the fix is to build portraits for systems they already understand until the patterns are a
  gut reaction.
- Zooming in---narrowing the Desmos window around an equilibrium---is the technique to demonstrate.
- The conclusion to land hard is that a phase portrait *cannot settle the question*, so we need a
  new tool. Reassure them the eigen machinery from the last three weeks was not wasted; we are about
  to make it apply.

=== Vocabulary: linear, affine, approximation

Calculus calls it a *linear approximation*; in this course that same object is an *affine
approximation*, because we reserve "linear" for expressions with no constant term. Spend a minute on
this explicitly---students who have just spent weeks on $arrow(r)' = M arrow(r) + arrow(b)$ hear
"affine" and think "a matrix equation", not "an expression".

Be careful with "approximation", which the exercises use loosely:

- We approximate *functions*. Given $y' = f(y)$, we find an affine approximation $A$ to the
  _function_ $f$ near a point of interest.
- We then *define a new differential equation* $y' = A(y)$. This is a differential equation in its
  own right, not an approximate one; write $y' = A(y)$, never $y' approx A(y)$.
- Its *solutions* approximate solutions of the original equation.

Introduce the word *linearization* in your wrap-up, and afterwards use "approximation" only for
functions.

=== Sequencing

1-d first. The single-variable exercises exist to separate "approximating a function" from "building
a model out of that approximation"---that is why the parts are split the way they are, and it is
worth preserving the split.

The payoff is that if you centre the approximation *at an equilibrium*, the linearized model has an
equilibrium of the same nature; if you centre it anywhere else, the linearized model tells you
nothing about the original equilibrium. Show this by opening the Desmos links for the original and
each approximation in separate tabs, scaled identically, and flipping between them.

The extra 1-d practice exercise *can be skipped* or reduced to a motivated demo with the algebra
left as homework.

=== The capstone

The tree model linearization is the capstone of the course and will take a full class. The parts
about the equilibrium at the origin are algebraically easy; the parts about the other equilibrium
are conceptually the same but much messier.

- After giving students time on the eigenvalue analysis, take the lead and walk through it.
- Start with the complex-eigenvalue case; it is the more straightforward one.
- $b = 1$ is a trap: the linearization does not determine the stability. (It is in fact stable and
  not attracting, by methods outside this course.)
- For real eigenvalues, whether the signs agree is what matters. Graph $lambda$ as a function of $b$;
  an algebraic proof will be lost on the class.
- Finish by saying what the analysis means for *trees*, not just for eigenvalues.

=== How other texts frame this

*The $b = 1$ trap is a documented, expected case, not bad luck.* Boyce's summary table of when
linearization decides has exactly two rows where it does not, and one of them is ours: purely
imaginary eigenvalues, where the linear system is a centre and the nonlinear system is listed as
"centre or spiral point --- Indeterminate". Lebl devotes a subsection to it titled "The trouble with
centers", with worked examples in which the same linearized centre turns out to be a centre, a
spiral sink and a spiral source. If a student asks _why_ this case and no other, Boyce has the
answer, and it is one you can say in a sentence: a centre is destroyed by an arbitrarily small
change to the coefficients---nudge the eigenvalues off the imaginary axis and the ellipses become
spirals---so the discarded nonlinear terms are exactly big enough to matter. (The "methods outside
this course" that settle it are centre manifold theory; Wiggins devotes a chapter to it.)

*Bifurcation.* Sweeping $b$ from 0 to 2 and watching equilibria collide and change stability is a
bifurcation study, and elsewhere it is not an advanced topic: Blanchard and Judson both put
bifurcations and bifurcation diagrams in their *first-order* chapters, alongside the phase line.
We run one here without naming it. Either naming it in the wrap-up, or deciding aloud not to, is
better than leaving it unsaid---students who take another course will recognize the picture.
== Education literature

*Linearization is well-covered territory; the opportunity is next door.* As $b$
sweeps from 0 to 2 the tree model's equilibria collide and stability turns over.
That is a bifurcation study, and the course runs it without ever naming it.

#cite(<rasmussen2019bifurcation>, form: "prose") publish a sequence in which
students _reinvent_ the bifurcation diagram, and it is closer to our machinery
than one might expect:

- Students analyse a logistic fish-hatchery model, then add a constant harvesting
  rate $k$, and report on the effect of different $k$ to the owners *in one page*.
  The length limit is the design device --- it "encourages consolidation of
  analyses," which is what pushes students to invent the diagram rather than hand
  in twenty pages of phase lines.
- One group in the paper did it *in a spreadsheet*: a column of $P$ values
  repeated across columns of $k$, each cell evaluating $d P slash d t$ and shaded
  by sign, with equilibria falling where the shading switches. The instructor
  then draws a curve along the colour boundary and names it.

We already have all three ingredients: a model with a parameter, a class fluent
in spreadsheets, and a final report. The tree model's $b$ is the fish-hatchery's
$k$.

*Two reasons to decide deliberately rather than by default.* The progression in
@rasmussen2019waypoints puts reasoning about rate of change "as a parameterized
function" at the top --- the point where the object of study stops being any
solution, or even the space of solutions, and becomes how that space changes as a
parameter moves. On that account the tree model's $b$ is the summit of the
course, not an ornament on the linearization week. And bifurcation is not an
advanced topic in current practice: @blanchard2012de and @judson2025odeproject
both put one-parameter families and bifurcation diagrams in their _first-order_
chapters, alongside the phase line. A student who has met the word elsewhere will
recognise our picture and not our vocabulary.

Either name it, or add a line here recording the deliberate choice not to.

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

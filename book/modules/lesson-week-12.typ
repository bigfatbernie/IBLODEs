// Notes have less detail
// Do more in class. It is a treat for students; they've earned it
// Do what you have time for and what suits you and the student's interests.

== AI Draft

=== How to use this week

There is no new machinery. The catenary and the pendulum are extended modelling problems that use
everything from the term: modelling from premises, second-order equations, conversion to systems,
linearization, phase portraits, and boundary value problems. Treat the week as a reward and pick
what fits your remaining time and your students' interests. The notes for these exercises are
deliberately thinner than elsewhere; do more of the work live and let the class steer.

If a group quiz or final project is due around now, this is also the week to leave room for
questions about it.

=== Catenary

The derivation is the hard part, and it is hard in ways worth anticipating:

- Students assume the tension vectors are tangent to the _segment_ rather than to the curve at its
  endpoints. Draw the picture carefully.
- Many will write the force balance with the wrong signs on the tensions. Take (Sr)---"the rope is
  not moving"---seriously and get the relation between the force vectors on the board.
- Approximating the length of the segment requires a tangent-line approximation, and students will
  not reach for one unless told. Say "use a tangent line".
- Finding the *direction* of a tension vector while ignoring its magnitude makes students
  uncomfortable. Tell them the magnitude is handled in the next exercise.
- Eliminating the $x + Delta$ terms is the goal of the second exercise; state that goal before they
  start. The step where the $Delta$'s cancel is satisfying---let them see it.
- The argument that the two constants are equal, and constant, is genuinely hard. Give students time
  to speculate, then walk through it.

The wire-strength question at the end is a real boundary value problem. If you use it, separate
"set up the boundary value problem" from "find the length of the hanging wire"; combined, they
confuse students who could do each one alone. As in Week 11, students must adjust $Delta$ and $N$ so
that the plotted solution spans the full interval before they can tune the remaining parameter.

=== Pendulum

Setting up the model is straightforward; the algebra needs patience. Prefer the route that
eliminates $(theta')^2$ and yields a *second-order* equation---it incidentally removes the extra
parameter.

From there the exercise re-derives the classic small-angle result by linearizing, and everything
from the course is on display at once. If you want an extension: the period of the full non-linear
pendulum is proportional to $sqrt(L slash g)$, which follows from the Buckingham $pi$ theorem.

Comparing the non-linear and linearized phase portraits side by side, and asking what the different
families of trajectories mean physically (swinging versus going over the top), is a good place to
end the course.

=== How other texts frame this

The pendulum is the standard closing example---Lebl, Boyce and Trench all end their qualitative
material with it, and all three land on the same reading of the picture that we do. If you want a
worked reference while preparing, Lebl's is the most direct: the critical points are at
$omega = 0$ and $theta$ a multiple of $pi$, alternating between stable centres (hanging down) and
saddles (balanced on top), with the separatrix dividing swinging from going over the top. Trench
does the *damped* pendulum in the same picture, which is a good extension if a group finishes early.

The catenary has no counterpart in any of these books. If you want a second extended modelling
problem in reserve, the ones that recur elsewhere are competing species (Blanchard, Boyce, Judson),
the SIR epidemic model (Blanchard, Judson) and the Van der Pol oscillator---all of which the class
now has the tools for.

== Education literature

*The catenary and the pendulum are where a term of graphical reasoning is cashed
in, so it is worth knowing what the research says about graphical reasoning under
load.* #cite(<artigue1992>, form: "prose") separated graphical work into three
registers --- interpreting a picture, predicting one, and _justifying_ one ---
and found the difficulties collapse into the third. Her students scored 50--90%
on prediction tasks and 0--30% on justifying the very drawings they had just
produced. They could draw the right picture and not say why it was right.

Her diagnosis is not that the analysis is hard. It is that a picture arrives in a
maths course with no standing to carry an argument: "the graphic setting is a
sub-setting used for representation, not for justification." Ask for a graphical
proof and, in her words, "the traditional didactic contract about proof is broken
and the teacher must negotiate a new contract with the students" --- suddenly
nobody knows which steps need justifying or what counts as an argument.

*What fixed it, and it is one sentence long.* In her second year the team gave
the graphic setting real machinery: regions of the plane together with what it
means for the vector field to point _inward_ or _outward_ along their boundary,
plus the theorem that a solution must leave such a region where the field points
outward --- so a region the field points into everywhere is a trap. Proof scores
moved to 13--77%, and "nearly all the correct proofs produced were based on the
use of areas."

Two distinct tools are worth separating out loud before the pendulum phase
portrait, because the class has been using both informally since Week 4 and has
been told the name of neither.

- *Trajectories cannot cross.* This is uniqueness, and it is what actually
  licenses the separatrix reading: a trajectory inside the closed orbits stays
  inside because it cannot cross the separatrix, and one outside goes over the
  top for the same reason. #cite(<blanchard2012de>, form: "prose") and
  #cite(<trench2013elementary>, form: "prose") both state it as a numbered fact
  for exactly this purpose. It is the Week 11 theorem, arriving a week late for
  the argument that needs it.
- *A region the field points into everywhere is a trap.* This is Artigue's area
  theorem, and it is the tool for the cases the first one does not reach ---
  where the boundary you care about is _not_ itself a solution curve. It is what
  makes a bounded-from-below or eventually-monotone claim provable rather than
  merely visible.

Naming the two, once, and saying which one a given picture argument is using, is
the cheapest upgrade available to the course.

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

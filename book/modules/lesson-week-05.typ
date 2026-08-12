This week is about:
- Phase portraits.
- Interpreting phase portraits in the context of a model.

== Phase portraits

Phase portraits will be our key qualitative tool for analyzing systems of differential equations.
They are motivated in @ex:3d_slope_field by the need to visualize many variables at once.

We give a strict definition of a phase portrait in this book: it is a vector field. While other
texts call the ensemble of a vector field with sample solutions and possibly shaded regions a "phase
portrait", we keep the definition strict so that we can distinguish between solution curves in phase
space and the phase portrait.

=== Standards for drawing

State your expectations for hand-drawn phase portraits clearly to the students. Make sure to specify
- When do you have enough arrows? (Sufficient to see what is happening and in every quadrant.)
- Arrows are drawn with straight tails.
- Arrow lengths reflect solution speed. (The arrows will typically be short near equilibria and
  longer far away.)

We mainly study continuous systems, so the phase portraits will be graphs of continuous vector
fields. Students will not be familiar with what a continuous vector field looks like, so take some
time to discuss it (arrows don't instantly change direction, including making sharp turns; they
don't instantly change length; etc.).

=== Two-dimensional vs one-dimensional

We start with two-dimensional phase portraits because students are more familiar with graphing and
interpreting vectors in a plane.#footnote[Those who teach linear algebra will know that the students
  find $RR^1$ a more challenging vector space than $RR^2$.]

== Interpreting phase portraits---The _Tree Model_

@ex:tree_model introduces the _Tree Model_, which is a model for a sinking tree with a single
parameter. This model will reoccur in future lessons, and studying this model will motivate the
course until @mod:linearization (where we study linearization). Right now, we can't do much more
than visually inspect the phase portrait or make numerical simulations---one conclusion of this week
is *we need analytic tools*, because stability can be difficult to determine from the phase
portrait.

The tree model is also the first time we interpret what stability means in context. Students may be
lost on how to apply their "math" knowledge to a real-world tree.

// === How other texts frame this

// *Our narrow definition of "phase portrait" is genuinely ours.* Zill, Lebl, Blanchard, Judson and
// Boyce all use the term for a plot of *trajectories*. Expect students who look things up to hit this,
// and expect it in anything they read next year. Say the definition is a local convention and say why:
// we want a name for the object that shows all solutions at once, before any solution has been drawn.

// Blanchard supplies the vocabulary we are missing for the arrow-length standard. He distinguishes a
// *vector field* (arrows drawn at their true lengths) from a *direction field* (all arrows scaled to
// the same short length, so they don't overlap). What we call a phase portrait is his vector field,
// and "arrow lengths short near equilibria" is precisely the demand that students not silently draw a
// direction field. Naming the two pictures makes the standard sound principled rather than fussy.

// Trench states the mathematics behind the traffic-map analogy, and it is worth having in your head
// even if you don't say it: if $y(t)$ is a solution then so is $y(t - tau)$, and *the two have the
// same trajectory*; conversely, two solutions with the same trajectory differ only by a time shift.
// That is what "we gave up seeing time" buys---every time-translate of a solution collapses onto one
// curve, which is why finitely many curves can stand for all solutions.

== Education literature

#cite(<trigueros2000>, form: "prose") reported that students who could solve a system of
differential equations were not able to interpret their solutions. They also note that "the meaning
of a point in phase space proved to be a problem to most of the students in both groups. They were
not able to see it as a representation of the state of an autonomous system at a particular time
_even when they were able to solve the system_."

#cite(<keene2007dynamic>, form: "prose") documents students using a multi-dimensional component
space (with two dependent variables + time as axes) to interpret paths in phase space. One student
stated: "you are looking from infinity down, you are seeing all of $t$." Keene's approach differs
from this book's, though. While Keene introduces phase space and then asks students to interpret, we
discuss the difficulties of 3d visualization and introduce phase space as a remedy.

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

// We have questions about the tree model. We will start developing techniques to answer these questions. Matrix techniques is our primary method.

// Matrix form is not the same as affine form.

// Make announcements to students to review linear algebra before this week. (list what they need to review)


- Some students have had abstract linear algebra with abstract vector spaces. Some have had linear
  algebra in $RR^n$ only.

== AI Draft

=== Announce a linear algebra review

Tell students *before* this week to review, and list the topics rather than saying "review linear
algebra":

- vectors, matrices, and the matrix--vector product;
- span, linear independence, basis, and dimension;
- subspaces, and null space / kernel;
- eigenvalues and eigenvectors, and how to compute them by hand for a $2 times 2$ matrix.

The _Linear Algebra_ appendix has a review. Expect the computations to be rusty anyway; the first exercise
that needs an eigenvector is a good place to let them discover this and send them to study.

Backgrounds differ: some students have seen abstract vector spaces, others only $RR^n$. Statements
about "the space of solutions" will land very differently across the room, so give the concrete
version first and the abstract framing second.

=== Where the week is headed

We left the tree model last week unable to classify its equilibria. This week we start building the
tool: solve the systems we _can_ solve exactly, and read the stability off the eigenvalues.

Keep *matrix form* ($arrow(r)' = A arrow(r)$) and *affine form* ($arrow(r)' = A arrow(r) +
arrow(b)$) distinct in your own head from the start. Students meet only matrix form this week;
affine form is next week's problem. Don't make a production of the distinction yet, but don't blur
it either.

=== Notes on running it

- The goal of the solution-space material is narrow: students should be able to justify *when they
  have all the solutions*. Dimension is the tool; we do not prove the dimension theorem in lecture
  (the proof is in the practice problems, and past attempts to present it confused most of the
  class).
- To check that two solutions are linearly independent, plug in a value of $t$ and look at the
  resulting vectors. That is sufficient for this course; do not introduce the Wronskian.
- Physics students may know this as the *superposition principle*. Mention the term once, then use
  the linear algebra language.
- The hard justification of the week: why is the graph of an eigen solution a straight line through
  the origin? The answer is that at a point $arrow(r)(t)$ on the graph, the phase-portrait arrow is
  $arrow(r)thin'(t) = lambda arrow(r)(t)$, so it must point directly toward or away from the origin.
  Students find thinking of $arrow(r)(t)$ as a vector from the origin genuinely awkward. Plan for
  this to take real time.
- Students will propose incompatible eigen solutions, e.g. $mat(e^t; 0)$ and $mat(e^(-t); 0)$. Both
  are fine answers; they just can't both come from the same matrix. Say so and pick one.
- The phase-portrait exercises here should be drawn *by hand*, not generated in Desmos.

=== How other texts frame this

Worth knowing when the hard justification eats your hour: *it is the right hard thing, and one
major text agrees.* Blanchard--Devaney--Hall's section is titled "Straight-Line Solutions" and
opens by rejecting the algebraic route---"the guess-and-test method is unsatisfying because it does
not give us any understanding of where the formulas came from in the first place. In this section
we use the *geometry of the vector field* to find special solutions." Students look at the
direction field, notice the two special lines through the origin, and are then led to "we seek
vectors $arrow(v)$ such that $A arrow(v)$ points in the same or the opposite direction as
$arrow(v)$", i.e. $A arrow(v) = lambda arrow(v)$. The eigenvalue equation is _derived from the
picture_, and the sign of $lambda$ is read off as toward-or-away before any characteristic
polynomial appears. Lebl has the same argument, but afterwards, to explain a picture the algebra
already produced.

The other four texts (Zill, Boyce, Trench, Wiggins) substitute $arrow(r) = arrow(v) e^(lambda t)$,
cancel, and take determinants. If a student asks why we are doing it the slow way, that is the
honest answer: the fast way gives the formula and not the reason.

Two smaller alignments. Boyce and Trench both use the Wronskian for independence, so a student may
raise it---our plug-in-a-value-of-$t$ check is sufficient here and we are not obliged to justify
avoiding it. And most texts organize the classification via the *trace--determinant plane*, which
we skip in favour of the signs of the two eigenvalues; a student who has met it is not doing
anything wrong.

== Education literature

*Drawing eigen solutions before computing eigenvalues is an argued position, not
an eccentricity.* #cite(<rasmussen2003eigenvectors>, form: "prose") make the case
for the _eigenvector-first_ (or slope-first) approach against the traditional
order, on the grounds that it fits how students actually reason. Their sequence
is prediction, exploration, mathematization, generalization --- close to how this
week is already built. @bouhjar2018eigen examine procedural against conceptual
understanding of eigenvectors and eigenvalues under inquiry-oriented instruction.

Two things in that paper are worth knowing while you teach the hard moment.

- *The hard moment is the payoff, not a defect.* Justifying that an eigen
  solution's graph is a ray, because the arrow at $arrow(r)(t)$ must be
  $lambda arrow(r)(t)$, is the whole point of the ordering.
- *Their reform course still teaches the standard method afterwards,* explicitly
  as the destination: students "are eventually introduced to the conventional
  terminology... and the more traditional method of finding eigenvalues before
  eigenvectors. As such, students are in a much better conceptual position to
  appreciate the significance of first finding eigenvalues." Their student's
  summary is a good thing to read to a class finding this slow: "While I later
  came to prefer the eigenvalue method, I think that [the slope-first method]
  helped me gain a conceptual understanding of what a straight-line solution
  was."

*You are already using the uniqueness theorem this week.* The argument that a
general solution to a matrix system covers every initial value problem is
existence and uniqueness doing work, and the counterexample where it fails is the
theorem earning its place. #cite(<rasmussen2008theorems>, form: "prose") found
that students who had used a theorem as a tool went on to invoke it
spontaneously on tasks that had not asked for it. Naming it here costs one
sentence and makes Week 11 less abrupt.

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

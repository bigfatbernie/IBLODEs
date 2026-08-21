== AI Draft

This week finishes the eigenvalue story for matrix systems and then breaks it: the models students
actually build are *affine*, not matrix, systems. The fix---re-centring at the equilibrium---is the
main idea of the week.

The midterm follows this week, so plan a wrap-up that states clearly which pieces are now
"tools you own": matrix form, eigen solutions, general solutions, and classification by eigenvalues.

=== Finishing matrix systems

The first exercises ask students to sketch phase portraits from nothing but the signs of two
eigenvalues, and then to assemble the classification table.

- Ask for *five* example solutions rather than two, or students will list five eigen solutions and
  never produce a non-eigen one. Keep asking until someone gives one.
- Asking students to trace a solution with a finger in the air is a reliable way to get the whole
  room participating.
- The "one positive eigenvalue, one zero eigenvalue" case is much harder than the others. It is fine
  to do that one together during discussion.
- Restate the drawing standards (arrow count, arrow lengths, all quadrants) while sketching. This is
  the last unhurried chance before the midterm.
- If the classification table from the earlier sketching exercise is still on the board, reuse it and
  relabel the columns with $lambda_1$ and $lambda_2$. Leaving it up is itself a hint.
- When students stall finding eigenvalues, try "remind your neighbour how to find the eigenvalues of
  a $2 times 2$ matrix" rather than doing it on the board.

=== Affine systems

The social media model is built from premises, as usual. Two things to prepare:

- Explain what "ignoring all else" means before they start. The image to give them is covering up
  every other term in the equation: if height increases with sunlight and decreases with
  temperature, then ignoring all else _but_ sunlight, $H'$ is positive.
- Students who solve for the equilibrium and get an expression with the parameter in a denominator
  will announce that there is no equilibrium at that parameter value. When a formula breaks down,
  they must go back to the original equations and check---not conclude.

*The re-centring exercises are the hardest part of the week*, and together they take a long time.
The sequence is: show the model _cannot_ be written as $arrow(r)' = M arrow(r)$; define
$arrow(s) = arrow(r) - arrow(E)$, the displacement from equilibrium; discover that $arrow(s)$ _does_
satisfy a matrix system; classify that.

- Students are not thinking of $arrow(r)(t)$ and $arrow(E)$ as vectors from the origin. Have them
  sketch both.
- The constant terms "magically" cancel. Make sure students notice this rather than letting it slide
  past; most will get there by substitution, and the general linear-algebra version is worth showing
  afterwards.
- A student may propose writing $arrow(r) = (x, y, 1)$ to force the system into matrix form. This is
  a genuinely clever idea and it does produce the right answer formally, but the set of such vectors
  is not a subspace, so the eigen theory doesn't apply as stated. Be ready to give it the credit it
  deserves without endorsing it.

The final exercise---inferring parameter values and initial conditions from claims people make about
the model---is a good one but *can be skipped* if time is short.

=== How other texts frame this

This is the week where we depart most sharply from everyone else, and it is worth knowing in which
direction.

*Nobody else treats affine systems this way.* Zill, Lebl, Boyce and Trench all file
$arrow(r)' = A arrow(r) + arrow(b)$ under _nonhomogeneous systems_ and attack it with undetermined
coefficients, variation of parameters or diagonalization---machinery built for a general forcing
term $arrow(f)(t)$, in which a constant $arrow(b)$ is an unremarkable special case. The particular
solution they compute _is_ the equilibrium, but no text says so, and no picture is drawn. Blanchard
and Judson skip nonhomogeneous systems entirely.

*But the substitution itself is completely standard---one chapter later.* Blanchard, Boyce, Lebl
and Wiggins all introduce $arrow(u) = arrow(r) - arrow(E)$ when they linearize a nonlinear system,
and give our motivation for it. Blanchard: "Linear systems always have an equilibrium point at the
origin. Hence the first step... is to move the equilibrium point to the origin via a change of
variables." Boyce: "This involves no loss of generality." Wiggins runs the general version,
$arrow(x) = arrow(y) + arrow(x)(t)$ about _any_ solution, as the organizing device for his whole
book.

So what we are really doing this week is teaching the Week 9 move early, on a case where students
can verify it by hand. That is worth saying to yourself when the hour disappears: the algebra they
grind through here is the algebra that makes linearization feel inevitable in Week 9, and they will
see it a second time.

== Education literature

*There is none, and that is the finding.* Of the seventeen design decisions
cross-referenced in the companion report, the affine re-centring sequence is the
one with no published study of student thinking behind it. Nobody has written
about using the displacement substitution as the _route into_ affine systems in a
first course, before linearization, and nobody has reported how beginners cope
with it. Your multi-instructor notes are currently the best documentation that
exists --- including the recurring student proposal to append a constant
coordinate and force the system into matrix form.

Two things narrow the claim, and both are useful in class.

- *The substitution itself is routine one chapter along.*
  #cite(<blanchard2012de>, form: "prose") give this book's own motivation when
  they linearize --- "Linear systems always have an equilibrium point at the
  origin. Hence the first step... is to move the equilibrium point to the origin
  via a change of variables" --- and #cite(<boyce2017elementary>, form: "prose")
  adds "This involves no loss of generality." If a student asks whether this is a
  trick invented for the course, it is not.
- *It is routine one course up.* Toronto's MAT267 @mat267 sets exactly this move
  as an assignment, and then asks two questions we do not. When $A$ is singular
  there are infinitely many steady states: do different choices give the same
  phase portrait? And when there is _no_ steady state the substitution is
  unavailable. Both make good extensions for a group that finishes early, and the
  second is the principled answer to the append-a-constant-coordinate proposal.

*If you keep notes on how this hour goes, they are publishable.* _PRIMUS_ and the
_CODEE Journal_ both take task-sequence-plus-classroom-evidence articles, and
this is the most original teaching content in the book.

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

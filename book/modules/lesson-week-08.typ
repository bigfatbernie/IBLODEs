// Have students work on the complex number appendix before this week

// We take the linear combination approach, not the real/imag part approach to finding real solutions.

== AI Draft

=== Before the week

Assign the _Complex Numbers_ appendix ahead of time. Students need complex arithmetic and Euler's formula to be
_recall_, not discovery, or the week collapses. Almost none of them will have seen Euler's formula
recently.

=== The arc

A new model (fleas and dogs) is built from premises, turned into affine form, and re-centred into a
matrix system---all of which is now routine. What is new is that the eigenvalues come out complex.

The three "general solution" exercises function as *one very long question*. Plan them as a unit and
protect the time.

=== Real solutions from complex ones

We deliberately do *not* use the textbook trick of taking real and imaginary parts of a complex
solution. Instead, students form the specific linear combinations $arrow(s)_1 + arrow(s)_2$ and
$i (arrow(s)_1 - arrow(s)_2)$ and expand with Euler's formula.

The trick is easier to memorize; the linear combinations are what we want students to understand.
Every real solution we can build is a linear combination of the solutions we already have, and that
idea carries forward. If a student asks whether those two combinations always work, the answer is
"yes, unless the equation itself has complex coefficients"; the general recipe is to solve for
constants $alpha, beta$ making $alpha arrow(s)_1 + beta arrow(s)_2$ real.

Practical notes:

- The expansions take a long time. Do *one* of them on the board and no more; don't wait for the
  whole class to finish the algebra before moving to discussion.
- Complex eigenvectors are where students slow to a crawl. Consider announcing partway through that
  they may use a computer---but then say explicitly what your test expectations are, because a
  computer will hand them a different (equally correct) eigenvector than the one the next exercise
  uses.
- Verifying a solution is real can be done geometrically: plot it on top of the phase portrait in
  Desmos as a parametric curve. Essentially no student will think of this. Show them.
- Two linearly independent eigen solutions is enough. Don't enumerate all of them.

=== Landing the week

Wrap up with the whole process written out: affine $arrow$ matrix, find a basis of eigen solutions,
combine complex ones into real ones, translate back to the affine equation. The commentary that
matters is that the matrix equation has *no* real eigen solutions at all---complex numbers are what
let us keep using eigen methods---but that only the real solutions mean anything about fleas and
dogs.

The shampoo exercise then derives the stability classification for complex eigenvalues. This part
needs some lecturing: name the eigenvectors $arrow(v)_1, arrow(v)_2$ rather than computing them, and
study the $e^(lambda t)$ factors. Tell students whether you expect them to reproduce this derivation
on a test. The final practice exercise *can be skipped*.

=== How other texts frame this

Every other text takes real and imaginary parts. Worth knowing, though, that the "trick" is not
really a trick anywhere: it is the _summary_ of our argument. Zill derives his real solutions by
forming exactly our two combinations---$1/2 (arrow(s)_1 + arrow(s)_2)$ and
$(i slash 2)(-arrow(s)_1 + arrow(s)_2)$---expanding with Euler's formula, and only then observing
that the results are $"Re"(arrow(v))$ and $"Im"(arrow(v))$ and stating that as the theorem students
use. Blanchard proves the real/imaginary-parts theorem from linearity. So we are stopping one step
short of where the standard texts stop, and keeping the reasoning as the method.

That is a useful thing to tell the class at the wrap-up: the rule they will meet in other books is
a shortcut for what they just did, and now they know why it works.

Blanchard also has the cleanest one-line motivation for the whole week, if the class asks why
complex numbers have to appear at all: "We cannot use the geometric ideas of the previous sections
to find solution curves that are straight lines *because there aren't any straight-line
solutions*."

== Education literature

*No study compares the two routes,* so treat the choice as a considered bet. The
rationale is consistent with the emergent-models strand running through
@rasmussen2007reinventing on students reinventing solutions to linear systems:
the point is that students keep operating with the structure they built rather
than switching to an opaque shortcut at the moment things get hard.

*But "the standard textbook trick" is a mischaracterisation, and the phrase is
worth dropping.* #cite(<zill2017first>, form: "prose") derives his real solutions
by forming exactly our two linear combinations, up to scale, expands them with
Euler's formula, and only _then_ observes that the results are $"Re"(K_1)$ and
$"Im"(K_1)$ --- which he packages as a theorem for students to apply.
#cite(<blanchard2012de>, form: "prose") prove the real-and-imaginary-parts
theorem from linearity rather than asserting it.

So the real-parts rule is the _summary_ of our own argument, not a rival to it.
The accurate and more interesting claim, and a good thing to say at the wrap-up,
is that we stop one step short of where the standard texts stop and keep the
reasoning as the working method. Students who read ahead will meet the theorem
and should be able to recognise it as their own calculation.

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

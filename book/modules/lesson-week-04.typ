
// The definition of *phase portrait* in the text is specific: it is a plot of the vector field, _not_
// a plot of trajectories. Though broader definitions are used elsewhere, we find restricting what a
// phase portrait is makes it useful

// We use vocab "plot in phase space" "plot in component space" to avoid confusions.

// We start with systems before doing the 1-d case because...

// Formal and inform definitions of equilibrium solutions. Don't focus on formal ones. All arguments can be done with informal definitions. 

      - A small handful of students will be confused the entire semester about whether a horizontal
        line is an equilibrium solution or not. These students are confusing phase space and
        component space.

== AI Draft

=== What this week is for

Equilibrium solutions and their classification. The week starts geometrically---find the "smallest"
curve in phase space---and only afterwards connects to the algebra of setting derivatives to zero.

Keep that order. We want students to think "an equilibrium solution is a *constant solution*", with
"the derivatives are zero" as a _property_ they derive. Students who memorize "set the derivative to
zero" as the definition will misapply it the moment they meet a non-autonomous equation.

=== Vocabulary and definitions

- Say "a plot in phase space" and "a plot in component space" throughout; the extra words prevent
  most of the confusion in this module.
- We reserve *phase portrait* for a plot of the vector field, _not_ a plot of trajectories. Broader
  definitions are common elsewhere, but the narrow one is what makes the term useful: it names the
  object that shows _all_ solutions at once. Phase portraits arrive properly next week; if a student
  uses the term now, pin the definition down.
- There are formal and informal definitions of stability given side-by-side. Give students a minute
  to read both, then work exclusively with the informal ones. Every argument in this course can be
  made informally; the formal versions are there for the students who demand precision.
- "Locally" is the sticking point. Explain that we only care about solutions starting _near_ the
  equilibrium, and that how near is "near" depends on the equation---which is why we can't put a
  number in the definition.

=== Why systems before the 1-d case

The 1-d case is mathematically easier, but *pedagogically harder*. Phase space for a system is a
plane with two labelled axes, which looks like something students have drawn before. Phase space for
a single equation is one line, which looks degenerate and unsettling to them. Since the course's
motivating models are systems anyway, we build intuition in 2-d first and generalize down to 1-d.

Draw 1-d phase space *vertically* so that it can sit beside a component-space plot with a shared
vertical axis.

=== Classification

- Write out the full classification ("stable and attracting"), not the shorthand. We want evidence
  that students understand each word separately and that more than one can apply.
- Restrict to the physically meaningful domain ($P >= 0$) when classifying.
- Save the table of which classifications can co-occur for the sketching exercise, where students
  build it from their own examples. Then tell them not to memorize it.
- "Stable but not attracting" is the example they will not produce on their own.

=== How other texts frame this

Two of our choices here are the minority position, and one is not.

*1-d first.* Every other text does the 1-d case first and the plane later---Zill, Lebl, Blanchard,
Judson, Boyce and Trench without exception. Our reason for inverting it (a line looks degenerate,
a plane looks familiar) is a pedagogical bet, not a standard practice. But we are in good company
on the *drawing*: Zill, Lebl and Blanchard all draw the phase line vertically, and Lebl gives our
reason---"since $x$ is the dependent variable we draw the axis vertically, as it appears in the
slope field diagrams."

*Constant solution first.* Lebl ("we call these constant solutions the equilibrium solutions"),
Blanchard and Trench define it as we do; Judson and Wiggins define it by setting the derivatives to
zero. Most texts also carry the term *critical point* for the corresponding point in phase space.
Students who have read ahead will have met it; it is a useful word, but it names the dot, not the
solution.

*Stable but not attracting.* This is not an exotic case elsewhere. Boyce's Theorem 9.3.1 lists
"stable, but not asymptotically stable, if $r_1$ and $r_2$ are pure imaginary" as one of three
outcomes, and Wiggins explains why the conjunction is not redundant: there are solutions that do
converge, but make large excursions on the way. If you want a ready example, a centre---the
undamped oscillator---is the one every text uses.
== Education literature

*The prediction in the notes --- that a few students will spend the term unsure
whether a horizontal line is an equilibrium solution --- is confirmed, and it has
a name.* #cite(<zandieh1999>, form: "prose") found that for many students
equilibrium solutions "do not appear to be a subset of their concept images of
solution." One cause is that an equilibrium solution is a _constant function_,
and constant functions are exactly the kind of non-paradigmatic case students
treat as a non-example of function. #cite(<rasmussen2001new>, form: "prose")
calls the general difficulty the _function-as-solution dilemma_, and
@keene2012gestures devoted a paper to how meaning for equilibrium solutions gets
built over time. The concept is slower than its one-line definition suggests;
budget accordingly.

*The specific error the derivative-zero shortcut produces.* In Rasmussen's study,
three of six students at some point claimed that $y = t$ is an equilibrium
solution of $y' = y - t$ --- the shortcut applied where it does not belong. One
went further, hunting the direction fields for a _vertical_ line of arrows,
having reasoned from $y' = t + 1$ that $t = -1$ and so "it would have to be a
vertical equilibrium solution and there's no graph like that." This is precisely
why the geometric definition comes first here.

*Give the other set a name.* Zandieh and McDonald watched students reach for
"equilibrium" to describe where the derivative vanishes, simply because nobody
had given them _isocline_ or _nullcline_ and they needed a word. Their
recommendation is to supply the label. Offering "nullcline" in passing costs one
sentence and removes the pressure that makes students overload "equilibrium."
They also note that mathematicians use "equilibrium" both for a constant
_solution_ and for a _point_ --- the distinction this course already insists on,
which is independent confirmation that it is worth the words.

*Drawing 1-d phase space vertically has evidence behind it.*
#cite(<karimifardinpour2018comparing>, form: "prose") ran three treatments
against the failure to coordinate the two planes. Only their "Dynamic" method
improved long-term prediction significantly, and its central feature is the
rotation we already use. It adds two cheap things we do not: a sign chart, and
horizontal dotted lines carrying equilibria and inflection points across from one
plane to the other. The dotted lines are credited specifically with students
getting concavity right. Caveats: 16 per group, and the reported statistics do
not always match the reported $p$-values.

*A hook worth taking rather than dropping.* The notes record an instructor
raising whether solution curves can cross an equilibrium solution and then
keeping "this talk to a minimum." That question is the motivated entry to
uniqueness, which @iode-materials reaches at Unit 5 of 14 and every comparison
textbook states in its opening chapter. Answering it here costs two minutes and
is reused in Weeks 5 and 6.

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

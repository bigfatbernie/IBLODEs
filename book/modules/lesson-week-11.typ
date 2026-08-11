// We motivate existence and uniqueness by means of boundary value problems.

// We only scratch the surface.

== AI Draft

=== The motivating question

Put a hammer on the end of the spring from last week and let it ring a bell at maximum displacement.
Can the bell ring once per second? What is the shortest achievable gap between rings? Every boundary
value problem this week comes out of that question, and the word "boundary value problem" itself
should not appear until the wrap-up.

=== Time reappears in phase space

The exercises here are the first place where *time is observable in phase space*: by simulating for
a fixed number of steps, the length of the plotted trajectory tells you how long the journey took.
This is worth naming in your wrap-up---we invented phase space by throwing away the independent
variable, and we have just found a way to see it again.

- Students will need a hint to set $N times Delta = 1$ in the Desmos applet. Ask them what happens
  to the plotted curve when they move the $Delta$ slider, and what the largest $t$ shown is. (The
  default $N$ is $970$; they should change it to something convenient.)
- "Give it a push" is not obviously an initial condition to them. Some will say it changes the
  second derivative, which is not wrong but is not the point. If they stall, ask: we need $x(0)$ and
  $x'(0)$---which do we know?

=== Numerical then analytic

We answer boundary value problems numerically first, then analytically where a formula is available.
Writing solutions as $A cos(t + d)$ rather than $A cos(t) + B sin(t)$ is deliberate: the first form
makes the period easy to reason about.

The punchline of the last boundary value problem exercise is that innocuous-looking boundary
conditions give *no solution*, *exactly one solution*, or *infinitely many*. Students find this
exercise easy; its job is to make them want an existence and uniqueness theorem. That is the bridge
into the final exercise.

=== Existence and uniqueness

We only scratch the surface, and it is worth being honest with students about that.

- Rewriting equations in the form $F(t, x, x', dots) = 0$ will be very easy for them. The reason we
  bother is that it makes a differential equation look like a level-set problem, so multivariable
  calculus tools become available.
- The theorem we state applies to first-order _linear_ equations. Watch for students concluding that
  because the theorem does not apply, no solution exists---the theorem gives no information in that
  case. Include examples where a solution exists anyway.
- Students get anxious about how much of this they are responsible for on the exam. Decide in
  advance and tell them plainly; the anxiety otherwise crowds out the ideas.
- Context for the wrap-up: general theorems about differential equations are *hard*, most equations
  have no closed-form solution, and existence/uniqueness results are what tell us whether numerical
  methods have any hope. To a mathematician this is the _first_ question to ask about an equation.
  Students continuing to partial differential equations will meet boundary value problems of exactly
  this type when they see separation of variables.

=== How other texts frame this

*We are the outlier on placement, and it is worth being deliberate about it.* Every other text
states an existence and uniqueness theorem in its first weeks: Zill in §1.2, Boyce in §2.8, Trench
in §2.3, Judson in §1.6, Blanchard in §1.5 and again for systems in §2.6. Wiggins reaches it in
chapter 1 and handles it the way we would like to---"the standard way of treating this in an ODE
course is to 'prove a big theorem'... Rather than do that, we will consider some examples that
illustrate the main issues"---but still in week 1. Our late, light treatment is a real choice, and
students who have read another book will have met the theorem long before this.

One consequence: the other texts get to _use_ uniqueness all term. Blanchard leans on it in the
phase plane (solution curves cannot cross, so a closed trajectory traps everything inside it), and
Trench states it as a numbered fact---"distinct trajectories can't intersect; if two trajectories
intersect, they are identical". We rely on that same fact in Weeks 4--6 without naming it. If you
want to strengthen this week cheaply, point back to where we already used it.

*A free analogy we are not taking.* Boyce introduces two-point boundary value problems by comparing
them to $A arrow(x) = arrow(b)$: when $A$ is invertible there is exactly one solution; when it is
not, there is either no solution or infinitely many. Our students have just spent five weeks on
$2 times 2$ matrices, so the no-solution/one/infinitely-many trichotomy is a structure they already
own. Worth a sentence in the wrap-up.

== Education literature

*This is the one placement decision in the course that the literature argues
against.* Everything else in the companion report either survives contact with
the research or sits in a gap where nothing has been studied. This does not.

#cite(<rasmussen2008theorems>, form: "prose") take the uniqueness theorem for
first-order equations as their case study. Their starting point is that "students
in many undergraduate mathematics courses tend not to readily and appropriately
use theorems as tools for making arguments and solving problems," and their
contribution is an account of the conditions under which their students did. They
report that project students used the theorem as a problem-solving tool
significantly more than conventionally taught students, and that after
instruction students invoked it _spontaneously_ on tasks that had not asked for
it. Note what the chapter does and does not argue: it is about how a theorem
becomes usable, not about where in a syllabus it belongs.

*Every comparator places it earlier.* @iode-materials reaches uniqueness at Unit
5 of 14, motivated by a helicopter whose two candidate descent models are
$h' = -h$ and $h' = -h^(1 slash 3)$, only one of which lands it. The traditional
MAT244 reaches it in week 4, MAT267 builds its whole linear theory on it, all
three CUPM sample syllabi @devaney-cupm put it in the opening first-order block,
and all seven comparison textbooks state a theorem in their first chapter.
#cite(<wiggins-ode>, form: "prose") is the most uncomfortable, because he shares
our view of _how_ to treat it and differs only on _when_: "The standard way of
treating this in an ODE course is to 'prove a big theorem' about existence and
uniqueness. Rather than do that... we will consider some examples that illustrate
the main issues." Counterexamples first, theorem second, no proof --- in week 1.

*What early placement buys them is the part worth stealing.*
#cite(<blanchard2012de>, form: "prose") use uniqueness in the phase plane to
argue that solution curves cannot cross, so a closed trajectory traps everything
inside it. #cite(<trench2013elementary>, form: "prose") states it as a numbered
fact: "Distinct trajectories can't intersect." @judson2025odeproject attaches it
to equilibria. That is the same fact this course leans on in Weeks 4 to 6 without
naming, so the theorem arrives in Week 11 having already done a term's work
invisibly.

*The dissent, which is serious.* #cite(<rota1997ten>, form: "prose") devotes his
fifth lesson to "Forget about existence and uniqueness of solutions," calling
existence theorems "psychological theorems... instances of those results of
mathematics that make little difference." He concedes uniqueness is "a touchier
point" and admits he never made the argument convincing to students. Our late,
light treatment has a distinguished defender; it is just not the position the
empirical work supports.

*On boundary value problems there is almost nothing.* @lozada2021review, a
systematic review of 120 articles, found existence and uniqueness for first-order
scalar equations treated in only four of them, and named it a topic where
research is "incipient."

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

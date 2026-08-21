// Outline general approach of converting second-order to first order.

// [Review the last time students used Excel. Maybe put a comment in those lessons that if you want students to be well practiced, have them do some practice in tutorials.]

// Not using a "memorize new method" approach to higher order means that we get to see if a student actually understands!

// Ex @ex:higher_order_to_system_details gives a desmos link with Euler's built in. Explain why now.

== AI Draft

=== Start with linearization practice

The week opens with a linearization exercise that has no model and no parameter---just the
technique. After the tree model, students need to see the process without the surrounding
complexity. *Don't skip it* if last week felt shaky; going slower here is worth it this late in the
term. Use the discussion to summarize the whole linearization procedure.

=== Higher-order equations: the approach

We do not teach a new solution method for higher-order equations. The approach is:

+ Model with a second-order equation (spring: Hooke's law plus Newton's second law).
+ Extend Euler's method by hand to handle a second derivative.
+ Introduce $y = x'$ and rewrite the equation as a first-order system.
+ Apply everything we already know: simulation, phase portraits, eigen methods, linearization.

The reason for this route is worth stating to yourself as well as to them: because there is no new
method to memorize, a student who can do these problems has actually understood the systems
material. That is also why the wrap-up matters---put the modified-Euler spreadsheet and the
system-based spreadsheet side by side and show the numbers are *identical*, the system version just
having one extra column.

- Some students (usually physics students) will propose using the just-updated $x_(n+1)$ when
  computing $x'_(n+1)$. This is more stable, but stay with the naive extension, because that is what
  matches the first-order system.
- Students turned off by "laws of physics" should be reminded that laws are just premises with a
  fancier name.

=== Spreadsheets, again

This is the first spreadsheet students have built from scratch since the tree model in Week 5, and
they will be rusty. Budget for it. If you want them fluent at this point in the term, spreadsheet
practice needs to be happening in tutorials in the intervening weeks.

The culminating exercise gives a Desmos link with Euler's method *built in*. Tell students this is
deliberate: they have demonstrated they can simulate on their own, so from here the tool is theirs
to use for exploring faster. Announce that they should use that link and not the ones from earlier
exercises.

=== Reading phase portraits from higher-order equations

This is the hard part of the week and the reason the last exercise exists. One axis is $x'$, not an
independent variable, and students do not naturally interpret it.

- A trajectory heading _downward_ in phase space can correspond to an _increasing_ solution of the
  original equation. Make sure the meaning of the vertical axis comes up explicitly: above the
  horizontal axis, $x' > 0$, so $x$ is increasing.
- Equilibrium solutions of a higher-order equation are asked about for the first time. The
  definition is unchanged (a constant solution); students may just need reminding that verifying a
  proposed constant solution only requires substitution.
- When solving via eigenvalues, let students use a computer, and steer them to eigenvectors
  normalized so the first coordinate is $1$. Point out as a class that only the first coordinate of
  the general solution is needed---this halves the work.

=== How other texts frame this

Three routes exist through higher-order equations, and we should be clear which one we are on.

+ *Second order first, as its own theory* (Zill, Boyce, Trench, Lebl): characteristic equations,
  undetermined coefficients, variation of parameters---a chapter of methods to memorize---and
  systems arrive later, sometimes solved by _elimination back into_ a higher-order equation.
+ *Systems first, second order as a special case* (Blanchard, Judson, and us): set $y = x'$ and
  reuse everything. This is now well established, not idiosyncratic, though it is still the
  minority in syllabi.
+ *Neither*: Trench reduces $x'' = F(x, x')$ to the first-order equation $v (d v slash d x) =
  F(x, v)$ in the "Poincaré phase plane", getting phase portraits for second-order equations
  without eigenvalues at all.

Route 2 is what makes our claim in the notes above true---because there is no new method, doing
these problems is evidence of understanding. It is worth saying that out loud to students who have
a friend in a traditional course and feel they are missing content: they are not being shown less,
they are being asked to reuse more.

The vertical-axis difficulty is ours to solve; no text treats it, which is why the last exercise
exists.
== Education literature

*Thin, and the practice base is stronger than the research base.*
#cite(<naranjo2024sophisticated>, form: "prose") on constructing differential
equations in physical contexts is the nearest neighbour. The specific difficulty
this week identifies --- that one axis of the phase plane is $x'$, so a
trajectory heading downward can correspond to an increasing solution --- appears
in the research record only glancingly, and *none of the seven comparison
textbooks treats it at all.* If you find a way of explaining it that works, it is
worth writing down; nobody else has.

On the ordering, we are in a minority but not alone.
#cite(<blanchard2012de>, form: "prose") state our policy in the preface ---
"Rather than consider second-order equations separately, we convert these
equations to first-order systems. When these equations are viewed as systems, we
are able to use qualitative and numerical techniques more readily" --- and
@judson2025odeproject likewise reaches second-order only after linear systems.
Zill, Boyce, Lebl and Trench go the other way, as do all three sample syllabi in
the MAA curriculum working group report @devaney-cupm. That report does endorse
our mechanism, though: "it is natural to convert second order linear differential
equations to planar systems... so solutions can then be visualized in the phase
plane."

So the argument for doing it this way is real, but it is an argument rather than
a consensus, and students consulting another book will find the other order.

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

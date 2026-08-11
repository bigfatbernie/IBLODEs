
// Have a Euler quiz before this week

This week is about inter-related quantities and how they result in systems of ODEs. This week is not
about solving, but about visualizing via component graphs and phase space.

In this class we distinguish the following:
- Component space (a coordinate system with the independent and dependent variables as axes)
- Phase space/phase plane (a coordinate system with the dependent variables as axes)
- Phase portrait, introduced in the next module XXX, (a plot of the vector field whose vectors come
  from the derivatives)
- Graphs in component space/phase space

We distinguish between these because sometimes we want to analyze a specific solution and sometimes
we want to visualize "all solutions". Students initially struggle with this distinction, but when
they get it, it helps break problems into steps (e.g., "first label the axes of the phase plane",
"next, plot a solution to the IVP", etc..).

// Strategy is to bootstrap population models, adding complexity -> LV systems as an excuse to study systems.

// Emphasize we use the terms "graphs in component space/phase space" and try to avoid saying "phase plot" or "component graphs".

// Should we tell instructors to avoid mentioning autonomous? Or not??

== AI Draft

=== Strategy

The week bootstraps off the population models from Weeks 1--2: add a death rate, let the rates
depend on the population, and you are forced into a *system*. Lotka--Volterra is the excuse to study
systems, and it becomes the canonical example for the next two weeks. Students shouldn't find the
modelling hard by now; the new content is simulating and _visualizing_ two interacting quantities.

Run an Euler's method quiz before this week. Simulating a system is the first exercise where a
student without a working 1-d simulation is genuinely stuck.

=== Vocabulary

Say "a graph in component space" and "a graph in phase space". Avoid "phase plot" and "component
graph"---the shorter names blur the distinction between the _space_ and a _graph drawn in it_, and
that distinction is exactly what students are struggling to build. Correct yourself in front of the
class when you slip; it advertises that the wording is deliberate.

We suggest *not* introducing the word "autonomous" this week. It isn't needed for anything we do,
and it competes for attention with component/phase space. If you do want it, put it in a tutorial or
homework, and define it properly---students who half-remember it will later apply "set the
derivative to zero" to non-autonomous equations. (This is a judgement call; instructors have
disagreed.)

=== Running the exercises

- *Step size.* Some students will simulate the fox--rabbit system once per year. Ask them whether
  they believe populations should be checked annually. Push both arguments: smaller is always
  better, _and_ the units of $t$ should sound reasonable for the situation being modelled.
- `#N/A` and absurd numbers mean numerical instability, not a broken spreadsheet. Tell them to
  shrink the step size.
- Have students start a *blank* spreadsheet rather than editing an old one.
- The "do the peaks get closer as $Delta$ shrinks?" parts are hard. Discuss the shape of the
  solution first, establish a baseline, and then conclude with a model answer---this is the style of
  argument you want on homework and exams.
- Stay in component space until the phase space exercise. Introducing phase graphs early undercuts
  the payoff.
- Phase space is students' first chance to practice *reading a definition on their own*. Name that
  skill when you assign it.

=== How other texts frame this

Our *phase space* is standard: Wiggins opens his book with "the (vector) space of dependent
variables is referred to as the phase space of the ODE", and Blanchard calls the $R F$-plane the
phase plane. What is ours alone is *component space*---no text names the other picture, which is
part of why students never learn to tell them apart.

The technique the other texts have and we do not is *nullclines*: draw the curves
$d x slash d t = 0$ and $d y slash d t = 0$, mark the vertical and horizontal crossings on them,
and read off the sign of each derivative in the regions between. Judson and Blanchard both build
their hand-drawn phase-plane work on it, and equilibria fall out as the intersections. We get the
same information from simulation and the phase portrait instead. If a student arrives already
knowing nullclines, that is compatible with everything we do---but do not introduce them here, or
the phase-portrait payoff in Week 5 lands early and weakly.

On the rates-versus-amounts confusion: Trench heads it off notationally, writing $P' = a(P) P$ and
saying in words that $a$ is "the rate of change of population per unit time *per individual*."
Saying "per individual" out loud costs nothing and is worth doing.

== Education literature

*The instructor note about $B$ and $D$ being confused with counts is a
documented, predictable phenomenon, not a local observation.*
#cite(<rowland2004interpretations>, form: "prose") gave 44 students a diagnostic
quiz: *20 of them (45%) used amount-type thinking on both questions,* and only
eight got both right. Asked what the constant term in a drug-infusion model
meant, students called it an initial amount, a maximum, or an equilibrium
amount --- anything but a rate.

The same paper reports interviews on units: five of eight students gave
$d D slash d t$ the units mg/h while giving the constant term the units mg; two
of those five noticed the inconsistency but could not resolve it, and two others
"explicitly stated their belief that the units did not have to be consistent."
The follow-up study @rowland2006units quantifies the spread: of 42 students who
described a term as some sort of "rate", only eight gave it rate units.

Two consequences for this week. Asking for the units of every term is not
pedantry, it is the diagnostic. And the students who cannot do it are unlikely to
volunteer that fact, so ask the whole room rather than waiting for a hand.

#cite(<naranjo2024sophisticated>, form: "prose") analyse how students set up
differential equations for physical contexts and argue that flexibility across
several set-up strategies predicts success --- relevant if you extend the
modelling here.

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

The second week is about:
- Motivating why we study differential equations-based models instead of other types of models.
- Derive, motivate, and use Euler's method to simulate solutions to differential equations.
// - Explore sources of error in Euler's method.

// Note: have a spreadsheet/modelling quiz after this week

// Many skippable problems :-(

// Ex 7 is one of the main thrusts. Take time to do it well, motivates whole course

// Note about 12 and 13 and how they take the time you have left (but no more); 13 can be skipped


== Motivating differential equations-based models

When modelling, there are lots of approaches one can take. For the starfish, we started with a
discrete model. Why would we want anything else? *This question is answered in
@ex:pros_and_cons_table*. Take time to do this exercise well as the whole course is motivated by
studying differential equations-based models.

Differential equations themselves are motivated by taking a limit of a discrete model (as time
intervals shrink to zero). Simulations of this limiting process foreshadow Euler's method.

== Euler's method

We rarely "solve" (i.e., get a formula as a solution) differential equations in this course.
Instead, we rely on simulation and, in later weeks, on qualitative analysis. Euler's method is how
we simulate.

Exercise @q:yearly_starfish has students derive Euler's method. It then has them simulate.
Simulation will be used in class again and again (emphasize this).

One common misunderstanding to keep in mind: Students are used to tangent line formulas that look
like "$f(x) approx f(a) + f'(a)(x-a)$". However, we want to focus on the form
"$f(a + Delta) approx f(a) + Delta f'(a)$". Budget time to relate these forms to each other.

=== Spreadsheet expectations

Set expectations: students should be able to go from a blank spreadsheet to a working simulation in
under five minutes. Having an Euler Quiz will help reinforce this expectation.

=== Euler Quiz

Since Euler's method is so fundamental to the course, it is worth having an Euler's method quiz
after this week. The format of the quiz is: here is a basic model described by a differential
equation. Simulate it and answer some basic questions (e.g., what are the max/min values the model
predicts, or when is the first time the model reaches a certain value; _but_ make sure the Euler
quiz questions are phrased in the context of a model---we do Euler's method not for fun, but to
answer real questions!).

== Modelling hour

The capstone of the week is @ex:models_MNO[Core Exercises] and @ex:model_growth_comparison[]. These
exercises introduce two new models and are meant to fill time for a one hour class focused on
modelling practice (there is more than an hour's worth of material here). Don't rush through these
exercises. Usually you will only talk about one of the two new models. The rest can be left as
homework.

== Education literature

#cite(<rasmussen2001new>, form: "prose") noted three conceptual models student held about Euler's
method. The two incorrect models are: (a) that the approximation _inscribes_ the exact solution the
way a polygon inscribes a circle, and (b) that each step uses the slope of the _exact_ solution.

#cite(<rasmussen2019waypoints>, form: "prose") divide the understanding of solutions to differential
equations into five _waypoints_. Waypoints 1 and 2 relate to Euler's method, with waypoint 1 ("constant slope function")
and waypoint 2 ("discretely changing ratio function") targeted in @q:yearly_starfish. 

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

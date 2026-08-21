
// Have a Euler quiz before this week

This week is about:
- Modelling with inter-related quantities and how they result in systems of ODEs.
- Visualizing the behaviour of solutions via graphs in component and phase spaces.
//  - This week is *not* about solving.

== Modelling with inter-related quantities

Real-world models usually involve multiple interacting quantities. The main thrust of the course is
developing tools to analyze these models, so we are quickly moving from one-dimensional models to
multi-dimensional systems.

=== Why start with systems so early?

There are plenty of techniques applicable to one-dimensional models yet to study, including the
capstone of the course, linearization. However,
- Autonomous one-dimensional models don't have much variety in their solutions.
- Concepts like phase space are less intuitive in one dimension. After all, why would you go from a
  2d plot to a 1d plot and lose information when complete information already fits on the page?
- Autonomous equations in one dimension are separable. Despite most functions not having a
  close-form antiderivative, we want to distance ourselves from the "integrate it" mindset.


== Visualizing the behaviour of solutions (graphs in component and phase spaces)

The definitions we use in this course are:
- Component space: a coordinate system with the independent and _a_ dependent variable as axes.
- Phase space: a coordinate system with the dependent variable(s) as axes.
- Phase portrait (introduced in @mod:phase-portraits): a plot of the vector field in phase space
  whose vectors are tangent to solutions and whose length is given by the speed of the solution.

Of note, we always use the terms "component *space*", "phase *space*"#footnote[
  You may decide to call this the "phase plane", but keeping the word space is more consistent.],
and "graphs in component/phase *space*" and avoid terms like "phase plots"---the shorter names blur
the distinction between the _space_ and a _graph drawn in it_. Correct yourself in front of the
class if you slip up; it advertises that the wording is deliberate.

=== Two-dimensional phase space is first

We emphasize two-dimensional phase space because it is easier to motivate and more relatable to
students. Students are used to seeing graphs in 2d, whereas 1d graphs are unusual (and if you
actually graph solutions in a 1d phase space, they are either points, line segments, or rays).
Further, it is difficult for students to recognize a need for 2d phase---if you are studying a
single autonomous equation, why would you look at the phase space rather than full graphs in
component space?

=== The term "Autonomous"

Plots in phase space make sense for autonomous equations. However, at this point don't stress the
autonomous requirement. When students have a better understanding of phase space (and
multi-dimensional modelling), you can talk about when "phase space fails".

=== A mapping analogy

Students are already familiar with phase space and component space, but they might not realize from
where: maps. For instance, if you plan a trip with Google Maps, the map will show a trace of your
prospective journey. Information about time/speed is absent from the map itself, however, one can
imagine plotting their coordinates vs. time to get "component graphs" for their prospective journey.

Later on, after the introduction of phase portraits in @mod:phase-portraits, students may notice
that the "speed" of their prospective journey is indicated by color rather than by arrow length.


// We distinguish between these because sometimes we want to analyze a specific solution and sometimes
// we want to visualize "all solutions". Students initially struggle with this distinction, but when
// they get it, it helps break problems into steps (e.g., "first label the axes of the phase plane",
// "next, plot a solution to the IVP", etc..).



// Strategy is to bootstrap population models, adding complexity -> LV systems as an excuse to study systems.

// Emphasize we use the terms "graphs in component space/phase space" and try to avoid saying "phase plot" or "component graphs".

// Should we tell instructors to avoid mentioning autonomous? Or not??


== Assessment note: Euler Quiz

It is worth having an Euler's method quiz before this week. This week is very modelling/simulation
intensive, having a quiz at the start of the week will speed up class a great deal.


== Education literature

#cite(<karimifardinpour2018comparing>, form: "prose") examine the difficulties that students have
coordinating between phase portraits and graphs in component space in one dimension. #cite(
  <trigueros2000>,
  form: "prose",
) conducted student interviews and found that the students "were not able to see it as a
representation of the state of an autonomous system at a particular time _even when they were able
to solve the system_". They further concluded that fluency with slope fields for one-dimensional
models did not transfer to multi-dimensional models.

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

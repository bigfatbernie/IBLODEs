// Make a "How to use this guide" section
//  - State that blue box learning objectives are presented in a way that will be applicable to students. However, there are many "hidden" objectives givin in the notes boxes. (Because some exercises are not standalone exercises, the full objectives don't make sense to state in many cases.)
// Include a schedule for the appendices? Including the calculation methods that are not in the body of the text?


The first week is about:
- Setting the tone and expectations of the class.
- Exploring how to model real-world problems.// including.
//   - The importance of assumptions, including how many assumptions we make without realizing it
//   - Our expectations of level of detail for this course
//   - Introducing the "Definitions + Assumptions + Relationships" modeling framework used in this
//     course

== Setting the tone and expectations

Set aside time on the first day to sell the "active learning" approach to students. This could be
done with, for example, Dana Ernst's "Setting the Stage" activity, or other reflective activities. // XXX Fill in with links
Explain to students the expectations of the course: that they should read chapters before coming to
class so we can practice applying techniques in class; that class time, homeworks, and practice
problems are all part of the course and you must involve yourself with every resource or you will
miss out. This is especially important because *solving methods are not in the in-class materials*.
Specifically, separation of variables, etc. are in the Appendices and should be practiced on the
homeworks, but no in-class exercises focus on these algebraic methods.

// XXX fill in with with what Bernardo expects as good guide would have to say about class expectations

== Exploring how to model real-world problems

This text uses an abbreviated modeling framework focused on *Definitions*, *Assumptions*, and
*Relationships* (DAR).#footnote[This is only part of a more comprehensive modeling framework (for
  example, SIAM's $M^2(G S)^2$ or the DeXABAR framework from #link(
    "https://github.com/bigfatbernie/IBLmodellingDEs",
  )[`IBLmodellingDEs`]). The the DAR framework leaves off explore/assess/report steps of other
  frameworks. This is done for the sake of time so that we can more directly get at differential
  equations as the basis for our models. // XXX decide whether to expand this explanation.
] This process works as follows:
+ *Definitions*: define variables, functions, and parameters. This usually looks like an annotated
  list of notation.
+ *Assumptions*: list assumptions that you are making. This usually looks like a bulleted list of
  sentences. For example:
  - "Starfish never die" or
  - "The population of starfish is measured in millions, so fractional population values make
    sense." or
  - "In the absence of friction, the spring obeys Hooke's law."
+ *Relationships*: equations relating defined variables, parameters, and functions. Every
  relationship should be justified by the assumptions. The result usually looks like a differential
  equation and some boundary conditions.

This process *doesn't happen in order*. When you write a relationship, you may realize that you need
an additional assumption; or, when you start writing assumptions, you may realize that you need to
define a new variable. *Stress this iterative process to students*.

Expect the question "when do we stop writing down assumptions?". There is no algorithm. Part of this
course is learning what the standards are in a math class; other fields (physics, engineering, law)
have different standards.

=== Spreadsheets

@ex:m1 asks students to simulate starfish population using a spreadsheet. Before this exercise, give
a short (5 minute) demo on spreadsheet basics. These are outlined in @app:spreadsheet. Although most
students will recognize spreadsheets, many will not know how to use cell referencing, dragging to
fill, and using `$` to lock a column/row.



== Education literature

=== The modelling-first ordering is the field's oldest and best-supported prescription.
#cite(
  <artigue1992>,
  form: "prose",
) found that teaching "remains centered on the algebraic setting," and reported what students
conclude from it: "most of them are convinced that there exists a recipe allowing the exact
algebraic integration of each kind of differential equation and that the aim of research in this
field is to complete the existing cook-book." That belief is what Week 1 exists to prevent. #cite(
  <kaiser2006survey>,
  form: "prose",
) would classify our stance as the "realistic / applied" perspective: real problems from outside
mathematics, taken seriously as problems.

=== Announcing that DAR is not linear is better than merely knowing it.
#cite(<borromeoferri2006phases>, form: "prose") tracked _individual modelling routes_ and found
students traverse the modelling cycle in loops and jumps --- the tidy diagram is an idealisation.
Most treatments stop at warning the teacher. Saying it out loud to the class, each time you double
back, goes further than the published advice, and is the cheapest thing in this guide.

=== Equity considerations

Across 20 inquiry-oriented classrooms, #cite(<reinholz2022inequitable>, form: "prose") found that
women's participation rate predicted women's performance while men's did not, and that the classes
with the smallest gap were those with the most student-to-student exchange rather than
instructor-to-student. Keep this in mind during discussion time. If you only choose eager
volunteers, you may incidentally only hear from a subset of the class.

=== References

#bibliography(
  "../literature-cross-reference.bib",
  title: none,
  full: false,
  style: "american-psychological-association",
)

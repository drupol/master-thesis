#import "imports/preamble.typ": *
#import "theme/template.typ": *
#import "theme/common/titlepage.typ": *
#import "theme/common/metadata.typ": *
#import "theme/disclaimer.typ": *
#import "theme/leftblank.typ": *
#import "theme/acknowledgement.typ": *
#import "theme/abstract.typ": *
#import "theme/infos.typ": *
#import "theme/definition.typ": *

#chapterquote(
  title: "Reproducibility",
  ref: "chapter2",
  quoteAttribution: <cacioppo2015social>,
  quoteText: [
    Reproducibility is a minimum necessary condition for a finding to be
    believable and informative.
  ],
)

== Reproducibility in Science

#info-box(kind: "cite", footer: [@kpopper1934])[
  No serious physicist would offer for publication, as a scientific discovery,
  one for whose reproduction he could give no instructions.
]

The concept of reproducibility lies at the heart of scientific inquiry, serving
as a critical benchmark for the validation and acceptance of research findings.
It is a principle that transcends scientific disciplines, insisting that the
results of an experiment or study must be consistently replicable under
identical conditions by different researchers. This aspect of the scientific
method ensures the reliability and integrity of scientific knowledge. It
establishes a framework where hypotheses are not just tested but also subjected
to repeated verification, underpinning the trust and credibility that society
places in scientific discoveries. The journey of reproducibility, originating
from the earliest scientific endeavours, has evolved to adapt to the
complexities and nuances of modern research methodologies. This evolution
mirrors the progression of scientific thought and technology, from rudimentary
experiments to sophisticated, computer-assisted analyses.

One can observe the glimpse of the first traces of this concept in @kpopper1934.
The concept of reproducibility is far from new and has been a cornerstone in the
sciences for centuries. It aims to explain natural phenomena in an objective and
repeatable manner.

According to @Castillo1669, the scientific method (@scientificmethod), a
formalised and widely-adopted process for exploring observations and answering
questions, is inherently designed to be repeatable. However, this does not
guarantee that the results of all experiments conducted using the scientific
method will be reproducible. When results cannot be replicated, it raises
questions about the validity of the experiment and the credibility of the
researcher.

#info-box[
  In the realm of scientific research, #emph[repeatable] and #emph[reproducible]
  are terms often used interchangeably, yet they hold distinct meanings.

  #emph[Repeatable research] refers to the ability of a study or experiment to
  yield the same results when conducted again under the same conditions with the
  same materials and methods by the same researchers. It primarily focuses on
  the consistency and reliability of results within the original research
  context.

  On the other hand, #emph[reproducible research] emphasises the ability of an
  independent researcher to attain at the same findings and conclusions using
  the original study's raw data and following the same methodologies, but
  possibly under different conditions and with different tools. Reproducibility
  extends the validation process beyond the original researchers, ensuring that
  the results hold up under scrutiny and can be reliably used as a foundation
  for further study.

  Together, repeatability and reproducibility are foundational to the integrity
  and advancement of scientific knowledge, allowing for a deeper trust and
  understanding of research findings.
]

While reproducibility can be considered closely aligned with the scientific
method, it is not an intrinsic part of it. The scientific method is a procedural
approach for conducting experiments, whereas reproducibility is a quality
attribute of the experimental results (@scientificmethodwithreproducibility).

As of 2016, some of its basic terms were not standardised. This diverse
nomenclature has led to confusion, both conceptual and operational, about what
kind of confirmation is needed to trust a given scientific result.

#grid(
  columns: (1fr, 1fr),
  [
    #figure(
      include "../../resources/typst/scientific-method.typ",
      caption: [Scientific method],
    ) <scientificmethod>
  ],
  [
    #figure(
      include "../../resources/typst/scientific-method-w-r13y.typ",
      caption: [Scientific method with reproducibility],
    ) <scientificmethodwithreproducibility>
  ],
)

Reproducibility in research is a major factor that determines the uniqueness of
research studies. It means obtaining consistent results using the same data and
protocol as the original study. For example, researchers confirm the validity of
a new discovery by repeating the experiments that produced the original results.
Moreover, other researchers in the field are also able to repeat the same
experiments producing the results similar to the original.

=== Reproducibility Levels <ch2-r13y-levels>

According to @ESSAWY2020104753, reproducibility is organised in four levels:

- *Repeatability*: Achieved upon obtaining consistent results using the same
  input data, computational steps, methods, and code on the original
  researcher's machine. This level is normally achieved in scientific papers.
- *Runnability*: Achieved when the author of the research can obtain consistent
  results using the same input data, computational steps, methods, code and
  conditions of analysis on a new machine.
- *Reproducibility*: Achieved when a new researcher, not an original author of
  the analysis, is able to reproduce the analysis in their own computational
  environment #cite(<NAP25303>, form: "normal").
- *Replicability*: Achieved by obtaining consistent results across studies aimed
  at answering the same scientific question, each of which has obtained its own
  data #cite(<NAP25303>, form: "normal"). Replicability also allows scientists
  not involved in the original study to build from and expand on research once
  they are first able to reproduce that research.

#figure(
  include "../../resources/typst/essawy-table.typ",
  caption: [The four levels of reproducibility and their requirements.],
  kind: "table",
  supplement: [Table],
) <table-levels-of-reproducibility>

#info-box[
  It's crucial to understand that these levels are interconnected and not
  isolated. Achieving reproducibility level means that the criteria for both
  repeatability and runnability levels have been met.
]

@table-levels-of-reproducibility delineates four levels of reproducibility, each
with specific prerequisites. It's important to acknowledge that these levels are
organised in ascending order of difficulty to attain, starting from the simplest
to the most challenging. Consequently, progressing through these levels
necessitates an incremental investment of resources, time, and effort.

=== Formalisation

#definition(term: "Experiment")[
  An experiment $e$ conducted with a set of parameters and conditions $p$ where
  $r(e,p)$ represents the experiment results, is #emph[reproducible] if and only
  if:

  #box[
    $
      & forall e in E, forall e' in R(e), forall p in "par"(e), quad r( e, p ) eq r(e', p)
    $
  ]

  where
  - $E$ is the set of all possible experiments
  - $"par"$ is a function defined as $"par": E -> cal(P)(P)$ where $cal(P)(P)$ is the
    powerset of $P$, the set of all possible parameters of all possible
    experiments
  - $R(e)$ is a function defined as $R: E -> cal(P)(E)$ where $cal(P)(E)$ is a powerset
    of $E$ that gives for each experiment $e in E$, its set of independent
    replications
] <def-reproducible-experiment>

== Reproducibility in Computer Science

#info-box(kind: "cite", footer: [@Barba2018])[
  In their vision of reproducible research, readers should be able to rebuild
  published results using the author's underlying programs and raw data.
  Implicitly, they are advocating for open code and data.
]

As we shift our focus from general scientific domains to the realm of
#gls("CS"), the principles of reproducibility undergo a unique transformation.
In our digital era, where computations and algorithms form the backbone of
research, reproducibility challenges and solutions take on new dimensions. The
intricate interplay of software, hardware, and data in #gls("CS") demands a
re-examination and adaptation of traditional reproducibility concepts. This is
where the principles established in the broader scientific community intersect
with the specificities of computing, leading to a distinct and crucial discourse
on reproducibility in the field of #gls("CS").

The initial recorded use of the term #emph[reproducible research] in an academic
paper is believed to have occurred in 1992, in a presentation by
@Claerbout1992's team at Stanford, during the Society of Exploration Geophysics
conference. @Schwab2000, the same group of researchers updated their definition
of #emph[reproducibility in computationally oriented research].

In @Donoho2009, it is stated that reproducibility depends on open code and data.
The authors define reproducible computational research as that
#emph[
  in which all details of computations, code and data, are made conveniently
  available to others.
]

#definition(
  term: "Repeatability (Same team, same experimental setup)",
  name: "acm_repeatability",
)[
  The measurement can be obtained with stated precision by the same team using
  the same measurement procedure, the same measuring system, under the same
  operating conditions, in the same location on multiple trials. For
  computational experiments, this means that a researcher can reliably repeat
  her own computation.
]

@Goodman2016 acknowledge the lack of standardisation in foundational terms like
reproducibility, replicability, reliability, robustness, and generalizability.
To address this, they suggest a new lexicon: #emph[Methods Reproducibility] to
align with the original concept of reproducibility as defined by @Claerbout1992
and @Donoho2009, #emph[Results Reproducibility] corresponding to what @Peng2009
refers to as replicability, and #emph[Inferential Reproducibility] to denote a
distinct category.

#definition(
  term: "Reproducibility (Different team, different experimental setup)",
  name: "acm_reproducibility",
)[
  The measurement can be obtained with stated precision by a different team
  using the same measurement procedure, the same measuring system, under the
  same operating conditions, in the same or a different location on multiple
  trials. For computational experiments, this means that an independent group
  can obtain the same result using the author's own artefacts.
]

The term #emph[reproducibility] in the context of #gls("CS") has been refined
and explored in numerous works and identifying a single #emph[first] definition
can be challenging due to the evolution of the concept over times. According to
@Barba2018, who conducted a detailed article on the terminology history, the
most appropriate terminology (@acm_repeatability, @acm_reproducibility,
@acm_replicability) to describe reproducibility in the context of #gls("CS") is
the definitions derived from
@acm_artifact_review_badging[Artifact Review and Badging].

#definition(
  term: "Replicability (Different team, same experimental setup)",
  name: "acm_replicability",
)[
  The measurement can be obtained with stated precision by a different team, a
  different measuring system, in a different location on multiple trials. For
  computational experiments, this means that an independent group can obtain the
  same result using artefacts which they develop independently.
]

In the context of this document, @reproducibility is the definition of
#emph[reproducibility] that we will use when referring to the concept of
reproducibility in #gls("CS").

#definition(term: [Reproducibility], name: "reproducibility")[
  Reproducibility is the ability to consistently obtain identical results across
  multiple runs of a computer task when using the same methods and data,
  regardless of method, space and time. Note that this does not necessarily
  imply that the outputs are correct or the desired outputs.
]

#info-box(kind: "important")[
  #emph[Space] and #emph[Time] are terms borrowed from physics. In the context
  of reproducibility in #gls("SE"), space refers to different systems, while
  time refers to different moments in time
  #cite(<malka-hal-04430009>,form:"normal"). (more about that in
  @def-deterministic-build).
]

=== Scope

In this master thesis, the exploration of reproducibility will focus on a
specific aspect: ensuring the reproducibility of building source code to ensure
that the resulting application works. This critical area is paramount in the
field of
#gls("SE"), where the ability to consistently recreate identical software
artefacts from a given source code under varying conditions and environments
stands as a paramount concern. The intent is not to undermine the importance of
these other facets, but rather to mainly concentrate the efforts and analysis on
the reproducibility of source code building and compilation.

#info-box[
  We acknowledge that languages like JavaScript, PHP, Python are not compiled
  but merely interpreted by their respective interpreter. Often, these scripting
  languages require dependencies provided by their respective package manager as
  well. Ensuring the availability of these dependencies is an integral part of
  the software build process and, to some extent, corresponds to the compilation
  in non-compiled languages. Consequently, in the context of this thesis,
  "compiling source code" is applicable to both types of programming languages.
]

The concept of reproducibility can be distinctly categorised into multiples
phases like: #emph[reproducibility at build time]
(@def-reproducibility-build-time) and #emph[reproducibility at run time]
(@def-reproducibility-run-time). It is important to note that these phases are
not mutually exclusive and can be combined to achieve a higher level of
reproducibility.

#definition(
  name: "def-reproducibility-build-time",
  term: "Reproducibility at build time",
)[
  Reproducibility at build time refers to the ability to consistently generate
  the same executable or software artefact from a given source code across
  different builds on different environments, across different space and time.
  This aspect is crucial in ensuring that the software compilation process is
  deterministic and immune to variances in development environments, compiler
  versions, or build tools. It involves a meticulous standardisation and
  documentation of the build environment and dependencies to guarantee that the
  same executable is produced regardless of when or where the build occurs.
]

#definition(
  name: "def-reproducibility-run-time",
  term: "Reproducibility at run time",
)[
  Reproducibility at run time addresses the consistency of software behaviour
  and output when the software is executed in different environments or under
  varying conditions. This type of reproducibility focuses on ensuring that the
  software performs identically and produces the same results regardless of the
  #gls("OS"), underlying hardware, or external dependencies it interacts
  with during execution.
]

To illustrate these phases, the C source code in @montecarlo-pi.c implements the
Monte Carlo method to approximate the value of π. This is an example of
reproducibility at build time, but not at run time.

#figure(
  {
    sourcefile(
      lang: "C",
      file: "../../../resources/sourcecode/montecarlo-pi.c",
    )
  },
  caption: [Sourcecode of montecarlo-pi.c],
) <montecarlo-pi.c>

#figure(
  {
    shell(file: "../../../resources/sourcecode/montecarlo-pi-compilation.log")
  },
  caption: [
    Building the same source code multiple times always yields the same binary
    executable
  ],
  supplement: "Terminal session",
  kind: "terminal",
)

The Monte Carlo algorithm is inherently stochastic, it uses random sampling or
probabilistic simulation as a core part of its computation. This randomness is
intrinsic to the algorithm's design and purpose.

The distinction between build time and run time reproducibility for the Monte
Carlo algorithm arises from its usage of a random source. While the algorithm
can be reliably built into a consistent binary (build time reproducibility), its
outputs can vary on different executions under the same conditions due to its
inherent randomness (lack of runtime reproducibility). This does not undermine
the validity of the algorithm but rather is a characteristic of its
probabilistic approach to problem-solving.

#figure(
  shell(file: "../../../resources/sourcecode/montecarlo-pi.c.log"),
  caption: [
    Running the binary multiple times does not always yields the same result
  ],
  supplement: "Terminal session",
  kind: "terminal",
)

To address the challenge of reproducibility in practice, identifying and
isolating the sources of randomness is crucial. These sources can vary widely
depending on the implementation and may include system time, hardware random
number generators, or other external factors. By isolating these components and
enabling control by the end user (e.g., by passing these sources of randomness
as parameters), it becomes possible to deterministically control the random
sequence. This ensures that, given the same seed, the algorithm produces
identical outputs across executions, preserving its stochastic nature while
enabling reproducibility.

In the specific case of the Monte Carlo algorithm from @montecarlo-pi.c, this
challenge can often be resolved by passing a seed as an input parameter to the
random number generator, as seen in @montecarlo-pi-fixed.c. The seed is used to
initialise the random number generator, ensuring that the same sequence of
random numbers is generated across different runs. This subtle and simple
adjustment provides a deterministic framework while maintaining the
probabilistic essence of the algorithm.

Adopting such practices aligns with the established principles of good software
development. These practices promote determinism and predictability, which are
key attributes for creating reliable and maintainable systems in the long run.

#figure(
  {
    sourcefile(
      file: "../../../resources/sourcecode/montecarlo-pi-fix.c",
      lang: "C",
    )
  },
  caption: [`montecarlo-pi-fix.c` with deterministic random number generator],
) <montecarlo-pi-fixed.c>

In the next example, the source code is not reproducible at build time and we
might erroneously think that the program is reproducible at run time.

We observed that compiling the same source code multiple times results in
different binaries. This variation occurs because the source code includes the
macros `__TIME__` and `__DATE__`, which are substituted with the current time
and date during compilation. As a result, we cannot achieve reproducibility at
build time.

#figure(
  {
    sourcefile(
      lang: "C",
      file: "../../../resources/sourcecode/datetime.c",
    )
  },
  caption: [Sourcecode of `datetime.c`, a C program with macros],
) <datetime.c>

Upon executing the produced binary, the outcome appears consistent. This might
suggest that the binary is reproducible at run time, however, this assumption is
incorrect. Consider a scenario where a different user compiles the same source
code. In such a case, runtime reproducibility between the original and another
user is not assured.

#figure(
  shell(file: "../../../resources/sourcecode/datetime.c.log"),
  caption: [
    An example of program that it neither reproducible at build time and
    run time.
  ],
  supplement: "Terminal session",
  kind: "terminal",
)

=== Quantifying Reproducibility

Quantifying reproducibility is traditionally viewed as a binary state: it is
either reproducible or not. However, this perspective oversimplifies the
complexity of software environments. In reality, reproducibility exists on a
spectrum, where the focus shifts from a mere #emph[yes-or-no] assessment to
evaluating the extent and conditions under which a computation is reproducible.

#figure(
  include "../../resources/typst/reproducibility-rule.typ",
  caption: "Reproducibility states",
) <reproducibility-rule>

We will explore this concept with Docker images as a primary example. Docker, a
popular containerization platform, uses Dockerfiles (@dockerfile-example).
Basically, a `Dockerfile` is a script with a set of instructions to build
images. These images are then used to run software in a consistent environment.
However, images on Docker Hub #cite(<dockerhub>, form:"normal") often present
challenges to reproducibility. The reasons vary: some Dockerfiles are not
publicly available but especially because most of them include significant
variability in their build processes, making exact replication of the images
pretty much impossible. We will consider these challenges in more detail in
@chapter4.

#figure(
  sourcefile(
    lang: "Dockerfile",
    file: "../../../resources/sourcecode/nodejs.dockerfile",
  ),
  caption: [An example of `Dockerfile`],
) <dockerfile-example>

Determining a precise value for a Docker image's temporal reproducibility is
complex. Thus, for the purposes of this thesis, we simplify the classification
into three broad categories as outlined in @reproducibility-rule:
#emph[Not reproducible], #emph[Partially reproducible], #emph[Reproducible].
While more nuanced classifications are possible, this simplified tripartite
model provides a sufficient basis in this thesis.

Despite these challenges, Docker images are widely used. They remain static
between updates, creating a window during which their environment is consistent.
This period (the interval between two successive updates) can serve as an
indirect measure of reproducibility. Essentially, the longer the time between
updates, the more stable and, by extension, reproducible the image is
considered. In considering the temporal dimension of reproducibility, it is
essential to recognise that software artefacts are not unchanging entities; they
offer a predictable environment for a finite period. Imagine a scale where 0
represents non-reproducibility and 1 indicates full reproducibility. On this
scale, the temporal reproducibility of Docker images would be positioned between
0 and 1, acknowledging the nuanced nature of this concept.

However, this reproducibility is inherently dynamic due to the nature of
software evolution. Each update to a Docker image might introduce changes
affecting the software's behaviour, thereby impacting its reproducibility over
time. Understanding this aspect of temporal reproducibility is crucial for
managing software environments in a continuously advancing technological
landscape.

The Docker use case can be classified under the #emph[Partially reproducible]
class. This is because, while Docker images ensure reproducibility at run time
by providing a consistent execution environment, they often fall short of
reproducibility at build time due to the variability inherent in their
Dockerfiles. This dichotomy highlights the spectrum of reproducibility, where
Docker images occupy an intermediate position. They are not reproducible due to
build-time variability, but they maintain some reproducibility thanks to runtime
stability. This categorisation helps clarify the reproducibility status of
Docker images and highlights the need for a nuanced approach to classifying
software reproducibility, recognising the spectrum between
#emph[Not reproducible] and #emph[Reproducible].

=== Open Source

#info-box(kind: "cite", footer: [@Donoho2009])[
  If everyone on a research team knows that everything they do is going to
  someday be published for reproducibility, they'll behave differently from day
  one. Striving for reproducibility imposes a discipline that leads to better
  work.
]

Open Source refers to a type of software whose source code is freely available
for anyone to view, modify, and distribute. This model encourages collaborative
development and sharing, allowing users and developers to improve the software
and adapt it to their needs.

Open-source software development, renowned for managing complex projects with
high quality, enhances reproducibility by promoting professionalism and
transparency. Making open-source software reproducible offers numerous
advantages: it streamlines the onboarding of new contributors, improves testing
and feature implementation, ensures transparent build processes, facilitates
security audits, and quickens response times in the dependency supply chain in
case of issues.

Reproducibility, intrinsically linked with Open Source, is fundamentally an
activity that builds trust (@barba2022definingroleopensource), making it a
leading method for ensuring software can be reliably built and verified by a
diverse global community​​.

A direct correspondence can be established with the taxonomy of
@ESSAWY2020104753 when considering the process of building software from source
code. This process can be analogised to a scientific experiment. In this
context, the act of an individual building the source code of another developer
on their own machine mirrors the concept of #emph["Reproducibility"] as
described in @table-levels-of-reproducibility. This signifies that the software,
when compiled by different users from its source code, consistently results in
the same executable or software artefact. The transparency inherent in
open-source software is a foundational advantage. Since the source code is
publicly available, it allows researchers to scrutinise how the software
operates, understand how results are generated, and validate the reliability and
accuracy of the software. This level of openness is crucial for replicability
and trust in scientific research.

Furthermore, open-source software promotes a culture of collaboration and
community involvement. Active communities that grow around open-source projects
contribute to the software's continual improvement. This community-driven
development leads to the identification and resolution of bugs, thereby
enhancing the software's reliability and, consequently, the reproducibility
outcomes that depend on it.

A key feature of open-source software is the permissive nature of its licencing,
which, depending on the specific licence, facilitates the reuse and modification
of software without legal or technical barriers. This flexibility is vital for
verifying and replicating studies, as researchers can adapt the software for
their specific needs without restrictions, though some licences may impose
certain conditions. Additionally, open-source development tools offer robust
record-keeping capabilities, such as version control systems
#eg[git, Mercurial, Pijul], enabling researchers to track changes and understand
the context of each update. This aspect is essential for reproducing and
validating research findings.

Lastly, the open source approach aligns well with the scientific values of
openness and sharing, promoting a culture that values transparency and
reproducibility in scientific inquiry. Moreover, the community-driven nature of
open-source software reduces the risk of obsolescence, ensuring that research
tools remain accessible and up-to-date for future replication efforts.

Open-source software embodies a framework that is not only conducive to the
scientific pursuit of knowledge but also reinforces the integrity and
sustainability of #gls("SE") through its emphasis on transparency,
collaboration, and adaptability. Therefore, open source is key for facilitating
reproducibility as highlighted in @hinsenKonradFramework2020's framework on
reproducible scientific computations. This framework provides a structured
approach to understanding and addressing reproducibility. He proposes four
essential possibilities which can only be achieved with open-source software:

- Inspectability: the possibility to inspect all input data and source code
- Executability: the possibility to run the code on a suitable computer to
  verify the results
- Explorability: the possibility to explore the behavior of the code by
  inspecting intermediate results, making small modifications, or using code
  analysis tools
- Verifiability: the possibility to verify that the published executable
  versions correspond to the available source code

Open-source development, by its nature of allowing anyone to build, verify and
use software, stands out as an effective, if not the best, approach to
bolstering both confidence and safety in software systems. This widespread
participation and verification process inherent in open-source development
greatly enhances the reliability and security of the software.

=== Terminology

Establishing formal definitions and terminology is crucial for aligning
researchers, practitioners, and readers on the same wavelength. By articulating
a clear and precise mathematical representation, we facilitate a universal
understanding of what it means for a computation to be reproducible.

The following section is dedicated to constructing such a formal definitions, a
balance between the rigor required by the academic community and the clarity
needed for widespread adoption.

==== Computation

A computation is a process that involves the execution of algorithms or a series
of operations to obtain a result, usually performed by a computer. It can be
complex, involving multiple steps, conditions, and data manipulations
(@inputs-computation-outputs). The formal definition of computation takes into
account the computational environment variable, reflecting the specific context
where the computation occurs.

#figure(
  include "../../resources/typst/inputs-computation-outputs.typ",
  caption: "Inputs, computation, outputs",
) <inputs-computation-outputs>

In the context of #gls("CS"), defining a computation involves considering the
broader scope of activities and processes that a computer performs, extending
beyond the traditional mathematical abstraction of a function. A computation can
be understood as a sequence of steps or operations performed by a computer to
transform input data into output data. This process can involve different types
of functions, algorithms, and data manipulations. Essentially, a computation can
be depicted as an abstraction involving one or multiple functions.

Examples of computations could be: a program build, a compilation, a program
execution, a data analysis, a data transformation.

- When source code is compiled, the input is the source code and the output is
  the binary executable.
- When a program is executed, the input is the binary and the output is the
  result of the program.
- When making a data analysis, the input is the raw data and the output is the
  analysis.
- When evaluating a function, method, or procedure in any programming language,
  the input consists of the function itself along with its parameters. The
  output is the result of the function applied to these parameters, including
  any potential side effects #eg[changes in the program's state].

#definition(term: "Computation", name: "def-computation")[
  A computation $c$ is a set of one or more functions $f:I times E → R$.

  where
  - $I$ is the set of all possible arguments or inputs the computation needs
  - $E$ is the set of all possible execution environments (hardware, software,
    space, time)
  - $R$ is the set of all possible outputs
]

It is crucial to distinguish functions, both of which are integral in the realms
of Mathematics and #gls("CS"). In Mathematics, a function is a deterministic
construct defining a specific relationship between sets of inputs and outputs,
mapping each input to exactly one output. It acts as a fundamental building
block within computations to describe how values are transformed. In #gls("CS"),
functions are similar but can be classified as pure (@section-pure-function) or
impure (@section-impure-function), with pure functions having no side effects
and impure functions potentially affecting the state or relying on external
variables. While a function provides the rules for individual transformations
within a computation, the computation itself represents the broader and more
dynamic process of achieving a result, often involving the execution of complex
algorithms, data handling, and the application of multiple functions and
operations.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    #figure(
      {
        set text(font: "Virgil 3 YOFF")
        cetz.canvas({
          import cetz.draw: *

          rect((-3, 3), (3, -3))
          circle((0, 0), radius: 2)
          content((0, -2.25), "Functions")
          content((0, -3.25), "Mathematical environment")
        })
      },
      caption: [Functions in the context of Mathematics],
    ) <functions-in-mathematics>
  ],
  [
    #figure(
      {
        set text(font: "Virgil 3 YOFF")
        cetz.canvas({
          import cetz.draw: *

          rect((-3, 3), (3, -3))
          circle((0, 0), radius: 2)
          line((0, 2), (0, -2))
          content((1, 0), "pure")
          content((-1, 0), "impure")
          content((0, -2.25), "Functions")
          content((0, -3.25), "Computational environment")
        })
      },
      caption: [Functions in the context of #gls("CS")],
    ) <functions-in-cs>
  ],
)

In #gls("CS") (@functions-in-cs), a function necessitates an environment in
which it will be evaluated, effectively making, to some extent, this environment
an extra input parameter per se. This computational environment, which
encompasses the hardware #eg[filesystem, memory, #gls("CPU", long: false)],
software #eg[#gls("OS", long: false)] and date #eg[the current date and
time], may influence the function's behaviour and output. Consequently,
functions in #gls("CS") are inherently designed to interact with and adapt to
their environment, thereby making them dynamic and versatile but also
potentially non-deterministic.

Conversely, in Mathematics (@functions-in-mathematics), a function is evaluated
independently of any environment, or with the environment variable effectively
set to null, ensuring its behaviour is entirely predictable and self-contained.
This means its behaviour is entirely predictable and self-contained. This
distinction highlights the adaptability and complexity of functions in
computational contexts, compared to their more stable and defined mathematical
equivalents.

==== Inputs and Outputs

An input is the data provided to a computation. The output is the result of a
computation or any other changes made to the environment the computation is
being evaluated in.

#definition(term: "inputs and outputs", name: "def-inputs-outputs")[
  The function $f: I -> R$ is a function mapping the domain input set $I$ on the
  codomain output set $R$.
]

Inputs and outputs can vary widely, ranging from user interactions and network
connections to files and directories. The nature of these inputs and outputs
greatly impacts the reproducibility of computational processes.

Consider user interactions, such as mouse or eyes movements. These are
inherently challenging to replicate precisely due to their dynamic and
unpredictable nature. For instance, reproducing the exact trajectory of a mouse
movement is virtually impossible due to the minute variations in human actions.
However, a more reproducible approach would be to capture these interactions in
a structured format like in `eyeScrollR` (@Larigaldie2024). Recording the
coordinates of mouse movements over time in a file creates a detailed log that
can be replayed. This arbitrary method transforms a non-reproducible user
interaction into a reproducible set of data.

For a computation to be considered reproducible, its inputs and outputs must be
storable and retrievable. Typically, the most feasible types for such storage
are files or directories, primarily due to the ubiquity and accessibility of
file systems in computing environments. Files and directories offer a stable and
widely accessible medium to store and retrieve data.

In this thesis, the focus will be on scenarios where inputs and outputs are in
the form of files, unless specified otherwise. This assumption aligns with the
common practices in computational processes and aids in maintaining the
reproducibility of the computations discussed.

In the context of software compilation, an output is correct when it faithfully
reflects the state of its transitive inputs. Basically, the output represents
all direct and indirect dependencies used in the build process.
"Transitive inputs" refer to not only the direct inputs #eg[source code] but
also to the inputs of those inputs #eg[libraries, frameworks, compilers, data
resources].

From the point of view of the software build process as shown in
@inputs-outputs-part1, the inputs are all the source code files, configuration
files, and dependencies required to build the software.

#figure(
  include "../../resources/typst/inputs-and-outputs-part1.typ",
  caption: "Inputs, computation, outputs",
) <inputs-outputs-part1>

In @inputs-outputs-part2, the process has been refined from the perspective of
the user running the software, where the input is now composed of the program
and its parameters. This distinction is crucial as it highlights the dynamic
nature of computational processes. The user's interaction with the software,
such as providing parameters or executing commands, is integral to the inputs
and can greatly influence the output.

#figure(
  include "../../resources/typst/inputs-and-outputs-part2.typ",
  caption: "The input is now composed of the program and its parameters",
) <inputs-outputs-part2>

In @inputs-outputs-part3, the environment where the computation is evaluated is
added to the input. This environment includes the hardware, software, space, and
time in which the computation is executed. This addition further refines the
definition of inputs and outputs, emphasising the dynamic and context-dependent
nature of computational processes.

#figure(
  include "../../resources/typst/inputs-and-outputs-part3.typ",
  caption: [
    The input is now composed of the program and its parameters and the
    environment where it is going to be evaluated.
  ],
) <inputs-outputs-part3>

We could break down the environment further. However, as we delve deeper into
segmenting the components essential for a computation, the process becomes
increasingly subjective (@hinsenKonrad2020guix).

Reproducibility implies to compare outputs to determine if they are equivalent.
According to @Acm2018[p.5], there are multiple equivalence classes:

#figure(
  include "../../resources/typst/equivalence-classes-of-reproducibility.typ",
  caption: [Classes of reproducibility],
  kind: "table",
  supplement: "Table",
)

- Two natural phenomena could be observed by human experts and considered as the
  same.
- Two results could be statistically equivalent, in that the numeric values are
  different, but they both convey the same statistical interpretation.
- Two results could be the same data in the sense that they encode the same
  numeric contents, but differ in some irrelevant detail. For example, an output
  file might incidentally contain the system time and the name of the user who
  ran the program.
- Two results could be equivalent, in every way, bit-per-bit. This is the
  strictest form of equivalence.

In the context of this thesis, we will assume that two results are equivalent if
they are the same, bit-per-bit.

#info-box(kind: "important")[
  It is important to clarify that in the context of reproducibility, the time
  taken to compute the output is not typically considered. This means that two
  results can be deemed equivalent or reproducible even if the computational
  time to achieve these results varies. For instance, consider a situation where
  a piece of code is refactored: if the output data remains unchanged, the
  process is considered reproducible from a data consistency perspective.
  Nonetheless, even if the refactored code requires considerably more time and
  resources to execute, it is still classified as reproducible as long as the
  output remains consistent with the original.

  This distinction underscores that reproducibility focuses on the consistency
  of the output data rather than the performance or efficiency of the
  computational process. This aspect is particularly relevant in environments
  where hardware or system efficiencies may differ, yet the integrity and
  equivalence of the output data remain the primary concern. While this might
  provoke debate regarding resource efficiency and computational time, for the
  purposes of this thesis, it is assumed that the temporal and resource aspects
  of computing the output are secondary to the consistency of the results
  themselves.
]

==== Evaluation of a Computation

The evaluation of a computation is the process of determining the resulting
output of a function for a given set of arguments. It involves applying, in a
specific computational environment, the function's defined operations to the
inputs to produce an output. This does not necessarily imply that the outputs
are correct. Note that, #emph[correct] means that the evaluation has
successfully completed without errors.

#figure(
  include "../../resources/typst/inputs-and-outputs-part4.typ",
  caption: [
    The evaluation of inputs into outputs where the input is composed of the
    program and its parameters and the environment where it is going to be
    evaluated.
  ],
) <inputs-outputs-part4>

#definition(term: "Evaluation", name: "def-evaluation")[
  $"eval": (F, I, E) -> R$ is a function that evaluates a function $f$ and its
  parameters $i$ in a specific computational environment $e$ to produce a
  result, an output.

  $forall f in F, forall i in I, forall e in E, quad "eval"(f,i,e) eq f(i, e)$

  where
  - $F$ is the set of all possible computations
  - $I$ is the set of all possible arguments the computation needs
  - $E$ is the set of all possible execution environments (hardware, software,
    space, time)
  - $R$ is the set of all possible outputs
]

In the realm of mathematics, a function is typically isolated, operating solely
on its provided arguments, with no external environmental factors influencing
its output. Contrarily in #gls("CS"), it is common for a computation to interact
with and be influenced by its surrounding environment during evaluation, which
necessitates @def-evaluation.

==== Pure Function <section-pure-function>

As seen in @functions-in-mathematics, the concept of a #emph[pure function] as
defined in @def-pure-function does not explicitly exist in Mathematics. This is
because functions are always inherently considered to be deterministic and
side-effect free, here functions in maths are #emph[by default] pure. Any
mathematical function evaluates under the assumption that given the same inputs,
the output will always be the same, and the evaluation of the function does not
alter any external state or variable.

#definition(term: "Pure function", name: "def-pure-function")[
  A pure function can be defined as a function where the same input always
  yields to the same output.

  Let $f: I times E → R$ be a function. Then $f$ is *pure* if and only if:

  $forall i in I, forall e_1, e_2 in E, quad "eval"(f,i,e_1) eq "eval"(f,i,e_2)$

  where
  - $I$ is the set of all possible inputs arguments
  - $E$ is the set of all possible execution environments (hardware, software,
    space, time)

  A bridge can be drawn between the mathematical definition of a function
  $f: I -> R$ and this definition by considering the environment variable $E$ as
  an empty set, making the function independent of any external state or
  variable. This effectively reduces the definition of a pure function in
  #gls("CS") to the mathematical definition of a function.
]

However in #gls("CS"), it makes sense to define what are pure and impure
functions because a function might behave differently depending on the
environment in which it is executed. Therefore, the purity of a function in the
context of #gls("CS") is vital for understanding and managing side effects
and state in software, it is a distinction that does not apply in the static,
deterministic realm of pure mathematics.

This distinction highlights how the same term can have different implications in
different disciplines, reflecting the unique nature of challenges and concepts
in programming versus pure mathematics. However, we can still try to define such
a function in a theoretical #gls("CS") context.

A pure function is a specific type of function in programming characterised by
the following properties:

- Deterministic: for a given set of inputs, a pure function always returns the
  same output. This means the function's output is solely determined by its input
  values and does not rely on any external state or data.

- No side effects: A pure function does not cause any observable side effects in
  the system. This means it does not modify any external state, global variables,
  or data outside its scope. It also does not produce outputs other than its
  return value, such as printing to the console or altering the state of the
  program beyond the scope of the function.

#info-box[
  A checksum(@checksum) is an example of pure function. It will constantly
  return the same output for the given output.
]

==== Impure Function <section-impure-function>

An impure function is the opposite of the above definition of a pure function.

#definition(term: "Impure function", name: "def-impure-function")[
  An impure function is a function that does not always yields the same output
  for a given input. This can be formally expressed as:

  Let $f: I times E → R$ be a function. Then $f$ is *impure* if and only if:

  $forall i in I, exists e_1, e_2 in E, quad "eval"(f,i,e_1) eq.not "eval"( f,i,e_2 )$

  where
  - $I$ is the set of all possible inputs arguments
  - $E$ is the set of all possible execution environments (hardware, software,
    space, time)
]

It is a specific type of function in programming characterised by the following
properties:

- Non-deterministic: the function can yield different outputs for the same set
  of input values at different times, depending on the state of the system or
  environment in which it is executed.

- Side effects: the function performs actions that modify some state outside its
  local environment or has observable interactions with the outside world. This
  can include altering global variables, modifying input arguments, I/O
  operations, or calling other impure functions.

As seen in @functions-in-cs, this concept only exists in programming, as it is a
direct consequence of the mutable nature of the state in programming. In pure
mathematics, functions are conceptualised as mappings from elements of one set
(the domain) to elements of another set (the codomain), without any side effects
or external dependencies. This distinction highlights the difference between the
theoretical framework of mathematics and the practical aspects of programming,
where functions often interact with a mutable state or environment.

Given this, we will allow ourselves to define such a function in the theoretical
context of computer science. Implying that to define such a function, an
additional parameter, which will be used to calculate the time, #emph[must] be
passed as a parameter to the function. This parameter corresponds to the `E`
parameter in @def-impure-function.

Given this, we will allow ourselves to define such a function within the
theoretical context of #gls("CS").

#info-box[
  An example of an impure function is one that returns the current date and
  time, as its output depends on external state and can vary with each call.
]

==== Checksum <checksum>

Although understanding the concept of a checksum is not essential for
understanding the definitions, it is crucial to define it due to its recurring
presence in the next chapters.

A checksum is the result of a computation. It is a one-way pure function which
takes an input of an arbitrary size and returns a string of a fixed size,
depending on the checksum algorithm in use. For example when using a `git`, each
commit ID is a checksum of the current commit's content and the previous
commit's ID.

#figure(
  include "../../resources/typst/figure-checksum.typ",
  caption: "Inputs, checksum, string output",
) <inputs-checksum-string>

A one-way function is easy to compute but is practically impossible to reverse.
This is primarily due to the fixed-size output the number of possible inputs
(#emph[domain]) exceeds the number of possible outputs (#emph[codomain]). The
time complexity of such a function is usually linear, which means that the time
it takes to compute the checksum is proportional to the size of the input,
therefore $cal(O)(n)$.

A checksum is a function that returns a string called #emph[hash], which is
supposedly unique for a given input. Checksum algorithms are designed to
produce a unique hash for each unique input. However, the term "supposedly
unique" is used because, in theory, it is possible for two different inputs to
produce the same hash, an occurrence known as a #emph[collision]. The ability to
find collisions undermines the security of the algorithm. There are different
types of algorithms to calculate a checksum
#eg[#gls("MD5", long: false), #gls("SHA1", long: false),
#gls("SHA2", long: false)]. Older algorithms like #gls("MD5", long: false) have
known vulnerabilities that allow collision attacks while more modern algorithms
like SHA-256 (#gls("SHA2", long: false)) are currently considered to be pretty
much impossible to crack.

While the mathematical theory allows for the possibility of collisions in
checksum hashes, their application in modern checksum algorithms tells a
different story. The sophisticated design of these algorithms significantly
reduces the likelihood of such occurrences, ensuring strong trust in their
effectiveness for generating distinct and reliable representations of data,
despite the theoretical potential for identical hashes of different inputs.

#info-box(kind: "info")[
  Choosing an appropriate checksum algorithm is paramount due to the rapid
  evolution of computational power as described by Moore's Law
  #cite(<4785860>,form:"normal"), which leads to previously secure algorithms
  becoming vulnerable as computing capabilities expand.

  For instance, #gls("MD5") checksums, once deemed secure for storing passwords,
  are now easily compromised through brute force attacks. This underlines the
  need for an adaptable approach to checksums, continually updating them to stay
  ahead of advancements in computational attack strategies. According to
  @courtes_2022_6581453[Notes on SHA-1, p.16], the SHA-1 algorithm family is now
  approaching end of life.

  To ensure the highest level of security and adaptability to future
  computational capabilities, it is advisable to use SHA-2 algorithm family such
  as SHA-384 or SHA-512. These algorithms provide a longer bit length, offering
  enhanced security and a lower risk of collisions, making them well-suited for
  securing sensitive data in the face of evolving technological threats.
]

==== Reproducibility

The concept of reproducibility can be applied in various situations, this thesis
will concentrate on a particular application area, thereby narrowing its scope.
In this thesis, a computation will typically refer to the process of compiling
source code into a binary file, except in cases where it is explicitly defined
differently.

Reproducibility is a property of a computation. It is the ability to
consistently obtain identical results across multiple runs of a computation.

#definition(term: "Reproducibility", name: "def-reproducibility")[
  Reproducibility is a property of a computation satisfying the following
  condition:

  #box[
    $
      & forall c in C, forall i in I, forall e_1, e_2 in E, quad "eval"( c, i, e_1 ) eq "eval"(c, i, e_2)
    $
  ]

  where
  - $C$ is the set of all possible computations
  - $I$ is the set of all possible inputs arguments
  - $E$ is the set of all possible execution environments (hardware, software,
    space, time)

  Once that condition is met, the computation is considered to be reproducible.
]

The set $I$ and $E$, respectically representing the set of all possible inputs
and the hardware and software environment including the date and time, are also
considered as abstractions. In reality, these sets are complex entities composed
of interdependent components. For the purpose of this definition, however, they
are treated as atomic.

We could consider expanding the list of arguments to achieve greater
specificity, delving deeper into the intricate details that influence
reproducibility. However, the objective here is to provide the reader with an
initial understanding of reproducibility through a formal definition. This
approach is about finding a balance between comprehensive detail and conceptual
clarity, thereby offering a foundational glimpse into the formalism that
underpins reproducible computational processes without becoming mired in
excessive complexity.

The definition of reproducibility (@def-reproducibility) closely matches the
definition of pure function (@def-pure-function) and, inherently, mathematical
functions. However, as seen in @table-function-computation, understanding the
nuances between theoretical functions and practical computations is essential.
Theoretically, mathematical functions are conceptualised as $I -> R$, reflecting
the abstract nature of mathematics where the function's result $R$ is purely
dependent on its inputs $I$ and external factors are considered non-existent. In
the practical world, this theoretical construct is transposed through an
evaluation function (@def-evaluation). For mathematical functions, this
environment parameter is known and intentionally left empty, symbolising the
deliberate exclusion of external influences and striving to maintain the purity
of the theoretical definition. This is in contrast to practical computations in
programming, where the environment parameter $E$ is often filled with various
real-world parameters and factors, reflecting the nature of computations where
outcomes are influenced by the environment variable.

#figure(
  include "../../resources/typst/functions-vs-computations.typ",
  caption: [Nuances between functions and computations],
  kind: "table",
  supplement: "Table",
) <table-function-computation>

This fundamental distinction underscores the challenges of achieving
reproducibility and predictability in the practical realm, necessitating
robustness and adaptability to manage the variability and complexity of
real-world conditions. Together, these definitions provide a comprehensive
paradigm for understanding the interplay between the idealised theoretical
constructs and their practical applications, emphasising the importance of
environmental control in ensuring the computations' reproducibility. The concept
of reproducibility, a computational property, underscores the ability to
replicate results across different environments within $E$, serving as a
cornerstone for verifying and validating scientific work.

The process of controlling the computational environment $E$ underscores a
fundamental challenge in #gls("SE"): achieving reproducibility through
environment standardisation. The environment includes specific factors such as
hardware and software configurations #eg[#gls("CPU"), #gls("OS"), library
versions, and runtime conditions] that directly affect a function's behaviour
and output. The Monte Carlo simulation algorithm (@montecarlo-pi.c), exemplifies
this challenge: it may be reproducible at build time but can exhibit variance at
run time due to environmental factors.

This singularity highlights the essence of reproducibility: the need to
meticulously control or normalise the environment in which computations occur.
By ensuring that ideally environment remains constant, we can more closely
approximate the behaviour of pure computations in practical software systems.
This approach aim to simplify the computational model and serves as a strategic
endeavour to minimise the unpredictability introduced by varying environments.

In conclusion, while the formalism of computations' purity and reproducibility
provides the basis of a theoretical framework, the practical application in
#gls("SE") involves the intricate task of environment management. It is through
this lens that we understand reproducibility not just as a characteristic of the
function itself, but as a holistic property of the entire computational
ecosystem, encompassing both the function and its operating environment. This
broader view acknowledges that while pure functions offer a paradigm for
reproducibility, achieving this in complex, real-world systems often
necessitates rigorous control and standardisation of the computational
environment which is virtually impossible to deliver.

=== Software Security

The concept of reproducibility is pivotal in software security. It ensures that
software can be consistently recreated or regenerated from its source code,
guaranteeing that the software's behaviour remains unchanged across different
builds. This consistency is crucial for verifying the security of software
systems. If a software build is reproducible, security experts can confidently
assess that the build has not been tampered with or altered to include malicious
code. This becomes increasingly important in an era where cybersecurity threats
are both sophisticated and prevalent.

In the context of software security, reproducibility also aids in the
traceability and verification of software components. It allows for the thorough
examination and validation of all parts of the software, ensuring they are
exactly as intended and free from vulnerabilities or unauthorised alterations.
This traceability is particularly relevant in light of the executive order
14028, #emph[Improving the Nation's Cybersecurity], issued by
@Executive-Order-14028. This document underscores the importance of enhancing
cybersecurity across federal agencies and emphasises the integrity of the
software supply chain.

The European counterpart, the #gls("CRA") by the European Union reinforces these
efforts by setting cybersecurity requirements for software. It is the first
European regulation imposing minimum cybersecurity requirements on all
interconnected products put on the European market
#footnote[https://ccb.belgium.be/en/cyber-resilience-act-cra], to make them more
secure. This act aims to reduce vulnerabilities in software products, enhancing
security throughout their lifecycle. Software must come with clear information
on their features and instructions for secure installation, operation, and
maintenance. This strategy reflects a commitment to producing and using
reproducible software.

==== Software Bill Of Materials

The #gls("SBOM") is an essential element, acting as a detailed inventory of all
the components required to build and operate a piece of software, including all
applied patches and licensing information in a structured and well-known format.

There are multiple existing formats and standards, the most common ones are:
- #gls("SPDX", long: true): A comprehensive standard maintained by the Linux
  Foundation, designed to facilitate license compliance, security, and broader
  software component analysis through a detailed documentation approach,
  supporting multiple formats like RDF, JSON, and YAML. It caters to a wide
  range of stakeholders, including software companies, legal teams, and
  open-source projects, with a particular strength in granular licensing
  details.
- #gls("CycloneDX", long: false): A lightweight #gls("SBOM") standard aimed at
  enhancing application security and managing software supply chain risks. It
  emphasises simplicity and efficiency, supporting formats such as XML, JSON,
  and ProtoBuf, and is particularly tailored towards the identification of
  software components, their vulnerabilities, and risk assessments, making it a
  favourite in the application security and #gls("DevSecOps") communities.

The key differences between the #gls("SPDX") and #gls("CycloneDX") formats lie
primarily in their focus, structure, and community support. The choice between
#gls("SPDX") and #gls("CycloneDX") should be guided by an organisation's
specific needs, whether the focus is on extensive licensing compliance or
streamlined security and risk management within the software supply chain.

The #gls("CRA") #cite(<CRA>, form:"normal") mandates the incorporation of a
#gls("SBOM") in software products, highlighting its important role in bolstering
software security and transparency. This requirement marks a significant
advancement in enhancing the integrity and security of software, ensuring that
all components are meticulously documented and traceable throughout the software
lifecycle. While the #gls("CRA") includes multiple measures, most will take
effect three years after its passage, likely in early 2027. Specifically,
regarding #gls("SBOM"), the following applies to products with digital elements
available: #quote[identify and document vulnerabilities and components contained
in products with digital elements, including by drawing up a software bill of
materials in a commonly used and machine-readable format covering at the very
least the top-level dependencies of the products]
#cite(<CRA>, supplement: "Annex I, Part II (1)", form:"normal").

==== Supply Chain <ch2-supply-chain>

A software application consists of multiple components, each developed by
different teams or organizations. These components are then composed together
into a final product, which is the software application itself. This process is
known as the #emph[software supply chain]
#cite(<malka-hal-04482192>, form: "normal").

Contemporary software development leverages the concepts of composability and
reusability, preferring the integration and reuse of existing libraries over
developing new functionalities from scratch. This methodology enhances
productivity and contributes to the creation of more reliable software by
allowing each component to concentrate on executing a specific function
effectively. This reliance on external components results in the accumulation of
direct and indirect dependencies, adding complexity to the software supply
chain. The build environments, which encompass all necessary components and
their precise versions for software compilation, become intricate and difficult
to replicate across different systems and over time. This growing complexity,
"politely called #emph[dependency management]" #cite(<8509170>, form:"normal")
but more colloquially known as #emph[dependency hell], is a phenomenon that
developers have become all too familiar with. While Semantic Versioning
(@package-managers) offers a strategy to mitigate these issues, it alone is
insufficient to ensure reproducibility
#cite(<TSE2019>, form: "normal", supplement: [p.11]).

To illustrate this concept, the graph in
@python-runtime-dependencies-graph-with-flaw acts as a simplified #gls("SBOM")
for "My App" version `1.2.3`, highlighting its runtime dependencies essential
for the application's operation. This visualization selectively excludes the
build-time dependencies required for the application's compilation to maintain
conciseness. A vulnerability has been identified in `xz` (marked in red), a
critical runtime dependency. Consequently, this vulnerability could potentially
compromise its dependent components (marked in orange), including the
application itself, underscoring the interconnected risk within the software's
dependency graph. This scenario, while being a simplified representation,
mirrors the recent CVE-2024-3094 #cite(<CVE-2024-3094>, form: "normal") in the
`xz` project #cite(<xz>, form: "normal"), which affected numerous software
applications and highlighted the criticality of managing software supply chain
risks.

#figure(
  include "../../resources/typst/my-app-graph-not-ok.typ",
  caption: [
    Dependency graph of `my-app` version `1.2.3`, where a flaw has been detected
    in `xz` dependency
  ],
) <python-runtime-dependencies-graph-with-flaw>

These issues are known as #emph[supply chain attacks], a type of cyber attack
that targets vulnerabilities in the supply chain of software or hardware
products, with the aim of compromising the final product by infiltrating its
development or distribution process. This can involve tampering with the
production of components, the assembly of systems, or the delivery of software
updates, thereby infecting end users who trust these sources. One particular
aspect of supply chain attacks is that even the original authors of the software
may be unaware that their product has been compromised, as the malicious
alterations often occur downstream in the supply chain. Although not as frequent
as direct attacks on software or systems, supply chain attacks are becoming
increasingly common due to their potential for widespread impact. Gartner
predicts that by 2025, 45% of organisations worldwide will have experienced
attacks on their software supply chains, a three-fold increase from 2021
#footnote[
  https://www.gartner.com/en/newsroom/press-releases/2022-03-07-gartner-identifies-top-security-and-risk-management-trends-for-2022
] while Cybersecurity Ventures predicts that the global cost of software supply
chain attacks to businesses will reach nearly \$138 billion by 2031
#footnote[https://go.snyk.io/2023-supply-chain-attacks-report.html].
Notable examples include the #emph[Stuxnet] worm in 2010
#cite(<mueller2012stuxnet>, form: "normal"),
the #emph[Heartbleed] bug discovered in 2014
#cite(<Heartbleed101>, form: "normal"), and the #emph[SolarWinds] breach in 2020
#cite(<solarwinds-9579611>, form: "normal"). These incidents highlight the
exploitation of interconnectedness and inherent trust within the supply chain,
making supply chain attacks particularly insidious and effective methods of
cyber warfare that can simultaneously affect a large number of users or
organisations.

==== Reproducibility And Security

Reproducibility is a fundamental aspect of software security, particularly in
the context of the software supply chain. It ensures that software can be
reliably and consistently regenerated from its source code, thereby safeguarding
against malicious alterations or tampering. This is particularly relevant in the
context of supply chain attacks, where the integrity of the software supply
chain is compromised, potentially leading to widespread security breaches.

It is paramount to have a clear understanding that having something reproducible
does not mean that it is secure. It is a necessary condition but not a
sufficient one. If a compiler is flawed, it might produce reproducible builds
that could also be potentially insecure.

#figure(
  {
    set text(font: "Virgil 3 YOFF")
    image("../../resources/images/security-independent-builds.svg")
  },
  caption: [
    The reproducible builds approach to increasing trust in executables built by
    untrusted third parties.
  ],
) <security-independent-builds>

In @security-independent-builds inspired from @abs-2104-06020, end-users should
disregard the binary artefact supplied by their software vendor if its checksum
(`806e7...9c271`) diverges from those generated by independent third parties
(`4e14e...4c0a9`). The security of software is deemed more robust when its
reproducibility is confirmed across multiple environments. It is the consensus
among these environments that contributes to the perception of security. The
premise here is not merely the reproducibility, but the uniformity of this
reproducibility across space and time, which strengthens the trust in the
software's integrity and security.

As cyber threats evolve, ensuring that software can be reliably and consistently
bit-per-bit reproduced from its source code becomes a cornerstone for
maintaining security integrity. Reproducibility not only facilitates the
verification of software for tampering or malicious alterations but also
strengthens trust in software systems amidst the growing complexity of cyber
threats. Therefore, integrating reproducibility into software development and
distribution processes is a crucial step towards enhancing overall cybersecurity
resilience and safeguarding against the ever-increasing sophistication of cyber
attacks.

=== Reproducibility Utopia <ch2-r13y-utopia>

Reproducibility in #gls("SE") is often considered as an utopia. The exact
replication of a software poses a significant challenge. Thus, while striving
for reproducibility is essential, achieving absolute reproducibility is
frequently unattainable in practice.

One of the primary impediments in achieving reproducibility lies in the
dependency on hardware architecture. Software compiled for different
architectures, such as `x86` and `ARM,` inherently produces disparate binaries #cite(<patterson2013>,form:"normal").
These differences stem from the instruction sets and optimizations that are
specific to each platform, leading to divergent outputs despite using identical
source code. This variance highlights a significant reproducibility challenge,
as achieving bitwise identical results across architectures is *not feasible* as
of today.

Compilers #eg[GCC, Rustc, #LaTeX, Typst] also play a role in software
development, transforming high-level code into machine-level instructions.
However, not all compilers operate deterministically. In this context,
non-determinism refers to the phenomenon where compilers produce different
outputs given the same input source code across different compilations. Factors
contributing to this non-determinism include variations in memory allocation,
inclusion of timestamps, and embedding of file paths in the binary output. These
variances pose challenges to achieving consistent, reproducible builds.

#info-box[
  A compiler is essentially an application that transforms input into output.
  Tools like GCC are referred to as compilers because they convert high-level
  code into machine-level instructions. However, the term #emph[compiler] is not
  limited to programming languages alone. For example, #LaTeX is a compiler that
  transforms a `.tex` file into a `.pdf` file, rustc compiles a `.rs` file into
  a binary file, and Typst compiles a `.typ` file into a `.pdf` file. Typically,
  compilers convert human-readable files into machine-readable files.
]

In @chapter3, acknowledging the reality that full reproducibility may not be
entirely achievable, we will delve deeper into these challenges by exploring the
impact of non-deterministic compilers and the strategies to mitigate these
challenges using different methods.

== Deterministic Builds And Environments

In this section, we will explore the concept of deterministic builds, and the
potential sources of non-determinism in software builds.

The concept of deterministic builds is essential for ensuring reproducibility. A
build is termed #emph[deterministic] when it consistently generates identical
outputs from a given set of inputs, irrespective of the environment or time of
execution. This predictability is central to software reproducibility, yet
multiple sources of non-determinism often hinder its achievement. One single
non-deterministic component in a build process can render the entire build
non-deterministic. Therefore, it is crucial to identify and understand these
sources of non-determinism to ensure reproducibility. Numerous sources of
non-determinism are tied to the environment where the build takes place. This
environment encompasses the hardware, software, and runtime conditions in which
the build process is executed. These factors directly affect the build process,
impacting the consistency of the output.

#definition(term: "Deterministic build", name: "def-deterministic-build")[
  Let $B$ be a build process defined as a function:

  $B: I times E -> O$

  where
  - $I$ is the set of all possible input arguments
  - $E$ is the set of all possible execution environments (hardware, software,
    space, time)

  then the build B is deterministic if $I times E$ is deterministic:

  $"Determinism"(I times E) -> "Determinism"(B)$

  where `Determinism` is a function asserting that its argument is
  deterministic.
]

According to @abs-2104-06020, a reproducible build environment is essential for
achieving deterministic and reproducible builds. It ensures consistency in the
software building process by providing a controlled and predictable set of
conditions under which the software can be built. @malka-hal-04430009[p.1]
further elaborate that a build environment is reproducible in both space and
time when it is possible to replicate the same build environment on any machine
and at any point in the past or future​​​​.

#info-box[
  When a process exhibits a lack of reproducibility over time, it indicates a
  fundamental instability within the process. While it would be technically
  feasible to replicate the same output in a different environment, within the
  same architecture, achieving exact temporal replication of the build process
  is practically impossible. This temporal variability serves as a critical
  indicator of potential difficulties in ensuring reproducibility across diverse
  environments or machines.
]

=== Computational Environments <ch2-environments>

Environments where a build or computational process occurs can be broadly
categorised into two types: hardware and software environments
#cite(<strangfeld_2024>,form:"normal", supplement: "p. 8, section 2.1"). While
software environments can be managed to a high degree of consistency, achieving
reproducibility across different hardware, particularly different #gls("CPU")
architectures #eg[`x86`, `ARM`], is essentially impossible. Tasks like
instruction execution, memory management, and floating-point calculations are
handled in distinct ways. Even small variations in these processes can lead to
differences in output. Consequently, even with identical software, builds on
different types of #gls("CPU") architectures will produce different results.
When something is said to be reproducible, it typically means reproducible
within the same #gls("CPU") architecture. Therefore, this section will focus
exclusively on the reproducibility challenges within software environments.

A software environment is composed of the #gls("OS"), along with the set of
tools, libraries, and dependencies required to build or run a specific
application. Any change in these components can influence the outcome of a
software build or execution. For example, a minor update to a library could
potentially alter the behaviour of the software, producing different outcomes
across different executions​​ or more importantly, have an impact on the security
level.

To enhance reproducibility, it is critical to ensure that the software
environment remains stable and unaltered during both the build and execution
phases. Unfortunately, conventional #glspl("OS") such as Linux distributions,
Microsoft Windows, and macOS, are #emph[mutable] by default. This mutability is
primarily facilitated through package managers, which enable users to easily
modify their environments by installing or upgrading software packages​. As a
result, uncontrolled changes to dependencies may also lead to inconsistencies in
software behaviour, or have a impact on the security level, undermining
reproducibility​.

To mitigate these issues, #emph[immutable] environments have gained popularity.
Tools such as Docker #cite(<docker>,form:"normal") provide mechanisms to
encapsulate software and their dependencies in containers, thus creating
environments that remain unchanged after creation. Once a container is built, it
can be shared and executed across different systems with the guarantee that it
will function identically, given the same environment. This characteristic makes
containers highly suitable for distributing software.

Despite the advantages of immutability, it does not guarantee reproducibility.
For instance, container images hosted on platforms like Docker Hub
#cite(<dockerhub>,form:"normal"), including popular language interpreters
#eg[Python, NodeJS, PHP], may not be reproducible due to non-deterministic
steps during the image creation (at build-time). A specific example can be found
in #ref(<python-dockerfile>), which runs `apt-get update` at line 4 as part of
the image build process. Since `apt-get` pulls the very latest version of
package index during its creation, it is impossible to build again the same
image later, compromising Docker's build-time reproducibility.

#figure(
  sourcefile(
    lang: "dockerfile",
    read("../../resources/sourcecode/python.dockerfile"),
  ),
  caption: [
    An excerpt of the Python's Dockerfile
    #cite(<python-dockerfile-repository>,form:"normal") used to build the
    #emph[official] Python images.
  ],
) <python-dockerfile>

Docker images, once built, are immutable. While Docker does not guarantee
build-time reproducibility, it has the potential to ensure run-time
reproducibility, reflecting Docker's philosophy of
#emph["build once, use everywhere"]. This distinction between build-time
reproducibility (@def-reproducibility-build-time) and run-time reproducibility
(@def-reproducibility-run-time) is key. Docker does not ensure that an image
will always be built consistently, often due to the base image used (as
declared in the `FROM` directive of a `Dockerfile`), as seen in
@python-dockerfile. Although building a reproducible image with Docker is
technically possible, it would require additional effort, external tools, and a
more complex setup. Therefore, we assume that build-time reproducibility is not
guaranteed, but the immutability of the environment significantly enhances the
potential for reproducibility at run-time.

#info-box(kind: "important")[
  Docker is a platform for building, shipping, and running applications in
  containers, with Docker Hub #cite(<dockerhub>,form:"normal") providing a large
  repository of container images, which has significantly contributed to
  Docker's popularity. Among these are the #emph[Docker "official" images]
  #cite(<dockerofficialimages>,form:"normal"), which are curated and reviewed by
  the Docker community. These images offer standard environments for popular
  software and adhere to some quality standards.

  However, the term "official" can be misleading. One might suggest that these
  images are maintained by the original software's developers, but it's not
  always the case. For example, the PHP Docker image
  #cite(<dockerhubphpimage>,form:"normal") is not maintained by the core PHP
  development team. This means updates or fixes may not be as prompt or
  specific as if the software’s developers maintained the image.

  While Docker vets these images for quality, responsibility for the contents
  rests with the maintainers. Users should be aware that official images are not
  immune to security risks or outdated software, and reviewing the documentation
  for issues is advisable.

  In summary, Docker "official" images are trusted but may not be maintained by
  the original software’s maintainers. Developers must use them with caution and
  full awareness, particularly in production environments, and ensure that the
  images meet their security and functionality requirements.
]

Package managers are a critical aspect of the reproducibility puzzle since they
can manage the state of a computational environment. Without proper control over
how software and their dependencies are resolved and installed, achieving
consistent and reproducible builds becomes difficult​.

=== Sources Of Non-Determinism

In this section we will explore the sources of non-determinism in software
builds and usage. The list is not exhaustive, it just includes the most common
sources of non-determinism. The list is created from @abs-2104-06020's paper
and information of the @ReproducibleBuildsOrg project, a global initiative
aiming at improving reproducible builds in software development.

==== Randomness

Using random data in a computation is a common source of non-determinism and
must be avoided. When random data is required, the solution is to use a
predetermined value acting as a seed to the pseudo-random number generator.
Using a predetermined value as a seed ensures that the same random data is
generated each time the computation is executed, thereby guaranteeing
reproducibility.

Hardcoding the seed in the source code would be nonsensical because it would not
be random any more, the seed should be passed as a parameter to the computation.
This parameter can be passed as a command-line argument, an environment
variable, or a configuration file, leaving the responsibility to the user to
provide a seed.

==== Build Paths

Build paths are paths used by the source code to locate files and resources.
Sometimes, it can happen that absolute paths are used in the source code, which
means that the build will only be reproducible on the same machine where it was
built.

To avoid this, relative paths should be used instead of absolute paths and
sometimes post-processing is required to remove the build path or to normalize
it with a predefined value.

==== Volatile Inputs

Volatile inputs are inputs that can change over time. For example, the current
date and time are volatile inputs, network streams as well. Dealing with date
and time will be done in @timestamps. For network streams, the solution is to
never rely on remote data while building. Instead, the data should be downloaded
beforehand and stored locally.

This is a common issue in the context of software compilation, where the build
process might download dependencies from the internet during the build.

==== Package Managers <package-managers>

Package managers are tools that automate the process of installing, upgrading,
configuring, and removing packages, typically from a central repository or
package registry. They are widely used in software development to manage
dependencies and facilitate the build process. For example, `Cargo` for Rust,
`Composer` for PHP, `NPM` for NodeJS, `Dune` for OCaml, `tlmgr` for #LaTeX.
Package managers are also used to manage software at the operating system level
like: `apt` in Debian based distributions, `pacman` in Arch Linux, `dnf` in
Fedora, `brew` in macOS, `chocolatey` in Windows
#cite(<9403875>, form: "normal", supplement: [p. 10]).

Package managers can inadvertently introduce non-determinism by automatically
downloading or updating dependencies to their latest versions. This process can
lead to inconsistencies, particularly when a newer version of a package includes
changes that are incompatible with the project's codebase. To mitigate this, the
#gls("SemVer") scheme is widely adopted, offering a structured version naming
convention that aids dependency management. However, while packages may declare
#gls("SemVer") compliance, adherence levels vary, with some strictly following
#gls("SemVer") principles and others adopting them more leniently
#cite(<TSE2019>, form: "normal", supplement: [p.5]). Notably, there has been a
trend towards increasing adoption and stricter adherence to #gls("SemVer")
principles by package managers over time
#cite(<TSE2019>, form: "normal", supplement: [p.13]). It provides a structured
version naming convention designed to convey the nature of changes between
releases, thereby aiding in the management of dependencies with a syntax that
succinctly specifies version constraints. While this mechanism greatly
facilitates dependency resolution by leveraging a minimalistic syntax, it
inherently permits variability over time, potentially compromising
reproducibility.

#figure(
  sourcefile(
    lang: "json",
    file: "../../../resources/sourcecode/composer.json",
  ),
  caption: [A `composer.json` file, used by the PHP package manager, Composer],
) <composer-json>

In @composer-json, the dependency `foo/http` is specified with version `^1`,
where the caret symbol (`^`) indicates that Composer should install the latest
minor version within the major version `1`. In contrast, the dependency
`foo/bar` is locked to version `1.2.3`, signalling that Composer must install
that specific version, regardless of newer releases. This distinction
underscores the importance of using package managers judiciously to achieve
determinism. For Composer, determinism is further ensured by including a
`composer.lock` file in the project, which explicitly pins each dependency to a
particular version, thus facilitating reproducibility. The decision to require
this file varies by project and is not in the scope this master thesis.

Ensuring reproducibility in the context of package managers is particularly
challenging due to the amount of different ecosystems and the lack of
standardisation. For example, in the Python realm#footnote[
  https://linuxfr.org/news/l-installation-et-la-distribution-de-paquets-python-1-4
], there have been and there are still multiple package manager ecosystems:
`distutils`, `setuptools`, `pip`, `pypi`, `venv`, `conda`, `anaconda`, `poetry`,
`hatch`, `rye`, `uv`. Each of these has its own configuration file format, which
can be used to specify the version of each dependency. However, there is no
standardisation which makes it difficult to ensure reproducibility. The same
issue applies to operating system's package managers. For example, in Debian
based distributions, there are multiple package managers: `apt`, `aptitude`,
`dpkg`.

A potential solution would be to use a universal package manager that would work
across all Linux distributions and programming languages. Tools like `AppImage`,
`snap` and `flatpak` aim to address this challenge, albeit at the operating
system level. These tools simplify the process of transferring a single piece of
software and its pre-built dependencies to various systems. However, they do not
include the C library, leading to potential compatibility issues on newer or
older systems, depending on the version on which the software was originally
built #cite(<9403875>, form: "normal", supplement: [Appendix A.B.2)]).
Furthermore, while these tools represent a step in the right direction, they
introduce their own set of challenges, such as a lack of standardisation among
them, limited adoption, and insufficient support from major distributions.

There are also package managers such as `Nix` and `Guix` that tackle the issue
by being independent and universal. These can be installed and used on GNU/Linux
operating systems, with Nix additionally supporting macOS and FreeBSD. These
package managers offer a method to build and install packages within a sandboxed
environment, thereby isolating them from the rest of the system during build
time #cite(<9403875>, form: "normal", supplement: [Appendix A.B.3)]). This
approach greatly improves reproducibility. We will explore these package
managers further in @chapter4.

==== Version Information

Version information like commit identifiers can be used to precisely identify
the source code used to build a program.

#figure(
  shell(file: "../../../resources/sourcecode/listing-typst-version.log"),
  caption: [Example of program including a commit ID],
) <listing-typst-version>

As illustrated in @listing-typst-version, incorporating specific version
information, such as a commit ID, helps reproduce a build by facilitating the
retrieval of an identical source code version. Nevertheless, the efficacy of
commit IDs as reproducibility anchors remains debatable. These identifiers may
frequently be unavailable at the time of build. It is important to recognise
that `git`, a distributed version control system designed for projects of all
sizes with speed and efficiency, treats metadata, including commit IDs, as
separate from the source code itself. Instead, it is part of the version control
system in use. `git` allows multiple developers to work together on the same
project simultaneously, providing a robust system for tracking changes, version
history, and collaboration. However, the potential for easy substitution of one
version control system for another renders reliance on such ephemeral metadata a
precarious foundation for software reproducibility.

In scenarios where a version number is necessary, it can be derived from a
dedicated file, such as a changelog or eventually provided through an
environment variable. This approach decouples the versioning process from the
underlying version control system, potentially offering a more stable and
reliable method for software version identification.

==== File Order

It is important to ensure that processing multiple files in a stable order
remains stable.

Listing files relies on the low-level #gls("POSIX", long: false) call `readdir`, which itself is
dependent on the filesystem in use and therefore does not guarantee any
consistent ordering.

#info-box(kind: "info")[
  According to @LibCManual[p.415]: The order in which files appear in a
  directory is often random. A more useful program would sort the entries before
  printing them.

  In @tlpi[p.354]: The filenames returned by `readdir()` are not in sorted
  order, but rather in the order in which they happen to occur in the directory.
  This depends on the order in which the file system adds files to the directory
  and how it fills gaps in the directory list after files are removed.
]

There are numerous situations where relying on an existing list of files can
result in non-determinism. For instance, zhen creating an archive from a
directory's contents, file systems often lack consistent ordering when listing
files. Consequently, the arrangement of files in the archive may differ between
builds, causing unpredictable archives. Although these archives might contain
identical content, they could have been compressed with varying file orders.

To address this, one could enforce a stable order by explicitly sorting the
inputs before processing them. This can be done by sorting the list of files in
the directory based on a specific criterion, such as their names or modification
timestamps.

#figure(
  shell(file: "../../../resources/sourcecode/tar-sort-name-flag.log"),
  caption: [
    Use of `--sort=name` flag to ensure a stable order of files in an archive
  ],
) <listing-tar-sort-flag>

==== Timestamps <timestamps>

Timestamps are among the biggest sources of non-determinism in software builds,
as they can lead to differences due to changing times between builds. Since
reproducibility checks the content of the output and its metadata, building
multiple times some source code will create output artefacts with possibly the
same content but with different metadata, like file timestamps, making them
irreproducible.

Often, timestamps are used to approximate which version of the source were
built. Since file timestamps are volatile, the source code needs to be tracked
more accurately than just a timestamp. Just like for version information, the
solution would be to extract the date from a dedicated file like a changelog, or
a specific commit #cite(<nixpkgs-pull-256270> ,form: "normal").

To circumvent this issue, `SOURCE_DATE_EPOCH` is a specific environment variable
convention for pinning timestamps to a specific value that has been introduced
by the `reproducible-builds.org` community and it is now widely used by many
compilers and build tools.

Another option is to use `libfaketime`, a library that intercepts system
function calls retrieving the current time of day and replies with a predefined
date and time instead.

When none of these options are feasible, a tool like strip-nondeterminism
#cite(<strip-nondeterminism>, form: "normal") can serve as a temporary
workaround for removing non-deterministic information, such as timestamps and
file system ordering, from specific file and archive formats.

==== Locale Environment Variables

#figure(
  shell(file: "../../../resources/sourcecode/date-format-flags.log"),
  caption: [Use `LC_ALL` and `-u` flags to configure the date format],
) <listing-date-format-flags>

`LC_ALL` is a locale environment variable that can modify various aspects of an
application's behaviour. It can change the date format, string collation order,
and character encoding. Although each parameter can be set individually,
`LC_ALL` enables you to configure them all simultaneously and override any other
locale environment variables.

In @listing-date-format-flags, we methodically incorporate various flags, such
as `-u`, and the `LC_ALL` environment variable to the `date` command. This
approach ensures that the output we receive is predictable and consistent,
regardless of the underlying system configuration.

=== Comparing Builds

In the quest for software reproducibility, identifying and understanding the
differences between two builds of the same software becomes paramount,
especially when those builds are not identical. This section introduces a tool
designed specifically for this purpose.

Developed under the umbrella of the @ReproducibleBuildsOrg effort, `diffoscope`
#cite(<diffoscope>, form:"normal") is a comprehensive, open-source tool that
excels in comparing files and directories. Its unique capability to recursively
unpack archives of various types and transform binary formats into a
human-readable form makes it an indispensable tool for software comparison. It
seeks to simplify the process of identifying discrepancies between software
builds. This functionality is crucial for developers and researchers striving to
pinpoint and resolve the causes of non-reproducibility. An online version of the
tool is also available#footnote[https://try.diffoscope.org/].

To demonstrate the effectiveness of `diffoscope` in identifying differences
between non-reproducible builds, @bash-gcc-not-reproducible-builds considers
the hypothetical example of a simple program that outputs the current date and
time. Due to its nature, compiling this program twice, even with the same source
code, will inherently produce two different builds.

First, we compile the sourcecode twice, creating `build1` and `build2`:

#figure(
  shell(
    file: "../../../resources/sourcecode/bash/bash-gcc-not-reproducible-builds.log",
  ),
  caption: [
    Compilation of non-reproducible programs and the use of their checksums for
    comparison
  ],
) <bash-gcc-not-reproducible-builds>

Then, we use `diffoscope` to compare these builds:

#figure(
  shell(
    file: "../../../resources/sourcecode/bash/bash-diffoscope-comparison.log",
  ),
) <bash-diffoscope-comparison>

The tool will generate a detailed report (@diffoscope-report) highlighting the
differences between `build1` and `build2`. In this hypothetical example,
differences might include timestamps or other build-specific metadata embedded
within the binary.

#figure(
  {
    image("../../resources/images/diffoscope-report.svg")
  },
  caption: [A `diffoscope` report using HTML format],
) <diffoscope-report>

=== Fixing Builds

In this subsection, we explore strategies for addressing non-reproducible
builds, recognising the numerous potential causes and the challenge of covering
every solution in detail.

Previously in @bash-gcc-not-reproducible-builds, we encountered an issue, where
compiling the sourcecode (@datetime.c) twice resulted in different binaries.
Using `diffoscope`, we identified, as shown in @diffoscope-report, the source of
variability as date and time strings embedded within the binaries.

A solution has been proposed in @timestamps, we can leverage the
`SOURCE_DATE_EPOCH` environment variable to address this specific challenge in
achieving reproducible builds. This approach standardises the date and time used
during the build process, ensuring consistency across compilations and thus
contributing to reproducibility.

#figure(
  shell(file: "../../../resources/sourcecode/bash/bash-fixing-builds.log"),
  caption: [Fix builds using an environment variable],
) <bash-fixing-builds>

== Conclusion

This chapter embarked upon a detailed journey through the landscape of
reproducibility, focusing particularly on its pivotal role within the realms of
science and, more specifically, #gls("CS") and #gls("SE"). Through rigorous
analysis, we unveiled the multifaceted nature of reproducibility.

We dissected the concept of reproducibility, from its foundational elements in
science to its intricate implications in computer science, delineating the
essential terminology that frames our discussion: computations, pure and impure
functions, inputs, outputs, and the environmental variables that intertwine to
influence reproducibility. The exploration into deterministic builds and the
sources of non-determinism not only highlights the inherent challenges but also
sets the stage for the subsequent focus on the tools and methodologies designed
to tame these complexities.

As we pivot toward the next chapter, our narrative will transition from the
theoretical underpinnings to the practical arsenal at our disposal for enhancing
reproducibility in #gls("SE"). While the groundwork laid in this chapter
prepares for a detailed exploration, it is important to recognise the wide range
of tools and methodologies available in this domain. Given the scope of this
thesis, we will focus on four evaluation methods using three key tools, with the
understanding that this selection is not exhaustive but rather representative of
the broader ecosystem. Through the lens of real-world applications and case
studies, we will explore how these chosen tools are used to mitigate the
challenges identified herein and to foster an ecosystem where reproducible
research and development are not merely aspirational goals but operational
norms.

In fine, this chapter serve as both a foundation and a bridge. It offers a
comprehensive understanding of reproducibility that is critical for appreciating
the significance of the solutions and methodologies discussed in the chapters
that follow. It is within this framework that we continue our quest to demystify
reproducibility, moving from conceptuals clarity to practical application, with
the ultimate aim of enhancing the reliability, security, and transparency of
#gls("SE") practices.

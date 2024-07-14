#import "imports/preamble.typ": *
#import "theme/template.typ": *
#import "theme/common/titlepage.typ": *
#import "theme/common/metadata.typ": *
#import "theme/disclaimer.typ": *
#import "theme/leftblank.typ": *
#import "theme/acknowledgement.typ": *
#import "theme/abstract.typ": *
#import "theme/glossary.typ": *
#import "theme/infos.typ": *
#import "theme/definition.typ": *

#chapterquote(
  title: "Software evaluation",
  ref: "chapter3",
  quoteAttribution: <clarke1973>,
  quoteText: [
    Any sufficiently advanced technology is indistinguishable from magic.
  ],
)

This chapter explores the pivotal role of tooling in achieving reproducibility
within #gls("SE"), highlighting the importance of environment consistency,
dependency management, and process isolation.

Reproducibility in #gls("SE") is not merely a desirable attribute but a
cornerstone of trustworthy, reliable, and verifiable software development
practices. As software systems grow increasingly complex and integral to every
facet of the modern world, from critical infrastructure to personal devices, the
stakes for ensuring their reproducibility have never been higher. This chapter
introduces and examines four distinct methods for building software, each with
its unique approach:

- Bare compilation

  It is the most rudimentary method, depends on the operating system's compilers
  and libraries for software construction.

- Compilation with Docker

  Using containerization technology, encapsulates not just the software and its
  dependencies but also the entire runtime environment.

- Compilation with Nix

  Nix uses a unique store for packages built in isolation, each with a unique
  identifier that includes dependencies, preventing conflicts and ensuring
  reproducible environments.

- Compilation with Guix

  Inspired by Nix, Guix offers a transactional package management system that
  isolates dependencies to ensure consistent and reproducible software
  environments through specific version-linked profiles.

The four evaluation methods chosen for detailed evaluation in the context of
reproducibility represent a wide range of approaches to managing software build
environments, each addressing different aspects of reproducibility. Bare
compilation was selected to provide a baseline, demonstrating the fundamental
challenges encountered without the aid of advanced tooling, such as
environmental inconsistencies and dependency conflicts. This method serves as a
contrast to the more sophisticated techniques that follow. Docker is included
for its widespread adoption and popularity, as well as its approach to
encapsulating the runtime environment, which significantly mitigates issues
arising from system variability. Guix and Nix are examined due to their unique
approach to dependency management and environment isolation, employing a package
management approach that is based on the functional paradigm
(@def-functional-package-management) to ensure exact reproducibility of
environments across different systems. The chapter aims to cover a spectrum from
the most basic to the most advanced strategies.

#definition(
  term: "Functional package management",
  name: "def-functional-package-management",
)[
  From @10-1007-978-3-319-27308-2_47, functional package management is a
  discipline that transcribes the functional programming paradigm to software
  deployment: build and installation processes are viewed as pure functions
  (@def-pure-function) in the mathematical sense whose result depends
  exclusively on the inputs (@def-inputs-outputs), and their result is a value
  that is, an immutable directory.
]

This chapter aims to provide readers with an understanding of how these
contribute to the broader goal of reproducible #gls("SE"). Through a detailed
exploration of each approach, readers will gain insight into the strengths,
weaknesses, and applicability of Bare compilation, Docker, Guix and Nix in
various software development scenarios.

== Methodology

Our primary objective is to assess the reproducibility of a software build using
four different methods: Bare compilation, Docker, Guix, and Nix. By compiling a
C program (@datetime.c) with each tool, we can evaluate reproducibility both
over space and time (@reproducibility).

The study uses a quantitative research design, focusing on the comparison of
binary files generated from compiling identical source code with different
methods, on the same environment. This approach allows for an empirical
assessment of reproducibility challenges inherent to each compilation
tool and environment.

=== Evaluation Criteria

We will consider three primary criteria.

Firstly, *reproducibility in time* assesses whether the outputs of builds are
identical across repeated compilations in the same environment. This criterion
involves compiling the same source code twice with a few seconds of interval
between compilations. By comparing the outputs of these compilations, we can
determine if the build process produces consistent results over time.

Secondly, *reproducibility in space* focuses on the consistency of build outputs
across different environments. To evaluate this, the same source code is
compiled in various environments. This process helps to ensure that the software
build process is not dependent on specific environmental factors and can produce
identical outputs regardless of where it is compiled.

Lastly, the *reproducibility of the build environment* evaluates the stability
and consistency of the environment itself, including the dependencies required
for building the output. This criterion ensures that the environment, which
encompasses all necessary tools and libraries, remains stable and consistent
across different instances and setups.

=== Tools And Technologies

The evaluation of reproducibility tools in this study encompasses several
approaches to software compilation and package management, each with its unique
methodology.

In @ch3-tool1, the bare compilation method involves direct compilation on the
host system without the use of containerization or package management tools.This
approach relies on the default tools and libraries installed in the operating
system, providing a straightforward but less controlled environment for building
software. This method is assessed to understand the baseline reproducibility and
potential variability introduced by the host system's native environment.

In @ch3-tool2, Docker is used to provide a containerized environment for
software compilation. Using Docker containers ensures that the build process
occurs in a consistent and isolated environment, independent of the host
system's configuration. This method helps in evaluating how containerization can
enhance reproducibility by encapsulating all necessary dependencies and tools
within a controlled and replicable environment.

In @ch3-tool3, the Guix package ecosystem is employed to manage the software
build process. Guix focuses on providing a reproducible and declarative approach
to package management, ensuring that the build environment and dependencies are
precisely defined and versioned. This approach is examined for its ability to
maintain consistency and reproducibility across different systems and
environments by leveraging Guix's robust package management features.

In @ch3-tool4, the Nix package ecosystem is used to manage and build software.
Similar to Guix, Nix offers a declarative and reproducible package management
system, allowing for precise control over the build environment and
dependencies. The evaluation of Nix focuses on its capability to provide a
reproducible build environment that can be consistently replicated across
various systems, enhancing the reliability and stability of the software
development process.

=== Scenarios

Our examples and builds focus on custom-made scenarios to highlight the
differences in reproducibility across the four tools. There are multiple
scenarios being evaluated:

In the first scenario, using @ch3-tool1, a C program is built using the host
default C compiler. The second scenario involves @ch3-tool2, where a C program
is built in a Docker container utilizing the C compiler. The third scenario,
with @ch3-tool3, involves building a C program using Guix. Finally, there are
two scenarios for @ch3-tool4: one involves building a C program using Nix legacy
(not flake), and the other uses Nix flake to build the same program.

=== Compilation And Execution <ch3-compilation-execution>

A trivial C program (@datetime.c) has been chosen for its straightforwardness,
allowing the focus to remain on the build process and output rather than
software complexity.

Each method will compile the same C program (@datetime.c) twice. Detailed steps
for compilation and execution within each environment will be documented,
ensuring transparency and reproducibility of the process itself by the readers.
Each compilation's resulting output will be executed to verify functionality,
although the correctness of the execution's output will not be evaluated.

=== Environment Setup

To ensure the robustness and universality of our reproducibility assessment, all
test scenarios described in this chapter are executed through GitHub Actions
#cite(<ghActions>, form: "normal"). GitHub Actions is an automation platform
that enables #gls("CICD"), allowing builds to be performed, tested, and deployed
across various machines and architectures directly from GitHub repositories
#cite(<9978190>,form:"normal").

Our testing environments supports three distinct architectures:

- `x86_64-linux`: This represents the widely used Linux operating systems on
  Intel and AMD processors. To ensure a thorough evaluation, two instances, each
  running the different versions of Ubuntu (`20.04` and `22.04`), are employed.
- `x86_64-darwin`: Dedicated to supporting macOS on Intel processors.
- `aarch64-darwin`: Addressing the latest generation of macOS powered by the
  ARM-based Apple Silicon processors.

This selection encompasses both `x86` and `ARM` architectures, as well as Linux
and macOS operating systems, providing a comprehensive view of reproducibility
across the most commonly used development platforms in #gls("SE"). The choice of
these architectures ensures the results are relevant to a broad spectrum of
development environments and application targets.

Each of our scenarios is streamlined through the use of a `Makefile`. A
`Makefile` as seen in @ch3-example-makefile is a text file that contains a set
of directives used by the GNU `make` #cite(form: "normal", <gnumake>) utility to
automate the build process of software projects. These directives contain
specific shell commands.

#figure(
  {
    sourcefile(
      file: "Makefile",
      lang: "Makefile",
      read("../../resources/sourcecode/example-makefile"),
    )
  },
  caption: [An example of `Makefile` used in a scenario.],
) <ch3-example-makefile>

Each scenario's `Makefile` essentially contain four essential steps:

- `clean`: Removes the build artefact of a build process, if any.
- `build`: Executes a build process, generating an output artefact.
- `check`: Prints the checksum of the build artefact.
- `run`: Execute the artefact

Incorporating these `Makefile` steps into our GitHub Actions workflows not only
automates the execution of each scenario, ensuring consistency and repeatability
in our testing process, but also empowers the reader with the ability to locally
reproduce the steps outlined in this document in full transparency. This
approach facilitates and encourages the direct replication of methods and
scenarios, aligning with best practices in #gls("SE") for reproducibility, but
also extends these principles to broader scientific research practices.

=== Output Comparison

To compare the results, we will compare the checksums of the resulting outputs.
We exclusively use the `nix hash path` command provided by the Nix package
manager to compute the hash of a path.

#info-box(kind: "important")[
  The `nix hash path` command is provided by Nix, a tool we will explore in this
  chapter. Nix provides this command as part of its suite, but it can be applied
  anywhere, not just to files within the Nix ecosystem. This command
  distinguishes itself by its capacity to hash directories in addition to files.
  An alternative to this approach could have been the use of a
  #gls("SWHID") #cite(<hal-01865790>,form:"normal").
]

The `nix` command is available on systems with Nix installed. The difference
with a traditional `sha256sum` is that the former computes the hash of the path,
which includes the content and the metadata while the latter computes the hash
of the content only. Another advantage of using that command is its ability to
create a hash prefixed by the algorithm used, similar to #gls("SRI")
#cite(<sri>, form: "normal") hashes.

=== Expected Outcomes

At the opposite of the previous more theoretical chapters, this practical
chapter aims to empirically compare the differences in reproducibility
achievable with Bare compilation, Docker, Guix, and Nix. Insights into the
challenges and benefits of each method will inform best practices in #gls("SE")
for achieving reproducible builds.

== Evaluation 1 - Bare compilation <ch3-tool1>

This method is the most rudimentary approach to software compilation, relying on
the host system's installed compilers and libraries to build software. This
build method correspond to Scenario 1, with the corresponding `Makefile` in
@ch3-makefile-scenario1, that can be executed on any system, with the commands:
`make build` to compile, `make check` to print the checksum, #raw("make run") to
run the compiled binary. As explained in @ch3-compilation-execution, we notice
that the steps are executed twice and in @ch3-tool1-build, the steps to build,
check and run the build are detailed.

#figure(
  {
    sourcefile(
      file: "Makefile",
      lang: "Makefile",
      read("../../lib/scenario-1/Makefile"),
    )
  },
  caption: [`Makefile` of Scenario 1],
) <ch3-makefile-scenario1>

#figure(
  {
    shell(read("../../resources/sourcecode/scenario-1.log"))
  },
  supplement: "Terminal session",
  kind: "terminal",
  caption: [Terminal log of the steps to build, check and run Scenario 1],
) <ch3-tool1-build>

At lines 4 and 9 of @ch3-tool1-build, we notice that the `make check` step
prints two different checksums, indicating that the output of the two builds is
different at each run. As a result, this build is not reproducible. This
discrepancy in the output is likely caused by the dynamic replacement of the
`__DATE__` and `__TIME__` macros in the source code, which are replaced with the
current date and time at the moment of compilation.

#heading(outlined: false, level: 3, "Reproducibility In Time")

This method involves directly compiling source code on a system with only the
essential compilers and libraries available on the host. This method's primary
advantage lies in its simplicity and direct control over the build process,
allowing for a clear understanding of dependencies and compilation steps.
However, it lacks isolation from the system environment, leading to potential
#emph[it works on my machine] issues due to variations in system configurations.
Additionally, the lack of encapsulation and dependency management can lead to
difficulties in achieving consistent and reproducible builds across different
environments. This method is therefore classified as non-reproducible in time.

#heading(outlined: false, level: 3, "Reproducibility In Space")

This method is not reproducible in time, therefore we will consider it as not
reproducible in space either. Technically it would be possible to reproduce the
same output on another environment, but it would be practically impossible to
run the build at exactly the same time. This method is therefore classified as
non-reproducible in space.

#heading(outlined: false, level: 3, "Reproducibility Of The Build Environment")

The virtual machines used on Github Actions are versioned. However, the software
installed on the images are not. From one build to another, we can have
a different version of `gcc` or any other software installed on the image.
Therefore, we have absolutely no control over the build environment and it is
very complicated to reproduce the same environment on another machine.
Therefore, reproducibility of the build environment is not guaranteed.

== Evaluation 2 - Docker <ch3-tool2>

Docker #cite(<docker>,form:"normal") has revolutionised software deployment by
encapsulating applications in containers, ensuring they run consistently across
any environment. Unlike traditional virtual machines, Docker containers are
lightweight, share the host's kernel, and bundle applications with their
dependencies, promoting the principle of #emph["build once, run anywhere"]. This
approach streamlines development, testing, and production workflows,
significantly reducing compatibility issues and, to some extent, simplifying
scalability.

Central to Docker's appeal is its contribution to the #gls("DevOps") movement,
fostering better collaboration between development and operations teams by
eliminating the #emph["it works on my machine"] problem. Docker's ecosystem,
including the Docker Hub #cite(<dockerhub>, form: "normal"), offers a vast
repository of container images, facilitating reuse and collaboration across the
software community.

Docker uses the #gls("OCI") standard for its container images, ensuring
interoperability across different containerization technologies, including
@podman and @kubernetes. The #gls("OCI") specification outlines a format for
container images and a runtime environment, aiming to create a standard that
supports portability and consistency across various platforms and cloud
environments.

Due to its popularity #cite(<9403875>, form: "normal", supplement: [p. 9]),
Docker is a key player in modern software development, enabling efficient,
consistent, and scalable applications through containerization, supporting agile
and #gls("DevOps") practices, and accelerating the transition from development
to production.

#figure(
  sourcefile(
    file: "Dockerfile",
    lang: "dockerfile",
    read("../../lib/scenario-2/Dockerfile"),
  ),
  caption: [From Scenario 2, the `dockerfile` used by Docker],
) <ch3-dockerfile>

This method involves creating an #gls("OCI") image, compiling @datetime.c,
through a `Dockerfile` and setting the compilation result as default command as
shown in @ch3-dockerfile. This ensures that each time the image is executed, the
compiled executable runs within the container. However, instead of printing only
the checksum of the resulting binary, the `check` step also outputs the checksum
of the image.

#figure(
  shell(read("../../resources/sourcecode/scenario-2.log")),
  supplement: "Terminal session",
  kind: "terminal",
  caption: [Terminal log of the steps to build, check and run Scenario 2],
) <ch3-docker-build>

#heading(outlined: false, level: 3, "Reproducibility In Time")

In @ch3-docker-build, it is observed on lines 5 and 12 that building the image
twice and extracting the resulting binary produces different checksums.
Additionally, on lines 6 and 13, it is evident that the checksums of the images
are inevitably different. Consequently, this method is classified as
non-reproducible over time.

#heading(outlined: false, level: 3, "Reproducibility In Space")

This scenario was executed on various machines and architectures, resulting in
different binaries and images. Therefore, this method is classified as
non-reproducible in space as well.

#heading(
  outlined: false,
  level: 3,
  "Reproducibility Of The Build Environment",
) <ch3-docker-build-env>

The reproducibility of build environments in Docker images, while generally
reliable in the short term, can face challenges over time. Docker images are
built on layers, often starting from base images provided by specific vendors.
These base images can receive updates that alter their contents, meaning a
`Dockerfile` that successfully built an image at one time might not produce an
identical image later due to changes in its base layers
#cite(<9403875>, form: "normal", supplement: [p. 1]). Additionally, not
pinning specific versions of base images and external dependencies in the
`Dockerfile` can lead to inconsistencies, making the exact reproduction of a
Docker environment challenging if not managed carefully. Therefore, while Docker
simplifies the consistency of deployment environments, ensuring long-term exact
reproducibility requires careful management of image sources and dependencies.

Docker is intrinsically designed to facilitate reproducible builds, with the
capability to generate identical containers across multiple executions. However,
the challenge to reproducibility arises not from Docker's fundamental features
but from the use of specific base images within Docker containers. A significant
illustration of this problem is shown in @ch3-docker-build, where rebuilding the
image results in different containers even though the base image version has
been pinned to a specific commit at lines 1 and 7.

#info-box(kind: "info")[
  "Pinning" refers to the practice of specifying exact versions of software,
  base images, or dependencies to use when building a Docker container. This
  practice helps ensure that the build environment remains consistent and
  predictable over time, despite updates or changes to those dependencies.
  Pinning is crucial for maintaining consistency as it prevents the build
  environment from changing unexpectedly due to updates in dependencies. It also
  enhances reproducibility, allowing developers to recreate the same environment
  at a later date, which is vital for debugging and development. Moreover, it
  enhances reliability by reducing the likelihood of encountering unexpected
  issues or conflicts caused by differing versions of dependencies.

  For example, specifying `FROM alpine:3.19.1` in a `Dockerfile` instead of
  `FROM alpine` ensures that the Alpine 3.19.1 version is always used, providing
  stability. This mechanism applies similarly across different programming
  language ecosystems. However, it is important to note that version tags, like
  `3.19.1`, can be replaced or updated by the maintainers, potentially altering
  the contents associated with a #emph[pinned] version.

  To overcome this, the use of digests or checksums (@checksum) can anchor
  images to a specific snapshot, offering a stronger guarantee of immutability.
  For instance, specifying
  `FROM alpine@sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b`
  as shown in @ch3-dockerfile ensures that exactly the same image is used
  consistently, regardless of any updates.
]

Docker's containerization technology offers a way to create consistent software
environments across various systems by encapsulating both the software and its
dependencies within containers. This encapsulation aids in ensuring a uniform
deployment process. However, the approach's reliance on base images and the
package managers they use brings forth challenges in maintaining
reproducibility. This is primarily because base images might not be strictly
version-controlled, and the package managers used within these images can result
in the installation of varying dependency versions over time.

For example, traditional package managers like `apt` (used in Debian-based
#glspl("OS")) or `yum` (used in RedHat-based #glspl("OS")) do not
inherently guarantee the installation of the exact same version of a software
package across space and time. Typically, this variability stems from updates in
the package repositories, where an `apt-get install` command might fetch a newer
version of a library than was originally used. Such updates could potentially
introduce unexpected behaviour or incompatibilities.

Docker and similar containerization technologies act as sophisticated
assemblers, piecing together the diverse components required to create a
container. This process, while streamlined and efficient, is not immune to the
introduction of variability at any stage of the assembly line. Whether due to
updates in base images, fluctuations in package versions, or differences in
underlying infrastructure, these variables can compromise the reproducibility of
the resulting container (@def-deterministic-build). Recognising this, it becomes
crucial for developers and researchers to approach container creation with a
keen awareness of these potential pitfalls. By meticulously managing base
images, employing reliable package managers, and adhering to best practices in
`Dockerfile` construction, one can mitigate the risks of variability and move
closer to achieving true reproducibility in containerised environments.

== Evaluation 3 - Guix <ch3-tool3>

@guixwebsite is an advanced package manager, designed to provide reproducible,
user-controlled, and transparent package management. It leverages functional
programming concepts to ensure reproducibility and reliability, using the GNU
Guile #cite(<guile>, form:"normal") programming language for its core daemon,
package definitions and system configurations (@courtes2013functional).

Central to Guix's philosophy is the concept of reproducible builds and
environments. This ensures that software can be built in a deterministic manner,
enabling exact replication of software environments at any point in space and
time. Guix achieves this by capturing all dependencies, including the toolchain
and libraries, in a way that they can be precisely recreated. It supports
transactional package upgrades and rollbacks, making system modifications
risk-free by allowing users to revert to previous states easily.

Guix uses @guile, a Scheme #cite(<dybvig2009scheme>, form:"normal")
implementation, allowing for more expressive and programmable package
definitions. This choice reflects Guix’s emphasis on customization and alignment
with the @fsfwebsite project's philosophy, rejecting proprietary blobs and
aiming for complete software freedom, which may limit hardware compatibility.
Guix’s approach can pose a high entry barrier due to its use of a
general-purpose functional programming language but offers extensive flexibility
for those familiar with Lisp-like languages. That said, users are free to extend
Guix with custom packages, free or not.

#info-box(kind: "note", ref: "info-box-proprietary-software")[
  Proprietary software does not expose its source code to the public, which may
  seem counter-intuitive to the principles of reproducibility. Proprietary
  software "typically cannot be distributed, inspected, or modified by others.
  It is, thus, reliant on a single supplier and prone to proprietary
  obsolescence" #cite(<9403875>, form: "normal", supplement: [p. 3]).

  Ensuring the reproducibility of such software is challenging, as users lack
  access to the build process and the software's lifespan is often limited due
  to its proprietary nature. Pre-built binaries will work only as long as there
  are no breaking changes in dependencies like the GNU C library, making their
  reproducibility capabilities time-limited.

  Being aware of the broader implications of using proprietary software is
  crucial but does not necessarily compromise reproducibility at short term.
  However, relying on proprietary software for long-term reproducibility is
  risky due to the lack of transparency and control over the software's
  evolution.
]

Guix is committed to ensuring reproducibility and reliability, based on the
functional deployment model first introduced by @Dolstra2006. It assures
reproducible builds by treating software environments as immutable entities,
thereby minimising variability across different systems. Guix's approach to
software building and package management, grounded in the principles of
functional programming and transactional package upgrades, places a strong
emphasis on reproducibility. However, this functional paradigm
(@def-functional-package-management) introduces a learning curve and
necessitates a shift from traditional imperative package management methods.
Additionally, the adoption of Guix might be further complicated by the absence
of non-free software availability, marking a significant consideration for teams
considering Guix.

#figure(
  {
    sourcefile(
      file: "guix.scm",
      lang: "Lisp",
      read("../../lib/scenario-3/guix.scm"),
    )
  },
  caption: [From Scenario 3, the Guix build file (`guix.scm`)],
) <ch3-default-guix>

#figure(
  {
    shell(read("../../resources/sourcecode/scenario-3.log"))
  },
  supplement: "Terminal session",
  kind: "terminal",
  caption: [Building the C sourcecode from the Guix build file of Scenario 3],
) <ch3-guix-build>

#heading(outlined: false, level: 3, "Reproducibility In time")

In @ch3-guix-build, we notice on lines 5 and 11 that the output hashes are the
same. This is therefore classified as reproducible in time.

#heading(outlined: false, level: 3, "Reproducibility In Space")

Building the program in a different environment with the same architecture
(`x86_64-linux`) resulted in identical output. Compiling the source code on
another architecture (`aarch64_darwin`) also produced consistent results, though
different from those obtained on `x86_64-linux`. Therefore, we can conclude that
the program is reproducible across different environments, #emph[modulo] the
hardware architecture.

#heading(outlined: false, level: 3, "Reproducibility Of The Build Environment")

The reproducibility of the build environment is heavily controlled when using
Guix. The dependencies are locked and pinned, it is simply not possible to
create a different build environment.

== Evaluation 4 - Nix <ch3-tool4>

@nix is a revolutionary package management system that dramatically reshapes the
landscape of software construction, consumption, deployment and management. Its
distinctive methodology, grounded in the principles introduced in @Dolstra2006,
marked its inception, setting a new standard for handling software packages.
Central to Nix's core is its use of the Nix language, a domain specific
Turing-complete language that facilitates the description of software packages,
their dependencies, and the environments in which they operate.

#info-box(ref: "def-turing-complete")[
  The term "Turing-complete" is named after the British mathematician and
  logician Alan Turing, who introduced the concept of a Turing machine as a
  fundamental model of computation. A Turing-complete language is a programming
  language that can simulate a Turing machine, a theoretical device that can
  solve any computation that can be described algorithmically. Turing
  completeness is a fundamental property of any programming language that can
  perform any computation that a Turing machine can, given enough time and
  memory. This property allows a language to express any algorithm or
  computation, making it a powerful tool for software development. Examples of
  Turing-complete languages include: Python, PHP, C++ and JavaScript. On the
  other hand, non-Turing-complete languages, which are limited in their
  computational capabilities, include: SQL, Regex and HTML.
]

This language enables Nix to implement a functional deployment model, ensuring
reproducibility, reliability, and portability across different systems by
treating packages as functions of their inputs, which results in deterministic
builds.

Nix emphasises a deterministic build environment, allowing developers to specify
and isolate dependencies explicitly. This method significantly mitigates
#emph["it works on my machine"] issues by providing a high degree of control over
the build environment. Nix's strength in ensuring reproducibility comes with the
need to embrace its unique approach to system configuration and package
management, representing a paradigm shift for new users.

#info-box(kind: "conclusion")[
  Nix essentially modifies the #gls("POSIX", long: false) standard by installing
  software in unique locations rather than following the shared file structure
  described by the #gls("FHS"). This seemingly minor change brings about several
  advantageous properties, such as software composition, immutability,
  configuration rollback, caching and reproducibility.
]

Nix provides two principal methodologies that are not mutually exclusive: the
legacy method (\u{00B1}2006) and the relatively newer #emph[Flake]
(\u{00B1}2020) approaches.

=== Nix legacy method

The legacy way of using Nix involves defining a `default.nix` file that is
similar to a function definition in the Nix programming language. This file
contains a set of inputs, specifies dependencies, the build command and its
output. By default, this method does not enable pure evaluation mode, meaning
the hermeticity of the build process is not guaranteed. As a result, potential
uncontrolled side effects may occur during the build process. For instance, as
demonstrated in @ch3-default-nix at line 2, we manually enforce a very specific
version of the `pkgs` variable, a specific snapshot of the Nix package
repository that fixes the versions of all packages and libraries. Similarly to
the process outlined in @ch3-docker-build-env for Docker, this approach, known
as "dependency pinning," ensures consistency and reproducibility in the build
environment.

#figure(
  {
    set text(size: .85em)
    sourcefile(
      file: "default.nix",
      lang: "nix",
      read("../../lib/scenario-4/default.nix"),
    )
  },
  caption: [The Nix build file (`default.nix`) from Scenario 4],
) <ch3-default-nix>

#figure(
  {
    shell(read("../../resources/sourcecode/scenario-4.log"))
  },
  supplement: "Terminal session",
  kind: "terminal",
  caption: [Building the C sourcecode with Nix in Scenario 4],
) <ch3-default-nix-build>

=== Nix Flake

Nix #emph[Flake] introduces a structured approach to managing Nix projects,
focusing on reproducibility and ease of use. Currently in an experimental phase,
Flake is anticipated to transition to a stable feature soon due to increasing
community endorsement (@ch3-flake-vs-legacy) and the tangible reproducibility
advantages it offers.

#figure(
  image("../../resources/images/flake-vs-legacy.jpg"),
  caption: [On the left, new repositories containing a `flake.nix` file, and on
    the right, containing a `default.nix` file
    (#link("https://x.com/DeterminateSys/status/1794394407266910626")[Determinate System])
  ],
) <ch3-flake-vs-legacy>

Flakes aim to simplify and enhance the Nix experience by providing an immutable,
version-controlled way to manage packages, resulting in significant improvements
in reproducibility and build isolation. Flakes manage project dependencies
through a single, top-level `flake.lock` file, which is automatically generated
to precisely pin the versions of all dependencies, including transitive ones, as
specified in the `flake.nix` file. This file ensures project consistency and
reproducibility across different environments.

In addition to altering the Nix command-line syntax, Flakes enforce a specific
structure and entry point for Nix expressions, standardising project setup and
evaluation. They enable pure evaluation mode by default, which enhances the
purity and isolation of evaluations, making builds more consistent and reducing
side effects. For instance, making external requests during a build is not
possible with Flakes, ensuring that every dependency must be explicitly
declared. Flakes require changes to be tracked through `git`, enabling the exact
reversion of the project to be pinned in the `flake.lock` file.

The files `flake.nix` and `flake.lock` are complementary and central to the
locking mechanism that ensures reproducibility. Together, when committed in a
project, they guarantee that every user of a Flake, regardless of when they
build or deploy the project, will use the exact same versions of dependencies,
thereby ensuring that the project is built consistently every time. However, it
is possible to have only a `flake.nix` file without a `flake.lock` file. In
such cases, having a reproducible build environment is not guaranteed since
dependencies could drift to newer versions.

#figure(
  {
    sourcefile(
      file: "flake.nix",
      lang: "nix",
      read("../../lib/scenario-5/flake.nix"),
    )
  },
  caption: [The Nix Flake file (`flake.nix`) from Scenario 5],
) <ch3-flake-nix>

#figure(
  {
    shell(read("../../resources/sourcecode/scenario-5.log"))
  },
  supplement: "Terminal session",
  kind: "terminal",
  caption: [Building the C sourcecode with Nix flake in Scenario 5],
) <ch3-nix-flake-build>

#heading(outlined: false, level: 3, "Reproducibility In Time")

In @ch3-default-nix-build, we notice on line 5 and 11 that building twice the
sourcecode using Nix's legacy method produces the same output. In
@ch3-nix-flake-build, on line 4 and 9 we notice the same thing.
This is therefore classified as reproducible in time.

#heading(outlined: false, level: 3, "Reproducibility In Space")

Just like Guix, building the program in a different environment with the same
architecture (`x86_64-linux`) resulted in identical output. Compiling the source
code on another architecture (`aarch64_darwin`) also produced consistent
results, though different from those obtained on `x86_64-linux`. Therefore, we
can conclude that the program is reproducible across different environments,
#emph[modulo] the hardware architecture.

#heading(outlined: false, level: 3, "Reproducibility Of The Build Environment")

The reproducibility of the build environment is heavily controlled. The
dependencies are locked and pinned, it is simply not possible to
create a different build environment.

=== Dealing With Variability

This section will focus on how Nix deals with unstable outputs, highlighting how
they have abstracted this issue behind the scenes. The scenarios that will be
used are:

- Scenario 6: Building an #gls("OCI") image with Nix
- Scenario 7: Compiling a Typst document tp a PDF file
- Scenario 8: Compiling a Typst document to a PDF file with Nix, showing how Nix
  abstracts the issue of non-deterministic builds.
- Scenario 9: Compiling a Typst document with Nix, fixing the issue of
  non-deterministic builds.

#info-box[
  Typst #cite(<typst>, form: "normal") is an advanced markup-based typesetting
  language that compiles to #gls("PDF") or #gls("SVG"). It was initiated in 2019
  at the Technical University of Berlin by Laurenz Mädje and Martin Haug.
  Developed in Rust, this programmable markup language for typesetting became
  the subject of their master's theses, which they wrote in 2022. After several
  years of closed-source development, Typst was open-sourced and released to the
  public in 2023. Despite being relatively recent and lacking a stable version,
  Typst's maturity has allowed it to be used for writing this master's thesis.
]

Building #gls("OCI") images using Docker is a common use case in the software
development process. However, the output of the build can be non-deterministic
due to the nature of the build process. In scenario 6, we will build an
#gls("OCI") image using Nix only.

#figure(
  {
    sourcefile(
      file: "flake.nix",
      lang: "nix",
      read("../../lib/scenario-6/flake.nix"),
    )
  },
  caption: [
    The Nix Flake file (`flake.nix`) to build an OCI image in Scenario 6
  ],
) <ch3-flake-nix-container>

#figure(
  {
    shell(read("../../resources/sourcecode/scenario-6.log"))
  },
  supplement: "Terminal session",
  kind: "terminal",
  caption: [Building an #gls("OCI") image with Nix],
) <ch3-nix-flake-container-build>

In @ch3-nix-flake-container-build, line 5 and 11, we notice that building twice
an #gls("OCI") image using Nix produces the same output. The Flake file in
@ch3-flake-nix-container shows that it is possible to create reproducible
#gls("OCI") containers with Nix, in a simple and declarative way.

In scenario 7, we will compile a trivial Typst document.

Consider the following Typst document on the left, and it's rendering on the
right:

#grid(
  columns: 2,
  rows: 1,
  column-gutter: 1em,
  align: bottom,
  figure(
    {
      sourcefile(
        file: "hello-world.typst",
        lang: "typst",
        read("../../lib/scenario-7/src/hello-world.typst"),
      )
    },
    caption: [Typst document],
  ),
  [
    #figure(
      box(stroke: .6pt + luma(200), radius: 3pt)[
        #image("../../resources/images/hello-world.svg")
      ],
      caption: [Rendering of the Typst document],
    ) <typst-hello-world-rendered>],
)

@ch3-hello-world-typst-build-log shows that manually compiling the same document
twice yields different resulting files.

#figure(
  {
    shell(read("../../resources/sourcecode/scenario-7.log"))
  },
  supplement: "Terminal session",
  kind: "terminal",
  caption: [Manually compiling a Typst document to a #gls("PDF") document in Scenario 7],
) <ch3-hello-world-typst-build-log>

While viewing the resulting #gls("PDF") files side by side, we notice that they
appear totally identical to @typst-hello-world-rendered. However, the checksum
of those files are different. This discrepancy is common, where the same input
can produce different outputs due to non-deterministic behaviour in the build
process. Even if the resulting outputs are identical, there can be internal
differences. Therefore, given an arbitrary build output, it is impossible to
determine if a build is valid or not. It is important to acknowledge that tools
like Guix or Nix address this issue by ensuring that the build environment only
is consistent and reproducible. In @ch3-nix-typst-flake, we will show how to
compile the same Typst document using Nix and how to eventually fix the
discrepancy.

#figure(
  {
    sourcefile(
      file: "flake.nix",
      lang: "nix",
      read("../../lib/scenario-8/flake.nix"),
    )
  },
  caption: [
    The Nix `flake.nix` file to build a Typst document to a PDF in Scenario 8
  ],
) <ch3-nix-typst-flake>

Compile it twice and observe the outcome:

#figure(
  {
    shell(read("../../resources/sourcecode/scenario-8.log"))
  },
  supplement: "Terminal session",
  kind: "terminal",
  caption: [Building a Typst document in Scenario 8],
) <ch3-hello-world-typst-build>

At lines 4 and 7 of @ch3-hello-world-typst-build, we notice that compiling
twice a Typst document with Nix produces two different #gls("PDF") files, their
respective checksums are different. While the visual output appears identical,
the underlying files are not. At line 3 of @ch3-hello-world-typst-rebuild, we
leverage a command with specific flags to verify if a build output is
reproducible.

#figure(
  {
    shell(read("../../resources/sourcecode/scenario-8-rebuild.log"))
  },
  supplement: "Terminal session",
  kind: "terminal",
  caption: [Checking if a build output is reproducible],
) <ch3-hello-world-typst-rebuild>

Nix will build the document once (line 2), then a second time (line 3) and then
compare the output hashes. Thanks to the `--keep-failed` argument, we inform Nix
to keep the failed builds so we can do a more introspective analysis of the
issue and try to find the root cause of the discrepancy, for example, using
`diffoscope` #cite(<diffoscope>, form: "normal") in
@ch3-hello-world-typst-rebuild-diffoscope.

#figure(
  {
    shell(read("../../resources/sourcecode/scenario-8-diffoscope.log"))
  },
  supplement: "Terminal session",
  kind: "terminal",
  caption: [Checking discrepancies between two builds using `diffoscope`],
) <ch3-hello-world-typst-rebuild-diffoscope>

#figure(
  image("../../resources/images/diffoscope-typst.svg"),
  caption: [
    A visual comparison with `diffoscope` of two #gls("PDF") files generated
    from the same Typst document
  ],
) <ch3-nix-typst-diff>

`diffoscope` visually compares the discrepancy between the two #gls("PDF")
files. From the report in @ch3-nix-typst-diff, the highlighted difference seems
to be the creation date metadata. Doing a quick search on @typstdoc confirms
that Typst is able to change the creation date of the output file.
@ch3-nix-typst-flake-fixed implements the trivial change at line 1:

#figure(
  {
    sourcefile(
      file: "hello-world.typst",
      lang: "typst",
      read("../../lib/scenario-9/src/hello-world.typst"),
    )
  },
  caption: [On line 1, the Typst document date is now set to `none`],
) <ch3-nix-typst-flake-fixed>

#figure(
  {
    shell(read("../../resources/sourcecode/scenario-9-rebuild.log"))
  },
  supplement: "Terminal session",
  kind: "terminal",
  caption: [Checking if compiled Typst document is reproducible in Scenario 9],
) <ch3-hello-world-typst-fixed-log>

Now we notice that running the command to check if the output is reproducible
returns nothing, meaning that the output is fully reproducible.

#info-box[
  Often, raising an issue with the upstream project is the most effective method
  for informing the authors about a problem and monitoring its resolution. In
  the case of Typst, an issue
  #cite(form: "normal", <typstReproducibleBuildIssue1>) was documented to
  describe the problem, and in less than two weeks, it had been addressed and
  resolved. Consequently, the discrepancy in @ch3-hello-world-typst-build is no
  longer applicable for Typst versions newer than `0.11.0`.
]

== Conclusion

In this concluding section of the chapter, a summary of the reproducibility
assessment can be found in @ch3-table-conclusion. Following the table, this
section provides a detailed explanation of our categorization process, outlining
the specific criteria used for classifying. Each classification is justified
based on the results obtained from our comprehensive empirical evaluation
process.

#figure(
  include "../../resources/typst/ch3-table-conclusion.typ",
  caption: [Software evaluation comparison],
  kind: "table",
  supplement: [Table],
) <ch3-table-conclusion>

In evaluating the reproducibility of various tools and methodologies within, a
particular focus has been set on the bare compilation method (@ch3-tool1). This
approach, characterised by its reliance on the host operating system's installed
software for compiling source code into executable programs, presents a nuanced
challenge to reproducibility. Theoretically, bare compilation allows for a
straightforward reproduction of computational results, assuming a static and
uniform environment across different computational setups. However, the
practical application of this method exposes inherent vulnerabilities to
environmental variability. The reliance on the host's installed software means
that the exact version of compilers, libraries, and other dependencies can
significantly impact the outcome of the compilation process. These elements are
seldom identical across different systems or even over time on the same system,
given updates and changes to the software environment. Consequently, the
reproducibility promised by Bare compilation is compromised by these external
variables, which are often not documented with sufficient rigor or are outside
the user's control. Acknowledging these challenges, we categorise the bare
compilation (@ch3-tool1) as non-reproducible by default, reflecting a practical
assessment rather than a theoretical limitation. The classification underscores
the significant effort required to document and manage the dependencies on the
host's software to achieve a reproducible build process. This perspective is
supported by the literature #cite(<Schwab2000>, form: "normal"), which advocates
for standardising and simplifying the management of computational research
artefacts. The classification of the method 1 (@ch3-tool1) as *non-reproducible*
is a pragmatic acknowledgment of the difficulties presented by the dependency on
the computational environment.

Docker and similar containerization technologies (@ch3-tool2) can facilitate
reproducible environments. The reason is that while they provide a high degree
of isolation from the host system, they are still subject to variability due to
the base images and package managers used within the containers. This
variability, however, can be effectively managed with low effort. By
meticulously selecting and managing base images and dependencies, it is indeed
feasible to elevate Docker from partially to fully reproducible. For these
reasons, they are categorised as *partially reproducible*.

Nix (@ch3-tool3) and Guix (@ch3-tool4) provide a high level of control over
the build environment and dependencies, facilitating deterministic and
reproducible builds across different systems. By capturing all dependencies and
environment specifics in a declarative manner, Nix and Guix offer a reliable and
transparent approach to software development. The functional deployment model
implemented by Guix, Nix and their forks (like @lix), along with their
transactional package upgrades and rollbacks, further enhances reproducibility
by enabling exact replication of software environments within the same
architecture at any point in space and time.Under the hood, they introduces a
novel approach to addressing the challenges of reproducibility. By using a very
specific storage model, they ensures that the resulting output directory is
determined by the hash of all inputs. This model, while not guaranteeing bitwise
identical binaries across all scenarios, especially across different hardware
architectures, ensures that the process and environment for building the
software are reproducible. Nix and Guix's model represents a significant step
forward in mitigating reproducibility challenges within #gls("SE"). By ensuring
that every build can be traced back to its exact dependencies and build
environment, it enhances the reliability of software deployments. This approach
is particularly beneficial in #gls("CICD") pipelines, where consistency and
reliability are paramount. Achieving reproducibility in #gls("SE") is filled
with challenges, from architecture dependencies to non-determinism in compilers.
These solutions offers a compelling solution by ensuring reproducible build
environments. The exploration of the concepts used in Guix and Nix, and its
methodologies provides valuable insights into the complexities of software
reproducibility and the necessity for continued research and development in this
field. They both are categorised as *reproducible*.

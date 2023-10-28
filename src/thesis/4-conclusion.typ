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

#chapterquote(
  title: "Conclusion",
  ref: "chapter4",
  quoteAttribution: <peng2011>,
  quoteText: [
    Reproducibility has the potential to serve as a minimum standard for judging
    scientific claims when full independent replication of a study is not
    possible
  ],
)

== Summary

This thesis embarked on an in-depth exploration of reproducibility in
#gls("SE"), motivated by the growing necessity for reliable and repeatable
results in research and software development. In this chapter, we summarise our
findings and discuss the implications of our research. We also suggest future
work that could be done to improve reproducibility.

In the introductory @chapter1, I provided an overview of my personal journey and
the experiences that have led me to pursue this specific area within #gls("SE").
This chapter offered readers contextual information about my background,
especially highlighting my active involvement in open-source communities and my
dedicated advocacy for the adoption of reproducibility tools and practices. I
delved into my motivations for choosing this topic, underscoring the critical
importance of reproducibility in #gls("SE"). The relevance of establishing
reliable and repeatable processes to enhance the integrity of software products
and to foster a culture of transparency and collaboration. To guide the reader
through the thesis, I recall the goals and a structured overview of the
document, chapter by chapter.

In @chapter2, the theoretical foundations of reproducibility were explored,
tracing its origins from classical scientific disciplines where it has long been
a cornerstone for validating experimental findings and theories. The chapter
began with a historical overview, highlighting how reproducibility emerged as a
fundamental principle in the natural sciences and the shifts it has undergone
with the advent of the digital era. Following this introduction, a comprehensive
set of concepts central to understanding reproducibility in #gls("SE") was
presented. Formal definitions for key terms were introduced, establishing a
rigorous and foundational basis for subsequent developments. The narrative then
extended into the realms of open source and software security, pivotal areas
where reproducibility intersects with broader concerns. Open source software,
with its ethos of transparency and collaboration, enhances reproducibility by
making the source code readily available. This transparency facilitates the
verification of software builds and improves security. With the source code
accessible and inputs correctly declared, it allows for immediate identification
of dependencies and quicker identification of vulnerabilities. The focus shifted
to the specific challenges that software engineers and researchers face in
achieving reproducible builds. This discussion delved into obstacles such as
non-deterministic build processes, variability of environments, and the lack of,
to some extent, standard practices for documenting and sharing the necessary
details to replicate software builds. By examining these challenges, the
groundwork was laid for identifying effective strategies to address them.
Lastly, it introduced third-party tools designed to compare build outputs.

In @chapter3, I systematically explored and assessed different tools and
strategies used to build software with an emphasis on their potential to
facilitate reproducible results. The chapter presented a comprehensive analysis
of four distinct strategies: Bare compilation, Docker, Guix, and Nix. Each
strategy was evaluated through multiple objective criteria. This approach allows
for a balanced assessment of each method, providing insights into how well they
help in achieving reproducible builds. For Bare compilation, the focus was on
the traditional approach of building software directly on the system without
containerization or virtual environments, highlighting its limitations and
potential issues in reproducibility. Next, Docker was evaluated as a popular
containerization technology that encapsulates the software environment, aiming
to enhance reproducibility by isolating dependencies. Following Docker, I
examined Guix and Nix, two functional package managers that offer more granular
control over environment configurations. The chapter concluded with a
comparative analysis that ranked these strategies according to their
reproducibility potential. This evaluation serves as a resource for developers
making decisions about which tools and strategies to implement in their projects
to enhance reproducibility.

In the remaining sections of this conclusion chapter, we will summarise the key
findings and the broader implications of my research. Additionally, I will
expand the discussion by exploring other facets of reproducibility. Finally, I
propose future research directions aimed at enhancing reproducibility.

== Evaluation Of Tools

@chapter3 was dedicated to evaluating different tools and strategies for
building software with an emphasis on their potential to facilitate reproducible
results.

Bare compilation is the traditional approach to building software directly on
the system without containerization or virtual environments. This method offers
minimal isolation and control over the build environment, making it challenging
to achieve reproducibility. However, it is still widely used in practice due to
its simplicity and familiarity, usually with the underlying operating system
ecosystem. Debian based Linux distributions are a common choice for this method
due to their extensive package repositories and long-term support, therefore,
the usage of the package manager `apt` became a standard practice for installing
dependencies when one is missing. This imperative method for installing missing
dependencies can lead to non-reproducible builds due to the lack of version
pinning. The `apt` package manager does not provide snapshots where all the
dependencies are frozen at a given state, which makes it challenging to
reproduce the exact build environment. However, it has the advantage of being
popular and widely supported.

Using Docker for building software is a popular choice due to its increasing
popularity and the ease of creating shareable containers through Docker Hub
#cite(<dockerhub>, form: "normal"). However, sharing a container as a single
#gls("OCI") file requires a bit more work and is not as straightforward as
sharing a Docker image on their dedicated platform Docker Hub. In a way, thanks
to Docker, users have been introduced to the concept of containerization,
immutability, and to some extent, reproducibility.

While discussing Docker with people, I noticed a common misconception about
reproducibility that is worth noting. To illustrate this, let's consider a
project shipping builds of their open-source software through Docker images. At
each release, they publish a new version of their image. These Docker images are
immutable, and users can use and reuse them at will. However, it is simply
impossible to reproduce those images themselves from the sources. While this
illustrates the Docker leitmotif #emph["build once, use everywhere"], it does
not demonstrate true reproducibility. The essence of reproducibility lies in our
ability to recreate identical copies of these images from the sources on any
machine. If something can be reproduced multiple times but yields different
results each time, it is not truly reproducible. Similarly, if something is
produced only once and is not meant to be reproduced, it is, to some extent,
also not reproducible.

#info-box[
  In #emph[declarative configuration management]
  #cite(<HunterGCP>,form:"normal"), tools such as Docker, Kubernetes
  #cite(<kubernetes>,form: "normal"), and Terraform
  #cite(<terraform>,form: "normal") are used to specify the desired end state
  of the system rather than the steps to achieve it. For example, a `Dockerfile`
  describes the final environment for a container, ensuring that the system
  matches predefined specifications. This method aligns with the #emph[congruent
  system management] #cite(<Traugott2002>,form:"normal") approach, focusing on
  consistency and predictability. Declarative configurations ensure idempotence,
  meaning the same configuration can be applied multiple times without altering
  the system beyond its intended state. This abstraction makes it easier to
  understand and maintain, as the system determines the necessary actions to
  achieve the desired state.

  In contrast, #emph[imperative configuration management]
  #cite(<HunterGCP>,form:"normal")involves detailing the exact steps required to
  transition a system from its current state to a desired state, providing
  granular control over the configuration process. Tools such as Ansible
  #cite(<ansible>, form: "normal"), Chef #cite(<chef>, form: "normal"), Puppet
  #cite(<puppet>, form: "normal"), and Bash scripts exemplify this approach.
  This method aligns with the #emph[convergent system management]
  #cite(<Traugott2002>,form:"normal") approach, focusing on achieving a goal
  through a series of specific actions. While imperative configurations allow
  for complex logic and conditional operations, they can be challenging to
  maintain due to their non-idempotent nature, meaning the same script can
  produce different results depending on the system's initial state. This
  approach requires meticulous management to ensure consistency and
  repeatability, offering detailed control at the expense of simplicity and
  predictability.

  The expressiveness of imperative tools comes at a significant cost. These
  tools allow developers to make stronger assumptions about the current state of
  the system. This creates a strong likelihood of like environments diverging
  over time in a process known as #emph[configuration drift]. The declarative
  approach to configuration management reduces the possibility of configuration
  drift by favoring idempotence, explicit dependency graphs, and maintaining a
  strong awareness of the current state of the environment
  #cite(<HunterGCP>,form:"normal", supplement: [p.348]).
]

During the evaluation, I found Docker to be very easy to use. By using a simple
declarative syntax to define the build steps, the `Dockerfile` is one step
forward into making configurations more explicit and this has contributed a lot
to the success of the Docker ecosystem. On a less positive note, using Docker on
other platforms than Linux can be challenging and a deal breaker for some users.
On non-Linux systems, Docker relies on a virtual machine to create a Linux
environment, which can lead to performance overheads and latency issues. The
differences in filesystems between Linux and non-Linux platforms can also result
in inconsistencies and unexpected behaviour in container operations.
Additionally, networking configurations and capabilities can vary significantly,
causing more complex setups and potential connectivity issues. Resource
allocation and management can be less efficient on non-Linux platforms due to
the intermediary VM layer. On Linux based architectures, the performance are not
as good as running the software natively, but it is still acceptable for most
use cases. However, while initiatives such as DevContainer
#cite(<devcontainer>, form: "normal") are trying to provide a more integrated
experience with Visual Studio Code #cite(<vscode>, form: "normal"), working with
and inside a container adds an extra layer of complexity that can be challenging
to manage, especially when dealing with networking, storage and security.

Guix has been an interesting tool to evaluate. While the learning curve is
steeper than Docker, the benefits are significant. I appreciated the strict and
declarative approach to package management, which aligns well with the
reproducibility goals. The idea of using an existing general purpose language
for declaring packages and configurations is a powerful idea. The community is
small but active, however since no proprietary tools are packaged, it can be a
challenge for users to find the software they need. There are workarounds
existing but it is not advertised by the Guix community which tend to focus and
adhere to the free software philosophy #cite(<fsfwebsite>, form: "normal"). The
performance of Guix is great, since no containerization is involved, the
software runs natively on the system and accessing storage and network is a
breeze. Guix extensively uses `git` #cite(<git>, form: "normal") for fetching
packages and configurations, and the information displayed to the user while
running it is very clean and clear.

Nix has been the most interesting approaches to evaluate, technically but also
politically. The learning curve is steep, but the benefits are significant.
The Nix language while being Turing-complete (@def-turing-complete) has a very
specific and limited #gls("DSL"), it is remarkably clean and powerful, making it
highly suitable for managing package builds and configurations. Additionally,
the simplicity of the Nix language enhances its efficiency and usability,
positioning it, in my own opinion, as one of the best languages for this task.

During the making of this thesis, I contributed to Nix and I really appreciated
how easy it is to contribute but also the transparency of the process when it
comes to making a change. The Nix community is very large, active and welcoming,
and the Nix package repository `nixpkgs` is one of the most active repository
on Github #cite(<octoverse2022>, form: "normal"). Nix has completely changed the
way I think about software management, how I consume software and how I ship
software. I wish I had discovered it earlier.

While Nix offers many advantages, it also has some drawbacks, primarily
concerning its installer. The Nix installer is a shell script that downloads and
installs Nix on the system. However, there are alternative installers available.
During my evaluation, I explored these different installers and ultimately chose
one developed by a United States-based company founded by Eelco Dolstra, the
creator of Nix. Given this connection, I felt confident using their installer.
Nevertheless, I found it peculiar to maintain multiple installers for the same
software, which I suspect might be a source of confusion for many users, both
new and experienced. Could this indicate a deeper governance problem?

Another drawback of Nix is the documentation. While the Nix manual is extensive
and well-written, it can be overwhelming for new users. The manual is
comprehensive but it lacks a clear and concise structure, examples and a lot of
topics are not covered. A lot of energy, initiative and effort are being made
and things are slowly moving in the right direction.

While working with Nix the first time, I got introduced to the concept of Nix
channels. Nix channels is a mechanism used to distribute and update collections
of Nix expressions. These channels provide users with a way to receive updates
for Nix packages and configurations. While Nix extensively uses `git`, the
unique concept of channels adds an extra cognitive load for users who want to
simply upgrade their machines. I preferred the simplicity Guix offers by just
using `git` to update the system. When using Flakes, the concept of Nix channels
is no longer needed.

Flakes is an experimental feature as of writing. Released in November 2021 with
Nix 2.4 #cite(<nix24release>, form: "normal"), Flakes is powerful yet
controversial. For example, some companies, including one founded by the creator
of Nix, are advocating for the adoption of Flakes, while the Nix community
awaits its stabilization. Although these differences do not affect Nix's
functionality in the short term, they can be confusing for new users and may
lead to fragmentation within the community. One might ask why such companies are
not contributing to the same codebase as the rest of the community, a situation
that has already led to some division.

#info-box(kind: "important")[
  There are currently around 230 committers spread across the globe taking care
  of the Nix package repository on Github
  #cite(<NixpkgsCommitters>,form:"normal"). On June 1st 2023, I've been granted
  the status of project committer #cite(<DrupolNixCommitter>,form:"normal").
  This status allows me to merge commits, review code, and contribute to the Nix
  ecosystem in a more direct way. However, I want to clarify that the
  conclusions of this thesis were not influenced by my role in the Nix project.
  I have worked to maintain the highest level of objectivity in this document,
  with only reproducibility as the primary focus.
]

At the time of writing, the Nix community was facing a significant crisis,
leading to the creation of two new forks of Nix, @lix and @aux. This
fragmentation is a major concern for the project's future. While a new
governance structure is being established, the community remains divided over
different installers, the experimental Flake feature, the sponsorships policy
and now forks. Although the current situation is not ideal, I am confident that
the community will overcome this crisis and continue to provide an excellent
tool for the #gls("SE") community. The controversial Flake feature has attracted
many new users to the Nix ecosystem, and the community is growing rapidly. These
issues are likely a result of this rapid growth and the initial lack of clear
and transparent governance, a problem that needs to be resolved.

To conclude, it is essential to recognise that Nix is the result of extensive
research and development, used in production by numerous companies and
individuals. The Nix community is dynamic and vibrant, promising a bright future
for the project. The core value of Nix lies in its package repository,
`nixpkgs`, which hosts thousands of packages readily accessible to any Nix user.
Regardless of which Nix variant or fork one chooses, the true asset remains that
package recipe repository, likely to be shared across different forks, ensuring
consistency and reliability in package management.

#info-box(kind: "conclusion")[
  I have concluded that the ideas implemented by Nix stand out as the optimal
  choice. With two decades of maturity and robustness, the Nix ecosystem is, in
  my view, currently the best concept for implementing reproducibility in
  #gls("SE"). I am convinced that Nix, or a similar technology that embraces the
  same principles (e.g., @guixwebsite, @lix, @aux), has the potential to
  revolutionise the way software is built, used, audited, deployed and shared.
]

#pagebreak(weak: true)

== Research Findings

During this research, I have discovered in @chapter3 that the reproducibility of
software builds is a multifaceted challenge that requires a combination of
skills, tools and strategies to address it effectively. In this section, I
present a summary of the key findings and some other facets of reproducibility
that I briefly explored, but could be expanded in future research.

=== At A Glance

Reproducibility in #gls("SE") refers to the ability to consistently recreate the
same software product, with identical functionality, using the same methods and
data across different environments and over time. This involves
ensuring that the software build process, dependencies, and computational
environments are well-documented and standardised.

#figure(
  include "../../resources/typst/ch4-table-conclusion.typ",
  caption: [Pros and cons of reproducibility],
  kind: "table",
  supplement: [Table],
) <ch4-table-conclusion>

=== Limitations

Each of the tools evaluated in @chapter3 offers unique advantages and features,
yet they also possess limitations that can impact their effectiveness in
achieving reproducibility. Below are some key points noted during the
evaluation.

==== Cross Architecture Reproducibility

Achieving software build reproducibility across different operating systems and
architectures is not feasible for certain types of build outputs, typically
binaries (@ch2-r13y-utopia). Binary build outputs depend on the #gls("CPU")
architecture (e.g., `x86`, `ARM`) because converting source code into machine
code uses a set of #gls("CPU") instructions directly inherited from the
#gls("CPU") architecture. Therefore, obtaining binaries that are identical
across every architecture is unlikely to occur. This inherent dependency means
that the binaries produced on different architectures will have variations,
making exact cross hardware architecture reproducibility unattainable.

==== Unavailability Of Upstream Packages

To illustrate this limitation, I will use the example of a software package that
has been removed from the upstream repository and is no longer available for
download. In this scenario, the software package cannot be built, as the source
code is no longer accessible. Furthermore, any other packages that depend on
this now-unavailable package also become impossible to build. This limitation
highlights the importance of maintaining a robust and reliable infrastructure
for software repositories to ensure the longevity of software packages and
facilitate reproducibility. In the absence of such infrastructure,
reproducibility becomes increasingly challenging, as software packages may
become obsolete or unavailable over time.

To circumvent this limitation, researchers and developers can adopt proactive
measures to ensure the reproducibility of their software builds. One approach is
to archive the source code and dependencies of the software package, preserving
them in a secure and accessible repository. This is what projects like Software
Heritage #cite(<swh>, form: "normal") is trying to achieve. By archiving the
source code and dependencies, researchers and developers can safeguard against
the loss of critical software components and maintain the reproducibility of
their builds over time. Additionally, implementing a caching layer to store
build outputs can significantly enhance reproducibility. This allows users to
retrieve precompiled build outputs, thereby avoiding the need to compile the
source code on their machines if the corresponding cached build exists.
Nix facilitates the creation of such cached build layers due to its principles
(@def-functional-package-management), as it produces immutable directories based
on sources. This means that modifying existing cached builds is not possible,
mitigating potential security issues related to accidental modifications. It's
worth noting that this level of immutability and reproducibility is not the case
with all package managers.

==== Standardisation

Another limitation is the lack of standard practices for documenting and sharing
the necessary details to replicate software builds. This limitation underscores
the need for clear and comprehensive documentation to facilitate
reproducibility. An exemplary initiative addressing this challenge is the
#gls("PURL") project, which seeks to standardise the identification and location
of software packages across various ecosystems and tools. The #gls("PURL")
specification #cite(<purl>, form: "normal") provides a universal syntax to
reliably reference software packages, thereby mitigating the inconsistencies
that arise from diverse package management conventions. By establishing a common
framework, #gls("PURL") enhances the interoperability and reproducibility of
software builds across different platforms and tools, illustrating the critical
role of standardisation in reproducible research and development. In addition to
#gls("PURL"), the #gls("SWHID") is another significant development aimed at
improving standardisation. The #gls("SWHID") provides a unique, persistent
identifier for software source code, facilitating the precise identification and
retrieval of specific software versions from the @SWHArchive.

To illustrate this, the 11 June 2024, GitHub announced
#cite(<githubSBOMPURL>,form:"normal"), that generated #gls("SBOM") files will
now include a #gls("PURL"). By including the #gls("PURL"), GitHub improves the completeness of the #gls("SBOM") data, helping users in more clearly identifying
the packages in their repositories. This new Github feature exemplifies the
practical benefits of adopting a standardised specification, as it addresses a
critical need in reproducibility by providing the precise identification of
software components used in a build, thereby improving transparency and
reproducibility in software development through the inclusion of #glspl("PURL")
in GitHub's #glspl("SBOM").

== Future Work

The exploration of reproducibility in #gls("SE") is an ongoing endeavour. As
technology advances and new tools emerge, the landscape of reproducibility
continually evolves.

A foundational step towards enhancing reproducibility in #gls("SE"), and by
extension, in the broader realm of science, is to raise awareness of its
importance from the outset. This can be achieved through educational
initiatives, workshops, and seminars that highlight the benefits of
reproducibility and provide researchers with the necessary tools and resources.
Embedding reproducible practices into the research culture from the beginning
will help establish these practices as standard requirements rather than
optional enhancements​​​​.

On the technical side, the frameworks and tools evaluated in this thesis provide
a robust foundation for reproducible software builds. However, significant scope
for improvement remains. Currently, various Linux distributions continue to
develop their own package managers, resulting in redundant efforts and
inefficient use of resources. While this idea seems utopic, adopting Nix as a
#emph[universal package manager] could be a potential solution. Nix abstracts
away the underlying system, making it an ideal candidate for standardizing
software deployment across different Linux distributions. By providing a
consistent environment, Nix could streamline the deployment process, reduce
inconsistencies, enhance reproducibility across diverse systems, and improve
security. With a universal package manager, security vulnerabilities could be
addressed more efficiently, as fixes could be deployed across all systems
simultaneously. However, implementing Nix universally presents several
challenges, such as ensuring compatibility with all distributions, overcoming
resistance from communities accustomed to their current systems, and managing
the scalability and maintenance of such an initiative. To address these
challenges, a phased approach could be adopted, starting with specific use cases
or distributions where Nix has demonstrated clear benefits. Additionally,
collaborative efforts and open dialogue among stakeholders could facilitate a
smoother transition. Furthermore, adopting Nix could significantly reduce our
carbon footprint by eliminating the need to store prebuild binaries for
different distributions. Instead, binaries would be prebuilt once, then stored
and made available on a #gls("CDN") for all the Linux distributions, thus
streamlining the deployment process and contributing to environmental
sustainability.

#info-box[
  The complexity of reproducibility is comparable to that of replicating a
  painting. While explaining this thesis to a painter, I used the example of
  creating an indistinguishable copy of another painting. The painter explained
  that the likelihood of achieving such perfect replication is comparable to the
  chance of a monkey writing Shakespeare's work due to the numerous variables
  involved, such as the type of paint, the brush, the canvas, the lighting, the
  environment, the painter's mood, and the time of day. This carefully chosen
  analogy underscores the multifaceted nature of reproducibility in #gls("SE"),
  where numerous variables and intricate interplay influence the final outcome​​.
]

The challenges in achieving reproducibility in artistic works highlight the
complexity and necessity of considering various factors. This broader context
emphasises that reproducibility is not limited to #gls("SE") but is a universal
issue that requires ongoing attention and innovation. Across different fields
such as the arts, social sciences, and natural sciences, achieving
reproducibility involves addressing a wide array of considerations.
Specifically, these considerations include ethical, economic, philosophical and
educational aspects.

=== Flaky tests

Flaky tests are tests that exhibit inconsistent outcomes without changes to the
code being tested. This means that they can fail or pass sporadically, leading
to uncertainty and mistrust in the test outcomes. These unreliable tests are not
only problematic for developers but also hinder the effectiveness of valuable
techniques in software testing research. Essentially, flaky tests pose a threat
to the validity of methodologies that rely on the assumption that a test's
outcome is solely determined by the source code it evaluates. From a recent
paper #cite(<SurveyFlakyTests>,form:"normal"), a survey of software developers
found that 59% claimed to deal with flaky tests on a monthly, weekly, or daily
basis.

Reproducibility is directly linked to the issue of flaky tests because their
inconsistency directly impacts the ability to reproduce results reliably. For
effective reproducibility in scientific software and other domains, it is
crucial that tests yield consistent and predictable results. Unstable tests
hinder the verification process, making it difficult to assert whether observed
issues are due to actual code defects or just the flakiness of the tests
themselves. This discrepancy affects validation, verification, and the
confidence in computational results.

Future work on this issue should focus on developing techniques to identify and
mitigate flaky tests, ensuring that test outcomes are consistent and reliable.
Research could explore advanced methods for detecting flakiness, such as machine
learning algorithms that analyze test behavior patterns. Additionally, creating
tools to automatically stabilize flaky tests and integrating these solutions
into continuous integration pipelines would significantly enhance the
reliability and trustworthiness of software testing processes.

=== Formal Concepts

There is potential for further describing and refining the formal definitions
related to reproducibility introduced mostly in @chapter2. While this thesis has
introduced formal definitions of key terms related to reproducibility, these
definitions can be expanded, refined and improved.

Having a set of formal definitions related to reproducibility is important
because they provide clarity and consistency in terminology, helping researchers
communicate more effectively. Standardised definitions allow for consistent
evaluation criteria, making it easier to compare results across different
studies and ensuring reliable assessments. This standardisation also supports
the development of tools and methodologies for verifying reproducibility, making
the evaluation process more rigorous.

Moreover, formal definitions play an educational role by instilling a culture of
reproducibility among new researchers and students. They guide policy-making and
governance in research institutions, promoting best practices. Ultimately, these
definitions ensure the reliability and integrity of scientific findings.
Enhancing these formal definitions will further strengthen the quality and
credibility of research.

=== Ethical Considerations

Reproducibility is fundamentally intertwined with ethical practices in research,
as it bolsters the scientific process by enforcing transparency among
researchers. The commitment to making research reproducible serves the
scientific community and fosters public trust in scientific outcomes,
demonstrating a respect for the integrity of science and its impact on society.

Ethically, researchers are obliged to report their findings and also provide
comprehensive details of their methodologies. This level of accountability
allows their research to be rigorously scrutinised, validated, or refuted by
peers, thus enhancing the quality and credibility of the scientific knowledge
produced. It is essential for maintaining public trust in scientific
research. When results are not reproducible, it undermines the reliability of
scientific discourse and can lead to scepticism towards scientific claims. This
is particularly critical when scientific research informs policy decisions in
crucial areas such as public health and environmental conservation, where
non-reproducible research could lead to misguided policies with far-reaching
consequences. As we've seen through this document, the open sharing of data and
methods is a cornerstone of reproducible research. It democratises access to
scientific knowledge, enabling a diverse range of researchers to participate in
and contribute to scientific discovery, regardless of their geographical,
political or institutional affiliations. Reproducibility acts as a bulwark
against fraud and bias. It ensures that research content, findings, discoveries
are genuine and not the result of manipulated data, thus promoting fair
distribution of resources and recognition within the scientific community.

=== Philosophical Considerations

According to @kpopper1934, a cornerstone of scientific inquiry is that a theory
must be falsifiable; that is, it can be disproven through empirical evidence.
While evidence alone cannot conclusively verify a hypothesis, it can refute one.
Reproducibility is essential in this context as it allows hypotheses to be
rigorously tested and either validated or refuted, thus contributing to the
evolution of scientific truth.

Scientific knowledge is not static but accumulates iteratively. Reproducibility
fortifies this process by ensuring that each new discovery builds upon a
foundation of previously verified results. This methodological consistency is
crucial for the progressive nature of scientific understanding.

Reproducibility also underpins the pursuit of objective knowledge. It helps
distinguish robust scientific results from those that are anomalies or artefacts
of experimental error, refining our collective understanding of natural
phenomena. The establishment of scientific consensus relies heavily on
reproducible results. This reproducibility facilitates agreement among
scientists on what constitutes established facts, thus propelling scientific
progress and fostering collaboration across various disciplines.

Moreover, reproducibility enhances the scientific enterprise by encouraging the
open sharing of data and methods. This openness not only fosters collaboration
but also transforms research into a collective endeavour rather than a series of
isolated efforts. It cultivates a scientific culture where data transparency and
methodological openness are normative, promoting an inclusive environment that
respects and builds upon the work of fellow researchers. By facilitating the
verification of results, reproducibility pays homage to the foundational work of
previous researchers and ensures that their contributions to knowledge are
respected and built upon. It reinforces the integrity of scientific practice and
propels the pursuit of further inquiry.

=== Economical Considerations

Reproducibility intersects with economic efficiency. Efficient reproducibility
can accelerate scientific progress by enabling quicker validation of results and
facilitating broader dissemination of knowledge. Economies of scale can be
applied where repetitive reproductions are feasible, thus reducing the unit cost
of research and making large-scale studies more financially sustainable.

The economic impact of reproducibility also extends to its utility in
policymaking and industrial applications. Reproducible research ensures that
policies and commercial ventures based on scientific findings are underpinned by
robust and reliable evidence, thus minimising risks and maximising efficacy.
This not only bolsters public and investor confidence but also enhances the
economic utility of scientific research.

To some extent, reproducibility is closely linked to the economy of scarcity,
where the rarity of an object or finding directly impacts its reproducibility
and associated costs. Rare phenomena or data require more specialised resources
for reproduction, which are often costly and less accessible. This scarcity
increases the economic investment required to replicate a study, from securing
rare materials to accessing specialised equipment.

Conversely, phenomena that are not rare can be reproduced with greater ease and
at a lower cost. The abundance of necessary resources and established
methodologies makes such reproduction economically viable and less
resource-intensive. This disparity highlights a fundamental economic principle
within scientific research: the cost and feasibility of reproducibility often
depend on the availability and accessibility of resources.

To illustrate this, consider the manual replication of a painting, where the
scarcity of the original artist’s brushstrokes and techniques makes it
challenging to reproduce the artwork with the same precision and quality. It
would take a significant investment of time, effort, and resources to manually
replicate the painting accurately. Choosing the proper materials, mastering the
techniques, and recreating the environment and artist’s vision are all essential
factors that contribute to the cost and feasibility of reproducing the painting.
In contrast, a mass-produced item, such as a digital photograph, can be
replicated with relative ease and at a lower cost.

In summary, the economic implications of reproducibility encompass a range of
considerations from the broader economic impacts on efficiency, credibility, and
practical application to the costs of rare resources.

=== Educational Considerations

Educating students in best practices is crucial for fostering a culture of
reproducibility. We can draw a compelling parallel with mathematics, where
reproducibility is inherently embedded. Just as mathematical proofs and
solutions can be independently verified by anyone following the same steps and
logic, reproducibility in #gls("SE") aims for the same level of
transparency and verifiability. This bridge underscores that reproducibility is
a desirable trait and a foundational principle that should be rigorously applied
in computational research. For example, a professor might provide students with
the necessary data, software, and materials for a specific course through fully
reproducible methods and tools. This could involve using open-source software,
version control systems, and detailed documentation to ensure that students can
reproduce the outcome in any space and any time.

Incorporating ethics education into research training programmes helps instil
the importance of reproducibility and integrity in scientific research,
emphasising the ethical responsibility researchers have towards producing
verifiable and reliable results. Organising workshops and seminars focused on
reproducibility can help disseminate best practices and foster a community
dedicated to high standards in research. These events serve as platforms for
discussion, collaboration, and the sharing of new tools and techniques.

Furthermore, experienced researchers mentoring early-career scientists can pass
on valuable knowledge and emphasise the importance of reproducibility in their
work. Mentorship provides hands-on guidance and support, helping to build a
strong foundation for the next generation of scientists. By addressing these
educational and training considerations, we can cultivate a research environment
that values and prioritises reproducibility.

Reproducibility is closely linked to fact-checking, as both processes involve
verifying the accuracy and reliability of research findings. Emphasising
reproducibility can significantly enhance the quality of fact-checking by
providing clear, transparent methodologies and robust data that others can
independently verify. This rigorous approach ensures the credibility of
scientific research and fosters critical thinking skills. By engaging in
reproducible research practices, individuals develop a keen critical thinking,
which is essential for evaluating information, identifying biases, and making
informed decisions. Teaching the principles of reproducibility and fact-checking
from an early age is crucial. Incorporating these concepts into school curricula
helps students develop critical thinking skills early on, empowering them to
question assumptions, evaluate evidence, understand the scientific process and
verify by themselves. Educating students about the importance of transparency,
data integrity, and methodological rigour lays the foundation for a more
scientifically literate and critically minded society. By fostering these skills
from the beginning of their education, we can equip future generations with the
tools they need to navigate the complex and information-rich world.

#leftblank(weak: false)

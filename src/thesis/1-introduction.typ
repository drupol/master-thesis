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
  title: "Introduction",
  ref: "chapter1",
  quoteAttribution: <Bacon1928>,
  quoteText: [
    Sine experientia nihil sufficienter sciri potest
  ],
)

== History

@Bacon1928, an English philosopher and scientist, articulated in 1267 the
foundations of what we today recognise as "reproducibility". He famously stated
in Latin #quote("Sine experientia nihil sufficienter sciri potest") which means
#quote("Without experience nothing can be sufficiently known")
#cite(form: "normal", supplement: [p.583], <Bacon1928>). He was among the first
to underscore the significance of repeated experimentation as a means to test
and ultimately confirm scientific findings. Although the specific term
"reproducibility" was not used in his time, his emphasis on empirical evidence
is seen as a precursor to our modern understanding of reproducible research in
the scientific method.

Centuries later, @kpopper1934, an Austrian-British philosopher wrote a book on
the importance of falsifiability in the scientific method. He argued that a
scientific theory must be falsifiable in order to be considered valid. He also
introduced the concept of #emph[falsificationism], which states that a theory
can only be considered scientific if it is possible to conceive of an
observation or an argument which proves the theory false. This principle is now
widely accepted as a fundamental tenet of the scientific method.

@Thompson84 delivered a lecture "Reflections on Trusting Trust" at the
Association for Computing Machinery (ACM) Turing Award Banquet. Since his talk,
the landscape of software has undergone a radical metamorphosis. The simplicity
of his advice to #emph[trust people] has become significantly more complex
in the current era. The modern software supply chain is extensive, often
encompassing dependencies that lies beneath the surface. Despite the prevalence
of open-source software within this supply chain, it is uncommon for end-users
to compile their own software. As a result, the build systems became a prime
vector for malicious exploitation
#cite(<MarcelFourne2023>, form: "normal", supplement: [p.1]). This underscores
the vital importance of software reproducibility which ensures that software can
be reliably built and verified from its source across different environments and
over time, mitigating the risks associated with trust and the potential for
exploitation within the software supply chain.

@Claerbout1992 wrote about the challenges and implications of reproducibility in
the paper titled "Electronic documents give reproducible research a new
meaning". This work was in the field of geophysics, but it has been influential
across multiple domains of #gls("CS"). It was one of the early works to
emphasise that the sharing of software and environments is critical to the
reproducibility of computational results.

@Collberg2012 has underscored the importance of reproducibility in #gls("SE") by
advocating for and funding initiatives that enhance both repeatability and
reproducibility. They promote the adoption of standardised practices and
transparency in research, which are crucial for ensuring that experiments are
repeatable, a foundational aspect of reproducibility. By encouraging
comprehensive documentation and public sharing of methodologies, data, and code,
they facilitate the replication of work by others, thus enhancing the overall
reliability and verification of scientific findings. Their financial support
extends to tools and infrastructure that assist in establishing repeatability,
which is paramount to achieving reproducibility in broader research. Recognising
and rewarding efforts to share research artefacts further embeds a culture where
both repeatability and reproducibility are fundamental practices in #gls("SE"),
ensuring that studies can not only be repeated under the same conditions but
also reproduced and validated in different contexts.

In 2020, the United States sustained a sophisticated cyberattack known as
SolarWinds. This meticulously orchestrated campaign apparently attributed to
Russia persisted undetected for several months and was enabled through a
backdoor embedded within one of the dependencies of the SolarWinds Orion
(@solarwinds-9579611) software, a network monitoring tool employed by numerous
corporations and government agencies. By exploiting this vulnerability, the
attackers gained unauthorised access to the networks of SolarWinds clients,
which allowed them to steal data and deploy malware.

This incident raises a question "How did such a consequential security breach
remain unnoticed for months?" and underscores the critical importance of
reproducibility in #gls("SE"). Had the SolarWinds Orion software and its
dependencies been subject to stringent reproducibility standards, where every
build could be precisely recreated and examined, the malicious alterations might
have been detected earlier. Reproducibility in this context not only refers to
the ability to replicate software builds but also to verify the integrity and
provenance of every component, ensuring that no unauthorised changes have been
made. By prioritising reproducibility, developers and users of software can
enhance security measures, mitigate risks, and foster a more trustworthy digital
environment.

In a post from the @joinupSignal, institutions like the European Commission and
the European Parliament began recommending Signal
#cite(<signalApp>, form: "normal"), a secure open-source instant messaging
platform, for communications. This highlighted a broader, critical issue: the
verification of software authenticity. Users generally trust software obtained
from various stores, but this trust brings to the forefront the question of how
they can verify with certainty that the version of the Signal application
installed on their devices indeed derives directly from the source code provided
in its repository. Ensuring an application's authenticity, confirming it has not
been tampered with prior to its public release, has become a central concern in
our everyday lives. This issue underscores the importance of transparent and
reproducible builds where the end product can be reliably traced back to its
original source, ensuring the integrity and security of the software being used.

During the OpenAI DevDay's keynote #cite(<openAIKeynote2023>, form: "normal")
in November 2023, OpenAI's CEO Sam Altman unveiled a groundbreaking feature
called #emph[reproducible outputs]. This innovation enables users to
consistently replicate the outcomes generated by OpenAI's models, marking a
significant advancement in achieving reproducibility within the realm of
artificial intelligence.

Software companies have increasingly recognised the importance of
reproducibility for enhancing security. Popular messaging platforms like Signal
#cite(<SignalReproducible>, form: "normal") and Telegram
#cite(<TelegramReproducible>, form: "normal") have taken significant steps to
ensure the reproducibility of their builds. They support reproducible builds,
allowing users to verify that the open-source code matches the applications
available on various app stores, including the Apple Store and Google Play. This
initiative ensures that the distributed binaries are authentic and unaltered,
thereby protecting users from potential vulnerabilities and enhancing trust in
the software's integrity. By implementing these procedures, software companies
highlight the broader industry's move towards transparency and reliability in
software distribution, reinforcing the essential role of reproducibility in
modern #gls("SE").

In the light of these considerations, this master thesis addresses the
aforementioned issues and questions by delving into the principles of software
reproducibility. We will explore the mechanisms that can ensure the integrity of
software, and examine how these practices can be standardised to safeguard
against the risks of unauthorised tampering. In doing so, this thesis aims to
contribute to the critical discourse on software security and reliability in an
era where digital trust is paramount.

== Background

Curiosity has always been at the core of my being, fuelling an insatiable
eagerness to learn and explore the unknown. I remember myself as an inquisitive
boy, constantly delving into the mechanics of how things work. This curiosity
often led to disassembling devices to uncover their hidden secrets, followed by
a harder quest to reassemble them. While my father played a pivotal role in this
journey of discovery, and I simply cannot recall a single moment when he
responded with #emph["I don't know"]; it was my mother who truly ignited my
path to computers. Her encouragement and unwavering belief in pursuing my
passions were instrumental in shaping my journey towards a deeper understanding
of the world around me, especially computers.

My interest in computers and software development was sparked in my early
childhood, before the age of ten with the Logo language, which soon led to my
discovery of the BASIC programming language on an Atari 1040STE. The
capabilities of that machine captivated my young mind, igniting a passion for
technology and its boundless potential. This early fascination was a signpost
towards my future; it was clear that my career would be intertwined with
computers. Over the years, I witnessed the remarkable evolution of the software
industry and the advent of groundbreaking technologies. I have also observed the
progression in software development methodologies. However, despite the influx
of new technologies arising, there are certain categories of issues that remain
constant along the passing years, sadly.

Transitioning from BASIC, I briefly jumped on Microsoft Windows before moving to
Linux, a platform that has since become my daily driver. In 2019, I found myself
grappling with a sluggish laptop running a popular Linux distribution. In search
of a faster, binary-based alternative, I transitioned to NixOS
#cite(<NixOS>, form: "normal"). This shift marked the beginning of a totally new
perspective on software development for me. It was through NixOS that I
encountered the concept of "reproducibility" which opened my eyes to the
possibilities of making and shipping more reliable software.

We've seen in the previous section and will detail further in the next chapters
that this concept originates from researchers and the scientific method. This
concept can be transposed to #gls("CS") and more specifically to software
development. In this context, reproducibility is the ability to recreate the
exact same software, including the operating system, the compiler, the
libraries, and the source code, in order to obtain the same results.

For the past three years, the principle of reproducibility has totally
revolutionised my approach to software development. This concept has captivated
me to such an extent that I now devote a significant portion of my free time to
contributing to open-source projects that emphasise reproducible builds. It is
this profound interest that has inspired me to dedicate my master's thesis to
exploring the depths and implications of reproducibility in #gls("SE").

Here's a non-exhaustive list of projects I have contributed to:
- In the Linux NixOS operating system:
  - I created around 430 pull requests #cite(<drupolPrOnNix>, form: "normal").
  - I made around 1800 reviews #cite(<drupolReviewOnNix>, form: "normal").
  - After several months of dedicated effort, I developed a wrapper for building
    reproducible Composer-based PHP applications
    #cite(<drupolPhpBuilderOnNix>, form: "normal"), resolving a significant
    obstacle and positioning Nix as the preferred distribution for self-hosting
    PHP applications. An updated version is in preparation
    #cite(<drupolPhpBuilderOnNixV2>, form: "normal"), which will be more
    user-friendly and will provide a more comprehensive solution for PHP
    developers while being at least twice faster than the previous version.

- In the PHP #cite(<php>, form: "normal") community:
  - In Composer #cite(<composer>, form: "normal"), the PHP package manager, I
    proposed a pull request enabling deterministic outputs by default
    #cite(<drupolComposerReproduciblePr>, form: "normal").
  - I advocate for reproducibility by giving talks
    #cite(<drupolIpc2023Talk>, form: "normal").
  - I open issues in PHP projects that are not shipping required files to enable
    reproducibility, explaining the reasons why it should be included:
    - In PHPUnit, the PHP testing framework
      #cite(<drupolPhpunitPR5576>, form: "normal")\;
    - In PsySH, a PHP #gls("REPL", long: false)
      #cite(<drupolPsyshIssue767>, form: "normal")\;
    - In GrumPHP, a code quality tool
      #cite(<drupolGrumphpIssue1095>, form: "normal")\;
    - In Psalm, a static analysis tool
      #cite(<drupolPsalmIssue10446>, form: "normal")\;
    - In PHPMD, a static analysis tool
      #cite(<drupolPhpmdIssue1056>, form: "normal")\;
    - In PHP-CS-Fixer, a code formatter
      #cite(<drupolPhpCsFixerIssue7590>, form: "normal")\;
    - In PHP-Parallel-Lint, a code linter
      #cite(<drupolPhpParallelLintIssue153>, form: "normal")\;
  - I initiated and participated in discussions to improve reproducibility in
    the PHP source code #cite(<PhpSrcReproduciblePhar>, form: "normal").
- In the Reproducible Builds #cite(<ReproducibleBuildsOrg>, form: "normal")
  project:
  - I contributed to the website by making it reproducible
    #cite(<drupolRBPR102>, form: "normal")\;
  - I improved the documentation #cite(<drupolRBPR113>, form: "normal")
    #cite(<drupolRBPR114>, form: "normal")\;
  - I contributed to the monthly reports
    #cite(<drupolRBMonthlyReports>, form: "normal")\;
- In the Typst #cite(<typst>, form: "normal") project:
  - I raised awareness about the importance of reproducibility
    #cite(<typstReproducibleBuildIssue1>, form: "normal")\;
  - I engaged in discussions on Discord leading to improving the compilation
    environment hermeticity
    #cite(<typstReproducibleBuildIssue2>, form: "normal")\;
- At work, I advocate the cause of reproducibility, emphasising its critical
  importance in our projects. The objective is to raise awareness amongst my
  colleagues about the advantages of reproducibility, with the ultimate aim of
  establishing it as a norm within our organisational software practices. As an
  initial measure, I am developing proofs of concept that illustrate the
  process of creating reproducible containers, embedding their #gls("SBOM")
  within their metadata. Additionally, I pioneered a project focused on
  generating ephemeral, reproducible, and tailor-made development environments
  and user profiles #cite(<devs-profile>, form: "normal"). Finally, I try to
  provide reproducible development environments for each open-source projects
  #cite(<ecphpSessions>, form: "normal") we publish to foster a more transparent
  and secure software development process but also to encourage contributions.
- In 2022, I participated in the #emph[Summer of Nix], a paid summer program
  designed to foster learning, networking, and collaboration within the Nix
  community. The program caters to both experienced Nix users and newcomers,
  offering a unique opportunity to work together on a diverse range of topics.
  During this event, I did a talk about how we use Nix at work
  #cite(<SoN200PolDellaiera>,form:"normal").
- In a recent YouTube interview on "La Tronche En Biais"
  #cite(<teb>, form: "normal") , in a live titled "SCIENCES: Une crise de
  reproductibilité des études?" #cite(<teb-r13y-crisis-lib>, form: "normal"), I
  briefly discussed the reproducibility crisis in scientific studies and drew
  parallels with #gls("SE"). I shared insights from my master's thesis on this
  topic, particularly highlighting the challenges faced when software compiled
  in one environment fails in another, highlighting broader implications for
  security and consistency across different systems. I also clarified different
  levels of reproducibility introduced in @ch2-r13y-levels.

== Motivation

The pursuit of reproducibility in #gls("SE") is driven by a
fundamental quest for precision, reliability, and trust in the digital
landscape. In an age where software pervades nearly every aspect of our personal
and professional lives, the importance of being able to reliably replicate
software builds cannot be overstated.

At its core, software reproducibility addresses a simple yet profound question:
can we consistently recreate the same software product, with the same
functionality and performance, across different environments and over time? This
question is not just academic but is deeply rooted in practical necessities and
ethical considerations in the field of #gls("CS"), but not only.

The principle of reproducibility is essential across various disciplines,
ranging from the empirical rigor of scientific experiments to painting or even
culinary art. This concept, at its core, is about the ability to consistently
replicate results under similar conditions.

In cooking, recipes passed down through generations serve as blueprints for
recreating cherished family dishes. Despite meticulously following these
recipes, achieving the exact taste and texture of an ancestral meal can
sometimes be elusive. Factors like cooking temperature, ingredient quality, or
even altitude can possibly alter the outcome. This uncertainty in replicating
results underscores the complexity and nuances involved in the process of
reproducibility.

In #gls("CS"), the implications of reproducibility take on a more systemic and
critical dimension. Imagine wanting to use or build a software application,
ensuring it is identical to what the original developer intended. For instance,
this thesis itself is a digital artefact, a #gls("PDF") document derived from
source files hosted in a public repository. A pertinent question arises: how can
one be sure that the document produced from the source code today will be
identical to one compiled a year from now? Ensuring reproducibility in such
cases is not just a matter of convenience but a cornerstone for verifying
authenticity and integrity in a digital world increasingly prone to
misinformation and security threats.

Reproducibility in #gls("SE") lies in its potential to enhance reliability and
security. Reproducibility aims to eliminate the all-too-common refrain of
#emph["it works on my machine!"] by establishing a more robust, consistent build
and deployment process. It is about creating a development environment where
software, when operational on one machine, can be expected to be built and
function identically on another, thereby bridging gaps in consistency and
predictability. In a digital era where trust and security are paramount,
reproducibility is not merely a technical objective; it is a fundamental
criterion for building and maintaining digital trust.

One of the driving factors behind this research is the inherent complexity
present in modern software environments. Today's software systems are built on
intricate layers of dependencies, including various libraries, frameworks, and
operating systems. This complexity poses significant challenges in ensuring
consistent behaviour of software products across different environments.
Moreover, the escalating frequency of security breaches and malicious attacks on
software supply chains underscores the critical role of reproducibility. It
serves as a vital mechanism for verifying the integrity of software, assuring
that it has not been compromised, and maintaining the transparency of the build
process.

Furthermore, the academic and scientific rigors of #gls("CS") demand a steadfast
commitment to reproducibility. In a field where building upon previous work is
the norm, the ability to validate and replicate research findings is
indispensable. This aspect is particularly crucial in open-source software
development, which thrives on community collaboration. The open-source paradigm
hinges on the capability of developers around the world to replicate, modify,
and contribute to codebases consistently and efficiently.

Lastly, the evolving nature of software poses its own set of challenges.
Software development is a dynamic process, with systems continually evolving and
adapting. Maintaining reproducibility ensures that earlier versions of software
can be reliably reconstructed and understood, a critical factor for long-term
maintenance, auditing, and compliance.

Through this thesis, the aim is to shed light on the significance of software
reproducibility, exploring how it can be effectively achieved and the tools and
practices that can facilitate this goal. This exploration is not only crucial
for the technological advancement but also for upholding the principles of
reliability, security, and transparency in an increasingly software-dependent
world.

== Goals

In this master thesis, my primary focus will be to provide a comprehensive
overview of reproducible builds, within the sphere of software development,
acknowledging that a complete examination of every aspect of reproducibility is
beyond our scope.

I will explore a selection of tools and methodologies that promote
reproducibility or, at least, create favourable conditions for facilitating it.
Moreover, this document is intended to enlighten and hopefully convince the
reader that the construction of reproducible software should be a fundamental
principle, not merely a secondary consideration, within the software development
lifecycle. Finally, I will delve into the rationale for adopting this
reproducibility paradigm as a standard practice in modern #gls("SE"), with
particular emphasis on security implications.

By the conclusion of this thesis, the reader will have a comprehensive
understanding of the concept of reproducibility and how best practices can be
implemented effectively in software development projects.

== Structure

Organised into several chapters, this thesis systematically explore the
multifaceted nature of software reproducibility.

- @chapter1 being this introduction, outlining the thesis's scope and
  objectives.
- @chapter2 introduces the origin of the concept of reproducibility, tracing its
  lineage from scientific principles. It proposes a terminology, formalisms and
  its challenges.
- @chapter3 is a hands-on exploration, delving into specific real-world
  examples. It will demonstrate practical applications of the concepts discussed
  in previous chapters, including proof of concept implementations, concrete
  case studies, and detailed analyses of real-world scenarios where
  reproducibility plays a crucial role. This chapter aims to bridge theory with
  practice, showing how the principles of reproducibility are applied and
  sometimes challenged in real-world settings.
- The final @chapter4 synthesises the insights gained throughout the thesis. It
  offers recommendations for best practices based on the research and
  discussions presented. Moreover, it suggests directions for future work,
  identifying areas where further research, development, and discussion are
  needed to advance the field of software reproducibility.

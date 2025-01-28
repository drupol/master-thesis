#import "imports/preamble.typ": *
#import "theme/template.typ": *

#set document(
  title: title,
  author: author,
  date: none,
  keywords: (
    "university",
    "umons",
    "june 2024",
    "master thesis",
    "reproducibility",
    "r13y",
    "compilation",
    "docker",
    "nix",
    "guix",
  ),
)

#show: make-glossary

#show: project.with(
  title: title,
  university: university,
  faculty: faculty,
  degree: degree,
  program: program,
  supervisor: supervisor,
  advisors: advisors,
  author: author,
  startDate: startDate,
  submissionDate: submissionDate,
  doi: doi,
  disclaimer: include "disclaimer.typ",
  acknowledgement: include "acknowledgement.typ",
  abstract: include "abstract.typ",
  accessibility: include "accessibility.typ",
  extra: include "extra.typ",
  terms: (
    (
      key: "CC BY 4.0",
      short: "CC BY 4.0",
      long: "Creative Commons Attribution 4.0 International",
      description: [The Creative Commons Attribution 4.0 International License #cite(<CCBy40>,form:"normal") is a widely used license that allows others to distribute, remix, adapt, and build upon your work, even commercially, as long as they credit you for the original creation. This is the most flexible of the CC licenses.],
    ),
    (
      key: "CDN",
      short: "CDN",
      long: "Content Delivery Network",
      description: [A content delivery network is a system of distributed servers that deliver web content to a user based on the geographic locations of the user, the origin of the webpage and a content delivery server, making the delivery of content more efficient.],
    ),
    (
      key: "CICD",
      short: "CI/CD",
      long: "Continuous Integration/Continuous Deployment",
      description: [Continuous Integration (CI) is a software development practice where developers regularly merge their code changes into a central repository, after which automated builds and tests are run. Continuous Deployment (CD) is a software release process that uses automated testing to validate that changes are safe to deploy to production.],
    ),
    (
      key: "CPU",
      short: "CPU",
      long: "Central Processing Unit",
      description: [The CPU is the primary component of a computer that processes instructions. It runs the operating system and applications, constantly receiving input from the user or active software programs. It processes the data and produces outputs. ARM and X86 are two common CPU architectures.],
    ),
    (
      key: "CRA",
      short: "CRA",
      long: "Cyber Resilience Act",
      description: [The Cyber Resilience Act #cite(<CRA>,form:"normal") is a proposed European Union regulation that aims to improve the cybersecurity of digital products and services. It includes provisions for #link(<ch2-supply-chain>)[software supply chain] security, incident reporting, and security certification.],
    ),
    (
      key: "CS",
      short: "CS",
      long: "Computer Science",
      description: [The discipline of Computer Science includes the study of algorithms and data structures, computer and network design, modelling data and information processes, and artificial intelligence. Computer Science draws some of its foundations from mathematics and engineering and therefore incorporates techniques from areas such as queueing theory, probability and statistics, and electronic circuit design.],
    ),
    (
      key: "CycloneDX",
      short: "CycloneDX",
      description: [@cyclonedx is an open-format standard baked by the OWASP foundation and Ecma Technical Committee designed to provide comprehensive and interoperable information about the components used within software projects like software bill of materials and advanced supply chain capabilities for cyber risk reduction.],
    ),
    (
      key: "DevOps",
      short: "DevOps",
      description: [DevOps is a set of practices that combines software development (Dev) and IT operations (Ops). It aims to shorten the systems development life cycle and provide #gls("CICD").],
    ),
    (
      key: "DevSecOps",
      short: "DevSecOps",
      description: [
        DevSecOps is an extension of #gls("DevOps") practices that integrates security (Sec) measures at every stage of the software development lifecycle, ensuring that security is a fundamental aspect of development and operations processes.
      ],
    ),
    (
      key: "DSL",
      short: "DSL",
      long: "Domain Specific Language",
      description: [A domain-specific language is a computer language specialised to a particular application domain. This is in contrast to a general-purpose language, which is broadly applicable across various domains.],
    ),
    (
      key: "FHS",
      short: "FHS",
      long: "Filesystem Hierarchy Standard",
      description: [The Filesystem Hierarchy Standard is a reference document that describe the conventions used for the layout of Unix-like operating systems. This includes names, locations, and permissions of many file and directories.],
    ),
    (
      key: "HL3",
      short: "HL3",
      long: "Hippocratic Licence 3.0",
      description: [The Hippocratic Licence 3.0 #cite(<HypocraticLicence>,form:"normal") is a software license that ensures that software is not used to contribute to human rights abuses or other unethical practices. It is designed to protect users and communities from the potential misuse of software.],
    ),
    (
      key: "IDE",
      short: "IDE",
      long: "Integrated Development Environment",
      plural: "IDEs",
      longplural: "Integrated Development Environments",
      description: [An integrated development environment is a software application that provides comprehensive facilities to computer programmers for software development.],
    ),
    (
      key: "IEEE",
      short: "IEEE",
      long: "Institute of Electrical and Electronics Engineers",
      description: [The Institute of Electrical and Electronics Engineers #cite(<ITripleE>, form:"normal"), established in 1963, is the world's largest technical professional organisation dedicated to advancing technology for the benefit of humanity. It serves as a professional association for electronic engineering, electrical engineering, and related disciplines.],
    ),
    (
      key: "MD5",
      short: "MD5",
      long: "Message Digest 5",
      description: [The MD5 message-digest algorithm is a widely used hash function producing a 128-bit hash value. MD5 was designed by Ronald Rivest in 1991 to replace an earlier hash function MD4, and was specified in 1992 as RFC 1321.],
    ),
    (
      key: "OCI",
      short: "OCI",
      long: "Open Container Initiative",
      description: [OCI stands for @opencontainerinitiative, an open governance project for the purpose of creating open industry standards around container formats and runtime. An "OCI image" is a container image that conforms to the OCI image format specification.],
    ),
    (
      key: "OS",
      short: "OS",
      long: "Operating System",
      plural: "OSes",
      longplural: "Operating Systems",
      description: [An operating system is system software that manages computer hardware and software resources, and provides common services for computer programs.],
    ),
    (
      key: "PDF",
      short: "PDF",
      long: "Portable Document Format",
      description: [A file format developed by Adobe in the 1990s to present documents, including text formatting and images, in a manner independent of application software, hardware, and operating systems.],
    ),
    (
      key: "POSIX",
      short: "POSIX",
      long: "Portable Operating System Interface",
      description: [POSIX is a family of standards specified by the #gls("IEEE") for maintaining compatibility between operating systems.],
    ),
    (
      key: "PURL",
      short: "PURL",
      plural: "PURLs",
      long: "Package URL",
      description: [A PURL #cite(<purl>,form:"normal") is a #gls("URL") string used to identify and locate a software package in a mostly universal and uniform way across programing languages, package managers, packaging conventions, tools, APIs and databases.],
    ),
    (
      key: "REPL",
      short: "REPL",
      long: "Read-Eval-Print Loop",
      description: [A read-eval-print loop is an interactive computer programming environment that takes single user inputs, evaluates them, and returns the result to the user.],
    ),
    (
      key: "SBOM",
      short: "SBOM",
      plural: "SBOMs",
      long: "Software Bill of Materials",
      description: [The software bill of materials is a comprehensive inventory of all components, including libraries, dependencies and versions, that constitute a software product, used for tracking and managing software supply chain security.],
    ),
    (
      key: "SPDX",
      short: "SPDX",
      long: "Software Package Data Exchange",
      description: [The @spdx format, created and maintained by the
        Linux Foundation, is a standardised way of documenting and communicating the
        components, licenses, and copyrights of software packages. It provides a
        consistent method for tracking and sharing information about software contents,
        particularly in open-source and collaborative environments.],
    ),
    (
      key: "SHA1",
      short: "SHA-1",
      long: "Secure Hash Algorithm 1",
      description: [SHA-1 is a hash function which takes an input and produces a 160-bit (20-byte) hash value known as a message digest – typically rendered as 40 hexadecimal digits. It was designed by the United States National Security Agency (NSA), and is a U.S. Federal Information Processing Standard.],
    ),
    (
      key: "SHA2",
      short: "SHA-2",
      long: "Secure Hash Algorithm 2",
      description: [SHA-2 is a set of cryptographic hash functions designed by the United States National Security Agency (NSA). It consists of six hash functions with digests (hash values) that are 224, 256, 384 or 512 bits: SHA-224, SHA-256, SHA-384, SHA-512, SHA-512/224, SHA-512/256.],
    ),
    (
      key: "SE",
      short: "SE",
      long: "Software Engineering",
      description: [Software Engineering is a computing discipline. It is the systematic application of engineering approaches to the development of software.],
    ),
    (
      key: "SemVer",
      short: "SemVer",
      long: "Semantic Versioning",
      description: [Semantic Versioning #cite(<preston2013semantic>, form: "normal") is a versioning scheme for software that uses a three-part version number: `MAJOR.MINOR.PATCH`.],
    ),
    (
      key: "SRI",
      short: "SRI",
      long: "Subresource Integrity",
      description: [Subresource Integrity #cite(<sri>, form: "normal") is a security feature that allows web developers to ensure that resources they fetch are delivered without unexpected manipulation.],
    ),
    (
      key: "SVG",
      short: "SVG",
      long: "Scalable Vector Graphics",
      description: [SVG is an XML-based vector image format.],
    ),
    (
      key: "SWHID",
      short: "SWHID",
      long: "Software Heritage Identifier",
      description: [The Software Heritage Identifier #cite(<hal-01865790>,form:"normal") is a unique identifier for software artifacts, such as source code, that is used to track and reference software across different platforms and systems.],
    ),
    (
      key: "URL",
      short: "URL",
      long: "Uniform Resource Locator",
      description: [A URL is a reference to a web resource that specifies its location on a computer network and a mechanism for retrieving it.],
    ),
  ),
)

#include "1-introduction.typ"

#include "2-reproducibility.typ"

#leftblank(weak: false)

#include "3-tools.typ"

#include "4-conclusion.typ"

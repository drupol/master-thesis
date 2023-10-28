[![Download latest](https://img.shields.io/badge/Download-Latest-brightgreen?style=flat-square)](https://github.com/drupol/master-thesis/releases/latest)
[![CC BY License badge](https://img.shields.io/badge/License-CC--BY--4.0-brightgreen?style=flat-square)](https://creativecommons.org/licenses/by/4.0/)
[![HL3 License badge](https://img.shields.io/badge/License-HL3--full-brightgreen?style=flat-square)](https://firstdonoharm.dev/version/3/0/full.html)

# UMons Master Thesis - Reproducibility in Software Engineering (RiSE)

This repository contains the sources of my master's thesis, completed in June
2024 at the [University Of Mons] under the supervision of [Tom Mens].

## Abstract

The concept of reproducibility has long been a cornerstone in scientific
research, ensuring that results are robust, repeatable, and can be independently
verified. This concept has been extended to computer science, focusing on the
ability to recreate identical software artefacts. However, the importance of
reproducibility in software engineering is often overlooked, leading to
challenges in the validation, security, and reliability of software products.

This master's thesis aims to investigate the current state of reproducibility in
software engineering, exploring both the barriers and potential solutions to
making software more reproducible and raising awareness. It identifies key
factors that impede reproducibility such as inconsistent environments, lack of
standardisation, and incomplete documentation. To tackle these issues, I propose
an empirical comparison of tools facilitating software reproducibility.

To provide a comprehensive assessment of reproducibility in software
engineering, this study adopts a methodology that involves a hands-on evaluation
of four different methods and tools. Through a systematic evaluation of these
tools, this research seeks to determine their effectiveness in establishing and
maintaining identical software environments and builds.

This study contributes to academic knowledge and offers practical insights that
could influence future software development protocols and standards.

## Repository Structure

The repository is structured as follows:

- `src/thesis`: Contains the [Typst] source code
- `nix`: Contains the [Nix] expressions necessary for the build but also for the
  local development environment
- `resources`: Contains some resources (images, source code, ...)

## Licensing

This work is licenced under a dual license: the Creative Commons Attribution 4.0
International ([CC BY 4.0]) and the Hippocratic Licence 3.0 ([HL3]) licences.
You are free to share and adapt the material under the terms of the CC BY 4.0,
provided you give appropriate credit to the original author. You must also use
the material in accordance with the ethical guidelines specified in HL3,
ensuring it is not used to contribute to human rights abuses or other unethical
practices. In case of any conflict between the licences, HL3 will take
precedence.

## Cite

```
@masterthesis{dellaieraMasterThesis2024,
  title  = {Reproducibility in Software Engineering},
  author = {Dellaiera, Pol},
  year   = 2024,
  month  = {June},
  note   = {Available at \url{TODO}},
  school = {University of Mons},
  type   = {Master's thesis}
}
```

## How To Contribute

We welcome contributions! If you'd like to contribute to this repository, please
feel free to send a pull request.

### Setting Up Your Development Environment

To set up a local development environment with all the necessary tools to build
the document, you have two options:

1. **Using Nix:** Load the default shell environment by running: `nix develop`

2. **Using DevContainer:** You can also set up a complete development
   environment using [DevContainer].

The master thesis is written using [Typst], a modern typesetting system. The
primary language of the document is British English.

[DevContainer]: https://containers.dev/
[Nix]: https://nixos.org/
[Typst]: https://typst.app/
[University Of Mons]: https://www.umons.ac.be/
[Tom Mens]: https://informatique.umons.ac.be/perso/Mens.Tom/
[CC BY 4.0]: https://creativecommons.org/licenses/by/4.0/
[HL3]: https://firstdonoharm.dev/version/3/0/full.html

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
  glossary: include "glossary.typ",
  accessibility: include "accessibility.typ",
  extra: include "extra.typ"
)

#include "1-introduction.typ"

#include "2-reproducibility.typ"

#leftblank(weak: false)

#include "3-tools.typ"

#include "4-conclusion.typ"

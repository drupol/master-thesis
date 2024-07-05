#import "metadata.typ": *

#let titlepage(
  title: "",
  subtitle: "",
  university: "",
  faculty: "",
  degree: "",
  program: "",
  supervisor: "",
  advisors: (),
  author: "",
  authorOrcId: "",
  doi: none,
  startDate: none,
  submissionDate: none,
  rev: none,
  shortRev: none,
  builddate: none,
) = {
  set page(
    margin: (top: 1cm, left: 1cm, right: 1cm, bottom: 1cm),
    numbering: none,
    number-align: center,
    header: {
      place(top + left)[
        #pad(top: 10pt)[
          #set text(size: 4em)
          #include "../UMONS-fs-logo.typ"
        ]
      ]
      place(top + right)[
        #pad(top: 10pt)[
          #set text(size: 4em)
          #include "../UMONS-logo.typ"
        ]
      ]
    },
    footer: align(
      center,
      text(font: sans-font)[
        #faculty #sym.diamond.filled.small
        #university #sym.diamond.filled.small
        20, Place du Parc #sym.diamond.filled.small
        B-7000 Mons
      ],
    ),
  )

  set text(
    font: body-font,
    size: 12pt,
    lang: "en",
  )

  place(center + horizon, dy: 3em)[
    #align(center, text(font: sans-font, 2em, weight: 700, title))

    #if subtitle != none {
      align(center, text(font: sans-font, 1em, weight: 700, subtitle))
    }

    #align(center, text(font: sans-font, 1.3em, weight: 100, view))

    #grid(
      columns: 3,
      gutter: 1em,
      align: (right, left, left),
      strong("Author"),
      ":",
      {
        link("https://orcid.org/" + authorOrcId)[#author#box(
            image(
              "../../../../resources/images/ORCIDiD_iconvector.svg",
              width: 10pt,
            ),
          )]
      },
      strong("Supervisor"),
      ":",
      supervisor,
      ..if advisors != none {
        (strong("Advisors"), ":", advisors.join(", "))
      },
      ..if startDate != none {
        (strong("Academic year"), ":", startDate)
      },
      ..if submissionDate != none {
        (strong("Submission date"), ":", submissionDate)
      },
      ..if builddate != "" {
        (strong("Build date"), ":", builddate)
      },
      ..if doi != none {
        (
          strong("DOI"),
          ":",
          link(
            "https://doi.org/" + doi,
            doi,
          ),
        )
      },
      ..if shortRev != "" {
        (
          strong("Revision"),
          ":",
          link(
            "https://github.com/drupol/master-thesis/commit/" + rev,
            shortRev,
          ),
        )
      },
    )
  ]
}

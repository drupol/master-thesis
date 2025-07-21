#import "../imports/preamble.typ": *
#import "common/metadata.typ": *
#import "common/titlepage.typ": *
#import "disclaimer.typ": *
#import "leftblank.typ": *
#import "acknowledgement.typ": *
#import "abstract.typ": *
#import selectors: *

#let getHeader() = {
  context {
    let page-counter = counter(page)
    let current = page-counter.at(here()).first()

    let chapter = hydra(
      1,
      display: (_, it) => {
        if it.numbering != none {
          [#numbering(it.numbering, ..counter(heading).at(it.location())) - #it.body]
        }
      },
    )

    let section = hydra(selectors.by-level(min: 2), display: (
      _context,
      element,
    ) => element.body)
    let items = (smallcaps(chapter), h(1fr), emph(section))

    if calc.even(current) {
      items.rev()
    } else {
      items
    }.join()

    if (chapter != none) {
      [#line(length: 100%, stroke: .2pt + rgb("#000000").lighten(65%))]
    }
  }
}

#let getFooter() = {
  context {
    let page-counter = counter(page)
    let current = page-counter.at(here()).first()
    let items = ([#current], h(1fr), emph(title))

    if calc.even(current) {
      items
    } else {
      items.rev()
    }.join()
  }
}

#let chapterquote(
  title: none,
  ref: none,
  quoteText: none,
  quoteAttribution: none,
) = {
  pagebreak()

  place(top + left, dx: 45pt, dy: 45pt)[
    #rect(width: 50pt, height: 50pt, fill: rgb(125, 125, 125))
  ]

  place(top + left)[
    #rect(width: 70pt, height: 70pt, fill: rgb(0, 0, 0))
  ]

  v(10%)

  [
    #{
      heading(title, level: 1)
    }
    #label(ref)
  ]

  if quoteText != none {
    show quote: set pad(x: 0em)
    quote(
      block: true,
      attribution: [#{
        if quoteAttribution != none {
          cite(form: "prose", quoteAttribution)
        }
      }],
      quoteText,
    )
  }

  pagebreak()
}

#let project(
  title: "",
  university: "",
  faculty: "",
  degree: "",
  program: "",
  supervisor: "",
  advisors: (),
  author: "",
  doi: none,
  startDate: none,
  submissionDate: none,
  disclaimer: none,
  acknowledgement: none,
  abstract: none,
  accessibility: none,
  extra: none,
  terms: (),
  body,
) = {
  register-glossary(terms)

  // --- Page configuration ---
  set page(
    margin: page-margin,
    numbering: "1",
    number-align: center,
    header: getHeader(),
    footer: getFooter(),
    paper: "a4",
  )

  titlepage(
    title: title,
    subtitle: subtitle,
    university: university,
    faculty: faculty,
    degree: degree,
    program: program,
    supervisor: supervisor,
    advisors: advisors,
    author: author,
    authorOrcId: authorOrcId,
    startDate: startDate,
    submissionDate: submissionDate,
    rev: rev,
    shortRev: shortRev,
    builddate: builddate,
    doi: doi,
  )

  // --- Typography ---
  set text(
    font: body-font,
    size: font.normal,
    lang: "en",
    hyphenate: false,
  )

  // --- Paragraphs ---
  // Source: https://typst.app/docs/guides/guide-for-latex-users/
  set par(justify: true)
  set par(spacing: 1em)

  show ref: it => {
    let el = it.element

    if el == none {
      return it
    }

    if el.has("level") and el.level == 1 {
      let (chapter,) = counter(heading).at(el.label)
      link(el.label)[Chapter #chapter]
    } else if el.has("level") and el.level == 2 {
      let (chapter, section) = counter(heading).at(el.label)
      link(el.label)[Chapter #chapter, section #section]
    } else if el.has("level") and el.level == 3 {
      let (chapter, section, subsection) = counter(heading).at(el.label)
      link(el.label)[Chapter #chapter, section #section.#subsection]
    } else if el.has("level") and el.level == 4 {
      let (
        chapter,
        section,
        subsection,
        subsubsection,
      ) = counter(heading).at(el.label)
      link(
        el.label,
      )[Chapter #chapter, subsection #section.#subsection.#subsubsection]
    } else {
      link(el.label)[#it]
    }
  }

  // --- Citations ---
  set cite(
    form: "prose",
    style: "ieee",
  )
  show cite: cite => {
    underline(cite, stroke: .2pt + rgb("#000000").lighten(65%))
  }

  // --- Links ---
  show link: it => {
    underline(it, stroke: .2pt + rgb("#000000").lighten(65%))
  }

  leftblank(weak: false)
  [#disclaimer]
  leftblank(weak: false)
  [#abstract]
  leftblank(weak: false)
  [#acknowledgement]
  leftblank(weak: false)
  [#accessibility]
  [#extra]
  {
    pagebreak(weak: true)

    [
      #{
        heading(level: 1, "Glossary", outlined: false)
      } <glossary>
    ]

    v(10mm)

    // FIX left alignment of glossary:
    // With glossary 0.5.1 it is necessary
    // to overwrite figure captions to be aligned left
    show figure.caption: c => block(width: 100%, align(left, c.body))

    print-glossary(show-all: true, terms)
  }

  leftblank(weak: false)

  {
    // --- Table of Contents ---
    {
      set par(
        leading: 0.4em,
        justify: true,
      )
      show outline.entry.where(level: 1): it => {
        v(12pt, weak: true)
        strong(it)
      }

      heading(numbering: none, outlined: false)[Contents]
      outline(title: "", indent: 1.5em, depth: 3)
    }

    leftblank(weak: false)

    // --- Headings ---
    set heading(numbering: "1.")
    show heading.where(level: 1): set heading(
      numbering: "I",
      supplement: [Chapter],
    )
    show heading.where(level: 2): set heading(
      numbering: "1.",
      supplement: [Section],
    )
    show heading.where(level: 3): set heading(
      numbering: "1.",
      supplement: [Subsection],
    )
    show heading.where(level: 1): it => block({
      set text(
        2em,
        weight: "bold",
      )
      v(8em)
      if it.numbering != none [
        Chapter #numbering(it.numbering, ..counter(heading).at(it.location()))
        #v(.5em)
      ]
      it.body
      v(0.5em)
    })

    // --- Various outlines ---
    show outline.entry.where(level: 1): it => {
      v(1em, weak: true)
      it
    }

    // --- Figures ---
    show figure.caption: it => (
      context [*#it.supplement #it.counter.display()*: #it.body]
    )
    show figure.where(kind: "table"): set figure.caption(position: top)
    body
  }

  {
    set par(
      leading: 1em,
      justify: true,
    )

    // List of definitions.
    [#heading(numbering: none)[List of definitions] #label(
        "list-of-definitions",
      )]
    outline(title: "", target: figure.where(kind: "definition"))

    leftblank(weak: false)

    // List of figures.
    pagebreak()
    [#heading(numbering: none)[List of figures] #label("list-of-figures")]
    outline(title: "", target: figure.where(kind: image))

    leftblank(weak: false)

    // List of tables.
    pagebreak()
    [#heading(numbering: none)[List of tables] #label("list-of-tables")]
    outline(title: "", target: figure.where(kind: "table"))

    leftblank(weak: false)

    [#heading("Bibliography", level: 1, outlined: true) #label("bibliography")]
    bibliography("../literature.bib", full: true, style: "ieee", title: none)
  }
}

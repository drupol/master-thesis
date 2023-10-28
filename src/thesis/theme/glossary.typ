#import "../imports/preamble.typ": *
#import "common/metadata.typ": *

#let glossary(
  title: "Glossary",
  terms: (),
) = {
  pagebreak(weak: true)

  [
    #{
      heading(level: 1, title, outlined: false)
    } <glossary>
  ]


  v(10mm)

  print-glossary(show-all: true, terms)
}

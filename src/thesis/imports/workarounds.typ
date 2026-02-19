#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "../theme/common/metadata.typ": *

#let sourcefile(file: none, lang: none) = {
  set par(justify: false)
  set align(left)

  show: codly-init.with()

  // --- Raw text configuration ---
  show raw: set text(size: font.raw)

  codly(
    languages: codly-languages,
    number-format: number => {
      text(fill: luma(75%), [#number])
    },
    zebra-fill: none,
    stroke: .6pt + luma(200),
    fill: luma(250),
    inset: .25em,
    radius: 3pt,
    lang-outset: (x: 0pt, y: 2pt),
    skip-last-empty: true,
  )

  raw(read(file), lang: lang, block: true)
}

#let shell(file: none) = {
  // --- Raw text configuration ---
  show raw: set text(size: font.raw)

  let body = [#read(file)]

  let kinds = (
    "$": green.darken(30%),
    "#": blue.darken(10%),
    ">": luma(40%),
    " ": luma(100%),
  )

  let lines = body
    .text
    .split("\n")
    .map(line => {
      if line.at(0, default: "") in kinds and line.at(1, default: "") == " " {
        (line.at(0), line.slice(2))
      } else {
        (none, line)
      }
    })

  show raw.line: it => [
    #let (kind, line) = lines.at(it.number - 1)
    #if kind != none {
      text(fill: kinds.at(kind), kind) + " " + line
    } else {
      text(fill: luma(50%), it.text)
    }
  ]

  show: codly-init.with()

  codly(
    languages: codly-languages,
    number-format: number => {
      text(fill: luma(75%), [#number])
    },
    zebra-fill: none,
    stroke: .6pt + luma(200),
    fill: luma(250),
    inset: .4em,
    radius: 3pt,
    lang-outset: (x: 0pt, y: 0pt),
    skip-last-empty: true,
  )

  raw(read(file), lang: "shell", block: true)
}

#let LaTeX = {
  [L]
  box(move(dx: -4.2pt, dy: -1.2pt, box(scale(65%)[A])))
  box(move(dx: -5.7pt, dy: 0pt, [T]))
  box(move(dx: -7.0pt, dy: 2.7pt, box(scale(100%)[E])))
  box(move(dx: -8.0pt, dy: 0pt, [X]))
  h(-8.0pt)
}

#let eg = content => {
  [(e.g., #content)]
}

#show "LaTeX": LaTeX

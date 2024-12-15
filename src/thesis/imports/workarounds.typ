#import "@preview/codelst:2.0.2": sourcecode, sourcefile

#let shell(body) = {
  let body = raw(body)
  let kinds = (
    "$": green.darken(30%),
    "#": blue.darken(10%),
    ">": luma(40%),
    " ": luma(100%),
  )
  let lines = body.text.split("\n").map(line => {
    if line.at(0, default: "") in kinds and line.at(1, default: "") == " " {
      (line.at(0), line.slice(2))
    } else {
      (none, line)
    }
  })

  set par(justify: false)

  show raw.line: it => [
    #let (kind, line) = lines.at(it.number - 1)
    #if kind != none {
      text(fill: kinds.at(kind), kind) + " " + it.body
    } else {
      text(fill: luma(50%), it.text)
    }
  ]

  show raw.line: set text(font: "Inconsolata Nerd Font Mono")

  sourcecode(numbers-style: line-no => text(
    fill: luma(160),
    size: .5em,
    str(line-no),
  ))[
    #raw(lang: "sh", lines.map(((_, line)) => line).join("\n"))
  ]
}

#let LaTeX = {
  [L];box(move(
    dx: -4.2pt, dy: -1.2pt,
    box(scale(65%)[A])
  ));box(move(
  dx: -5.7pt, dy: 0pt,
  [T]
));box(move(
  dx: -7.0pt, dy: 2.7pt,
  box(scale(100%)[E])
));box(move(
  dx: -8.0pt, dy: 0pt,
  [X]
));h(-8.0pt)
}

#let eg = content => {
  [(e.g., #content)]
}

#show "LaTeX": LaTeX

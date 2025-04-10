#import "../../src/thesis/imports/preamble.typ": *

#{
  set align(center + horizon)
  set text(font: "Virgil")
  grid(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    rows: (40pt, 25pt),
    image("../../resources/images/inputs-icon.svg"),
    xarrow(sym: sym.arrow.r, width: 50pt, ""),
    image("../../resources/images/computation-cogs.svg"),
    xarrow(sym: sym.arrow.r, width: 50pt, ""),
    {
      set text(
        font: "Liberation Mono",
        size: .7em,
      )
      box(inset: 10pt, fill: luma(230), width: 100pt, stroke: 1pt, radius: 5pt)[
        2aae6c35c9\
        4fcfb415db\
        e95f408b9c\
        e91ee846ed
      ]
    },
    "Inputs",
    "",
    "Checksum",
    "",
    "Outputs",
  )
}

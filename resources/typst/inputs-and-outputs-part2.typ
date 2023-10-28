#import "../../src/thesis/imports/preamble.typ": *

#set align(center + horizon)
#set text(font: "Virgil 3 YOFF")
#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  rows: (40pt, 25pt),
  image("../../resources/images/inputs-cube-2.svg"),
  xarrow(sym: sym.arrow.r, width: 50pt, ""),
  image("../../resources/images/computation-cogs.svg"),
  xarrow(sym: sym.arrow.r, width: 50pt, ""),
  image("../../resources/images/inputs-icon.svg"),
  "Inputs",
  "",
  "Computation",
  "",
  "Outputs",
)

#import "../../src/thesis/imports/preamble.typ": *
#import "../../src/thesis/theme/colors.typ": *

#set align(center + horizon)
#set text(font: "Virgil 3 YOFF")
#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  rows: (70pt, 25pt),
  {
    place(top + left, dx: 15pt, dy: 9pt)[#text(fill: umons-red)[Program]]
    place(
      top + left,
      dx: 15pt,
      dy: 31pt,
    )[#text(fill: umons-turquoise)[Parameters]]
    place(top + left, dx: 15pt, dy: 53pt)[#text(fill: umons-grey)[Environment]]
    image("../../resources/images/build-inputs1.svg")
  },
  {
    xarrow(sym: sym.arrow.r, width: 50pt, "")
    xarrow(sym: sym.arrow.r, width: 50pt, "")
    xarrow(sym: sym.arrow.r, width: 50pt, "")
  },
  {
    place(top + left, dx: 35pt, dy: 38pt)[#text(size: .75em)[Evaluation]]
    image("../../resources/images/build-inputs2.svg")
  },
  xarrow(sym: sym.arrow.r, width: 50pt, ""),
  image("../../resources/images/inputs-icon.svg"),

  "Inputs", "", "Computational environment", "", "Outputs",
)

#import "../../src/thesis/imports/preamble.typ": *

#table(
  columns: (1fr, 1fr),
  align: left + horizon,
  stroke: none,
  table.header(
    [*Equivalence class*],
    table.vline(stroke: .5pt),
    [*Examples*],
    table.hline(stroke: .5pt),
  ),
  [Same phenomenon],
  [Human experts],
  table.hline(stroke: .5pt),
  [Same statistics],
  [Software like GNUplot, Matplotlib, R],
  table.hline(stroke: .5pt),
  [Same data],
  [Checksum of file contents],
  table.hline(stroke: .5pt),
  [Same bits],
  [Checksum of file contents and metadata],
)

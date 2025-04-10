#import "../../src/thesis/imports/preamble.typ": *

#set align(left)

#table(
  columns: (1fr, 1fr, 1fr),
  stroke: none,
  table.header(
    [],
    table.vline(stroke: 1pt),
    [#align(center)[*Imperative*]],
    table.vline(stroke: .5pt),
    [#align(center)[*Declarative*]],
    table.hline(stroke: 1pt),
  ),
  table.cell(align: horizon + center)[*Divergent*],
  table.hline(stroke: .5pt),
  [
    - Shell commands
  ],
  [],
  table.cell(align: horizon + center)[*Convergent*],
  table.hline(stroke: .5pt),
  [
    - Ansible #cite(<ansible>, form: "normal")
    - Chef #cite(<chef>, form: "normal")
    - Docker #cite(<docker>, form: "normal")
  ],
  [
    - Puppet #cite(<puppet>, form: "normal")
    - Terraform #cite(<terraform>, form: "normal")
  ],
  table.hline(stroke: .5pt),
  table.cell(align: horizon + center)[*Congruent*],
  [],
  [
    - Guix #cite(<guixwebsite>, form: "normal")
    - Nix #cite(<nix>, form: "normal")
  ],
)

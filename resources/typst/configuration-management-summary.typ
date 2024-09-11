#import "../../src/thesis/imports/preamble.typ": *


#table(
  columns: (1fr, 1fr, 1fr),
  stroke: none,
  table.header(
    [],
    table.vline(stroke: 1pt),
    [#align(center)[Imperative]],
    table.vline(stroke: .5pt),
    [#align(center)[Declarative]],
    table.hline(stroke: 1pt),
  ),
  table.cell(align: horizon + center)[Divergent],
  [
    - Shell commands
  ],
  [
    - Shell scripts
    - Ansible
  ],
  table.hline(stroke: .5pt),
  table.cell(align: horizon + center, rowspan: 2)[Convergent],
  table.cell(colspan: 2)[
    - Docker
  ],
  table.hline(stroke: .5pt + luma(200), start: 1),
  [
    - Ansible
    - Chef
    - Shell scripts
  ],
  [
    - Puppet
    - Kubernetes
    - Terraform
  ],
  table.hline(stroke: .5pt),
  table.cell(align: horizon + center)[Congruent],
  [],
  [
    - Nix
    - Guix
  ],
)

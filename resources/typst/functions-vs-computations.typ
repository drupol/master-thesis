#import "../../src/thesis/imports/preamble.typ": *

#table(
  columns: (2fr, 3fr, 5fr),
  stroke: none,
  align: left + top,
  table.header(
    [],
    table.vline(stroke: .5pt),
    [*Theoretically*],
    table.vline(stroke: .5pt),
    [*Practically*],
    table.hline(stroke: .5pt),
  ),
  [*Function*],
  [$I -> R$],
  [
    $"eval"(F,I,emptyset) -> R$
  ],
  table.hline(stroke: .5pt),
  [*Computation*],
  [$I times E -> R$],
  [
    $"eval"(F,I,E) -> R$\

    Reproducible if and only if\
    $forall e_1,e_2 in E quad "eval"(F,I,e_1) = "eval"(F,I,e_2)$
  ],
)

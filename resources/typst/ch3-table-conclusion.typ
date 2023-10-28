#set text(
  size: .80em,
  hyphenate: true,
)
#set par(justify: true)
#set text()

#table(
  columns: 6,
  stroke: none,
  align: (right,) + (left,) * 2 + (center,) * 4,
  table.header(
    table.cell(rowspan: 2, align: horizon + center)[],
    table.vline(stroke: .5pt),
    table.cell(rowspan: 2, align: horizon + center)[Pro],
    table.vline(stroke: .5pt),
    table.cell(rowspan: 2, align: horizon + center)[Cons],
    table.vline(stroke: .5pt),
    table.cell(colspan: 3)[Reproducible\ within the same\ hardware architecture],
    [In space],
    table.vline(stroke: .5pt + black.lighten(75%)),
    [In time],
    table.vline(stroke: .5pt + black.lighten(75%)),
    [Environment],
    table.hline(stroke: .5pt),
  ),
  table.cell(align: horizon + left)[1. #link(<ch3-tool1>)[Bare compilation]],
  [
    - Full control over compilation
    - Direct understanding of dependencies inherited from host system
  ],
  [
    - Prone to #emph["it works on my machine"] issues
    - Lacks isolation and dependency management
  ],
  table.cell(align: horizon + center, text(size: 2em)[\u{00D7}]),
  table.cell(align: horizon + center, text(size: 2em)[\u{00D7}]),
  table.cell(align: horizon + center, text(size: 2em)[\u{00D7}]),
  table.hline(stroke: .5pt + black.lighten(75%)),
  table.cell(align: horizon + left)[2. #link(<ch3-tool2>)[Docker]],
  [
    - Better isolation and dependency management thanks to containerization
    - Isolation from host system
    - Popular solution, widely adopted
  ],
  [
    - Potential variability due to base images and package management
    - Additional layer of abstraction due to containerization
  ],
  table.cell(align: horizon + center, text(size: 2em)[\u{223C}]),
  table.cell(align: horizon + center, text(size: 2em)[\u{223C}]),
  table.cell(align: horizon + center, text(size: 2em)[\u{223C}]),
  table.hline(stroke: .5pt + black.lighten(75%)),
  table.cell(align: horizon + left)[3. #link(<ch3-tool3>)[Guix]],
  table.cell(align: left + horizon)[
    - Deterministic builds with explicit dependency specification
    - Functional package management
    - Immutable software environments
    - Isolation and environment reproducibility
    - No containerization overhead
  ],
  [
    - Steep learning curve
    - Paradigm shift from traditional package management systems required
    - Very limited package availability
    - Unfree packages are not officially allowed
  ],
  table.cell(align: horizon + center, rowspan: 2, text(size: 2em)[\u{2713}]),
  table.cell(align: horizon + center, rowspan: 2, text(size: 2em)[\u{2713}]),
  table.cell(align: horizon + center, rowspan: 2, text(size: 2em)[\u{2713}]),
  table.hline(stroke: .5pt + black.lighten(75%)),
  table.cell(align: horizon + left)[4. #link(<ch3-tool4>)[Nix]],
  table.cell(align: left + horizon)[
    - Deterministic builds with explicit dependency specification
    - Functional package management
    - Immutable software environments
    - Isolation and environment reproducibility
    - No containerization overhead
    - Vast repository of packages, unfree packages are authorized.
  ],
  [
    - Steep learning curve
    - Pradigm shift from traditional package management systems required
  ],
  table.footer(
    table.cell(
      align: right,
      colspan: 6,
      text(size: .7em)[
        Legend: \u{2713} = Supported, \u{223C} = Partially supported, \u{00D7} = Not supported
      ],
    ),
  ),
)

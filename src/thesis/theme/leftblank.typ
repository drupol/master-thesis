#import "common/metadata.typ": *

#let leftblank(
  weak: true,
) = {
  pagebreak(weak: weak)

  set align(center)

  v(80%)

  text(fill: black.lighten(75%))[
    This page is intentionally left blank.
  ]

  pagebreak(weak: true)
}

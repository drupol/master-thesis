#import "common/metadata.typ": *

#let abstract(title: "Abstract", body) = {
  pagebreak(weak: true)

  heading(level: 1, title, outlined: false)

  body
}

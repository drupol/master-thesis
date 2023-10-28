#import "common/metadata.typ": *

#let acknowledgement(title: "Acknowledgements", body) = {
  pagebreak(weak: true)

  heading(level: 1, title, outlined: false)

  body
}

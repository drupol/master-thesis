#import "common/metadata.typ": *

#let disclaimer(
  title: "",
  degree: "",
  author: "",
  submissionDate: none,
  signature: none,
) = {
  pagebreak(weak: true)

  v(80%)
  text("I confirm that this " + degree + "'s thesis is my own work and I have documented all sources and material used.")

  v(15mm)
  grid(
    columns: 2,
    gutter: 1fr,
    "Mons, " + submissionDate,
    {
      set align(right)
      author + signature
    },
  )
}

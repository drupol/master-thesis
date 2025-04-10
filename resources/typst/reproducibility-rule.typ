#{
  set text(font: "Virgil")
  image("../../resources/images/rules.svg", fit: "stretch")
  v(-1.5em)
  grid(
    columns: (1fr, 1fr, 1fr),
    {
      set align(left)
      "Not reproducible"
    },
    {
      set align(center)
      "Partially reproducible"
    },
    {
      set align(right)
      "Reproducible"
    },
  )
  v(2em)
}

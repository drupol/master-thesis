#{
  set text(
    font: "Virgil 3 YOFF",
    size: .9em,
  )
  box[
    #grid(
      columns: 1,
      rows: 4,
      gutter: 0pt,
      polygon(
        fill: blue.lighten(80%),
        stroke: blue,
        (0pt, 3.5cm),
        (70pt, 0cm),
        (140pt, 3.5cm),
      ),
      polygon(
        fill: blue.lighten(80%),
        stroke: blue,
        (0pt, 2cm),
        (40pt, 0pt),
        (180pt, 0pt),
        (220pt, 2cm),
      ),
      polygon(
        fill: blue.lighten(80%),
        stroke: blue,
        (0pt, 2cm),
        (40pt, 0pt),
        (260pt, 0pt),
        (300pt, 2cm),
      ),
      polygon(
        fill: blue.lighten(80%),
        stroke: blue,
        (0pt, 2cm),
        (40pt, 0pt),
        (340pt, 0pt),
        (380pt, 2cm),
      ),
    )

    // Right line
    #place(bottom + left)[
      #line(length: 320pt, angle: 55deg, start: (216pt, 0pt))
    ]

    // Left line
    #place(bottom + right)[
      #line(length: 320pt, angle: -55deg, start: (-400pt, 0pt))
    ]

    // Left arrow
    #place(top + left, dx: 161pt)[
      #rotate(35deg)[
        #polygon.regular(fill: black, size: 10pt, vertices: 3)
      ]
    ]

    // Text left
    #place(bottom + left, dx: 50pt, dy: -125pt)[
      #rotate(-55deg)[
        time
      ]
    ]

    // Right arrow
    #place(top + right, dx: -161pt)[
      #rotate(-35deg)[
        #polygon.regular(fill: black, size: 10pt, vertices: 3)
      ]
    ]

    // Text right
    #place(bottom + left, dx: 300pt, dy: -130pt)[
      #rotate(55deg)[
        effort
      ]
    ]

    #place(center, dy: -45pt)[
      Repeatability\

      Original researcher,\ machine and data
    ]

    #place(center, dy: -105pt)[
      Runnability\

      Original researcher and data\ other machine
    ]

    #place(center, dy: -160pt)[
      Reproducibility\

      Original data\ other researcher and machine
    ]

    #place(center, dy: -215pt)[
      Replicability\

      Other researcher,\
      machine and data
    ]
  ]
}

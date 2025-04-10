#import "../../src/thesis/imports/preamble.typ": *

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [
    #set align(bottom)
    #figure(
      {
        set text(font: "Virgil 3 YOFF")
        cetz.canvas({
          cetz.draw.set-style(axes: (shared-zero: false))

          plot.plot(
            size: (3, 3),
            axis-style: "school-book",
            y-label: [State],
            x-label: [Time],
            x-tick-step: none,
            y-tick-step: none,
            x-min: 0,
            x-max: 500,
            x-grid: true,
            y-min: 0,
            y-max: 500,
            {
              plot.add(
                ((75, 75), (450, 500)),
                mark: "o",
                mark-style: (stroke: blue, fill: white),
                mark-size: .1,
              )
              plot.add(
                ((75, 50), (450, 125)),
                mark: "o",
                style: (stroke: (paint: red, dash: "dashed")),
                mark-style: (stroke: red, fill: white),
                mark-size: .1,
              )
            },
          )
        })
      },
      caption: [Divergent],
    ) <divergent-config-management>
  ],
  [
    #set align(bottom)
    #figure(
      {
        set text(font: "Virgil 3 YOFF")
        cetz.canvas({
          cetz.draw.set-style(axes: (shared-zero: false))

          plot.plot(
            size: (3, 3),
            y-label: [State],
            x-label: [Time],
            axis-style: "school-book",
            legend-style: (
              default-position: "north",
              stroke: none,
            ),
            x-tick-step: none,
            y-tick-step: none,
            x-min: 0,
            x-max: 500,
            x-grid: true,
            y-min: 0,
            y-max: 500,
            {
              plot.add(
                ((75, 125), (450, 300)),
                style: (stroke: (paint: red, dash: "dashed")),
                mark-style: (stroke: red, fill: white),
                mark-size: .1,
                mark: "o",
                label: "Target",
              )
              plot.add(
                ((75, 500), (450, 325)),
                style: (
                  stroke: (paint: blue),
                  mark: (fill: blue, stroke: blue),
                ),
                mark-style: (stroke: blue, fill: white),
                mark-size: .1,
                mark: "o",
                label: "Actual",
              )
            },
          )
        })
      },
      caption: [Convergent],
    ) <convergent-config-management>
  ],
  [
    #set align(bottom)
    #figure(
      {
        set text(font: "Virgil 3 YOFF")
        cetz.canvas({
          cetz.draw.set-style(axes: (shared-zero: false))

          plot.plot(
            size: (3, 3),
            y-label: [State],
            x-label: [Time],
            axis-style: "school-book",
            x-tick-step: none,
            y-tick-step: none,
            x-min: 0,
            x-max: 500,
            x-grid: true,
            y-min: 0,
            y-max: 500,
            legend: "legend.inner-south-east",
            {
              plot.add(
                ((75, 75), (450, 300)),
                mark: "o",
                mark-style: (stroke: blue, fill: white),
                mark-size: .1,
              )
              plot.add(
                ((75, 50), (450, 275)),
                mark: "o",
                style: (stroke: (paint: red, dash: "dashed")),
                mark-style: (stroke: red, fill: white),
                mark-size: .1,
              )
            },
          )
        })
      },
      caption: [Congruent],
    ) <congruent-config-management>
  ],
)

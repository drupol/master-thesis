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
          import cetz.plot
          import cetz.draw: content

          plot.plot(
            size: (3.5, 3),
            y-label: [state],
            x-label: [Time],
            axis-style: "school-book",
            x-tick-step: none,
            y-tick-step: none,
            x-min: 0,
            x-max: 500,
            x-grid: true,
            y-min: 0,
            y-max: 500,
            legend: "legend.north",
            {
              plot.add(
                ((75, 75), (450, 300)),
                mark: "o",
              )
              plot.add(
                ((75, 50), (450, 125)),
                mark: "o",
                style: (stroke: (paint: red, dash: "dashed")),
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
          import cetz.plot
          import cetz.draw: *

          plot.plot(
            size: (3.5, 3),
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
            legend: "legend.north",
            {
              plot.add(
                ((75, 75), (450, 300)),
                style: (stroke: (paint: blue)),
                mark: "o",
                label: "actual",
              )
              plot.add(
                ((75, 500), (450, 325)),
                mark: "o",
                label: "target",
                style: (stroke: (paint: red, dash: "dashed")),
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
          import cetz.plot
          import cetz.draw: *

          plot.plot(
            size: (3.5, 3),
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
              )
              plot.add(
                ((75, 50), (450, 275)),
                mark: "o",
                style: (stroke: (paint: red, dash: "dashed")),
              )
            },
          )
        })
      },
      caption: [Congruent],
    ) <congruent-config-management>
  ],
)

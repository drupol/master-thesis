#import "./colors.typ": *

#let info-settings = (
  info: (
    prefix: none,
    icon: "circle-info",
    fill_color: umons-turquoise.lighten(90%),
    stroke_color: umons-turquoise,
  ),
  cite: (
    prefix: none,
    icon: "quote-left",
    fill_color: rgb("#ffffff"),
    stroke_color: black,
  ),
  definition: (
    prefix: [#underline(smallcaps[*Definition*])],
    icon: "highlighter-solid",
    fill_color: umons-faculty-sciences.lighten(90%),
    stroke_color: umons-faculty-sciences,
  ),
  question: (
    prefix: none,
    icon: "circle-question",
    fill_color: umons-yellow.lighten(90%),
    stroke_color: umons-yellow,
  ),
  important: (
    prefix: none,
    icon: "circle-exclamation",
    fill_color: rgb("#228B22").lighten(90%),
    stroke_color: rgb("#228B22").darken(20%),
  ),
  conclusion: (
    prefix: none,
    icon: "lightbulb-solid",
    fill_color: umons-red.lighten(90%),
    stroke_color: umons-red,
  ),
  good: (
    prefix: none,
    icon: "circle-check",
    fill_color: umons-grey.lighten(90%),
    stroke_color: umons-grey.darken(20%),
  ),
  note: (
    prefix: [ *Note:* ],
    icon: "note-sticky",
    fill_color: umons-grey.lighten(90%),
    stroke_color: umons-grey.darken(20%),
  ),
);

#let info-stroke(kind: "good") = info-settings.at(kind).stroke_color

#let info-image(kind: "info", ..args) = {
  let settings = info-settings.at(kind)
  image("solid/" + settings.icon + ".svg", ..args, alt: settings.icon)
}

#let info-box(
  body,
  settings: (:),
  kind: "info",
  radius: 5pt,
  footer: none,
  icon: true,
  ref: none,
) = {
  set par(
    leading: 0.55em,
    justify: true,
  )

  let settings = info-settings.at(kind) + settings
  let extra = if footer == none {
    none
  } else {
    v(.5em)
    h(1fr)
    text(size: .75em)[#footer]
  }

  set align(left)

  box(
    width: 0.8fr,
    fill: settings.fill_color,
    stroke: .5pt + settings.stroke_color,
    radius: radius,
    inset: 0pt,
  )[
    #let body = if kind == "cite" {
      quote(attribution: extra, quotes: false)[#emph(body)]
    } else {
      body
    }

    #let contents = if icon {
      (
        image(
          "../../../resources/images/" + settings.icon + ".svg",
          width: 32pt,
        ),
        (
          {
            settings.prefix
            body
            extra
          }
        ),
      )
    } else {
      (
        {
          settings.prefix
          body
          extra
        }
      )
    }
    #figure(
      kind: "info-box",
      supplement: [Info box],
      {
        set align(left)
        table(
          columns: if icon {
            (38pt, 1fr)
          } else {
            1
          },
          inset: 10pt,
          stroke: none,
          column-gutter: 10pt,
          ..contents,
        )
      },
    ) #{
      if ref != none {
        label(ref)
      } else {
        none
      }
    }
  ]
}

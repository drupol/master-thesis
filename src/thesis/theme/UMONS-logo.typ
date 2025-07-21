#import "./common/metadata.typ": *
#import "./colors.typ": *

#{
  set text(font: "Liberation Sans")
  set align(right)
  set par(leading: 6pt)
  {
    set text(weight: 300)
    upper[
      #text(fill: umons-grey)[#underline(
        offset: 4pt,
        stroke: umons-red,
      )[U]]#text(fill: umons-red)[mons]\
    ]
  }
  {
    set text(size: .35em, weight: 250)
    text(fill: umons-grey)[University of Mons]
  }
}

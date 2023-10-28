#import "./common/metadata.typ": *
#import "./colors.typ": *

#{
  set text(font: "Liberation Sans")
  set par(leading: 6pt)
  box[#image("./UMONS_FS-logo.svg", height: 60pt)]
  box[
    #v(.7em)
    #text(size: .3em, fill: umons-grey)[
      Faculty of\
      sciences
    ]
  ]
}

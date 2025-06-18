#import "infos.typ": *
#import "common/metadata.typ": *

#let definition(term: none, name: none, content) = {
  let kind = "Definition"
  let supplement = upper(kind.first()) + lower(kind.slice(1))
  let name = if name == none {
    "def-" + term
  } else {
    name
  }

  show figure.where(kind: "definition"): it => info-box(
    kind: "definition",
    settings: (prefix: [#smallcaps[#it.caption]]),
  )[
    #it.body
  ]
  show figure.caption.where(kind: "definition"): it => block(width: 100%, {
    it
  })

  [
    #figure(
      kind: "definition",
      supplement: [#supplement],
      caption: term,
      numbering: "1",
      content,
    ) #label(name)
  ]
}

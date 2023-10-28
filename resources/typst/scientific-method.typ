#import "../../src/thesis/imports/preamble.typ": *

#render(
  read("../../resources/graphviz/scientific-method.dot"),
  width: 100%,
  labels: (
    step0: [#text(font: "Virgil 3 YOFF", size: .95em)[Observation]],
    step1: [#text(font: "Virgil 3 YOFF", size: .95em)[Question]],
    step2: [#text(font: "Virgil 3 YOFF", size: .95em)[Hypothesis]],
    step3: [#text(font: "Virgil 3 YOFF", size: .95em)[Prediction]],
    step4: [#text(font: "Virgil 3 YOFF", size: .95em)[Testing]],
    step5: [#text(font: "Virgil 3 YOFF", size: .95em)[Analysis]],
    step6: [],
  ),
)

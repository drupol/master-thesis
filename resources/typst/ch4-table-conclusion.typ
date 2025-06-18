#set align(left)

#table(
  columns: (1fr, 1fr),
  stroke: none,
  [#align(center)[Pros]],
  table.vline(stroke: .5pt),
  [#align(center)[Cons]],
  table.hline(stroke: .5pt),
  [
    Facilitates collaboration and onboarding:

    Reproducibility enables easier collaboration among researchers, developers,
    as they can replicate and extend each other's work more efficiently.
  ],
  [
    Steep learning curve:

    Implementing reproducibility practices may require learning new tools and
    methodologies, which can be time-consuming and challenging.
  ],
  table.hline(stroke: .5pt),
  [
    Transparency and trust:

    By sharing the methods, data, and tools used in research and development,
    other collaborators can verify and build upon the work, fostering a culture
    of openness and collaboration.
  ],
  [
    Complexity:

    The process of making software reproducible can be complex, especially if it
    has not been setup from the beginning of the project.
  ],
  table.hline(stroke: .5pt),
  [
    Improves software quality:

    Reproducibility practices help in identifying and fixing bugs, improving the
    software's overall quality and robustness.
  ],
  [
    Proliferation of package managers:

    The existence of too many package managers that
    are built without reproducibility in mind can add another layer of complexity when trying to build software reproducibly.
  ],
  table.hline(stroke: .5pt),
  [
    Enhanced reliability and validity:

    Reproducible results provide confidence that findings are accurate and not
    due to random chance or specific initial conditions of a single experiment.
  ],
  [
    Factors limiting reproducibility:

    Factors such as proprietary software, licensing issues, and evolving
    hardware can pose challenges to achieving full reproducibility.
  ],
  table.hline(stroke: .5pt),
  [
    Security and integrity:

    Ensuring that software can be reliably rebuilt from its source helps in
    detecting unauthorized changes, enhancing security, and maintaining the
    integrity of the software supply chain.
  ],
  [
    Potential for misuse:

    Over-reliance on automated reproducibility tools can lead to complacency,
    where developers might not fully understand the underlying processes and
    methodologies.
  ],
  table.hline(stroke: .5pt),
  [
    Facilitates troubleshooting and debugging:

    Reproducible experiments serve as a clear benchmark for comparison,
    assisting teams in identifying discrepancies, tracing error origins, and
    incrementally enhancing model performance​.
  ],
  [
    Potential for stagnation:

    Emphasis on reproducibility might slow down innovation as developers might
    spend more time ensuring reproducibility rather than exploring new ideas and
    methodologies​.
  ],
)

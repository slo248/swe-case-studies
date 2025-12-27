#let title = "Software Engineer Case Studies"
#let author = "Nguyễn Hoàng Phúc"

/* Set metadata */
#set document(title: title, author: author)

/* Set up page numbering and continued page headers */
#set page(
  numbering: "1",
  header: context {
    if counter(page).get().first() > 1 [
      #set text(style: "italic")
      #title
      #h(1fr)
      #author
      #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
    ]
  },
  margin: (left: 2cm, right: 2cm, bottom: 2cm),
)

/* Add numbering and some color to code blocks */
#show raw.where(block: true): it => {
  block(width: 100% - 0.5em, radius: 0.3em, stroke: luma(50%), inset: 1em, fill: luma(98%))[
    #show raw.line: l => context {
      box(width: measure([#it.lines.last().count]).width, align(right, text(fill: luma(50%))[#l.number]))
      h(0.5em)
      l.body
    }
    #it
  ]
}

/* Make the title */
#align(
  center,
  {
    text(size: 18pt, weight: "bold")[#title \ ]
    text(size: 14pt, style: "italic")[#author \ ]
    box(line(length: 100%, stroke: 1pt))
  },
)

#set heading(numbering: "A.1.a.")
#show link: set text(fill: blue)
#show link: underline
#show heading.where(level: 1): set text(size: 14pt)
#show heading.where(level: 2): set text(size: 12pt, weight: "bold")
#show heading.where(level: 3): set text(size: 12pt)

#[
  #set text(size: 13pt)
  #outline(
    title: "Table of Contents",
    indent: auto,
  )
]

#pagebreak()
#include "sync2async/main.typ"

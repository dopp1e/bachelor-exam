#let IMAGE_BOX_MAX_WIDTH = 120pt
#let IMAGE_BOX_MAX_HEIGHT = 50pt

#let project(title: "", subtitle: none, school-logo: none, company-logo: none, authors: (), mentors: (), jury: (), branch: none, academic-year: none, polish: false, footer-text: "ENSIAS", supertitle: none, version: none, subject: none, body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(
    numbering: "1 / 1",
    number-align: center,
    footer: context {
      // Omit page number on the first page
      let page-number = counter(page).at(here()).at(0)
      if page-number > 1 {
        v(8pt)
        line(length: 100%, stroke: 0.5pt)
        v(-3pt)
        grid(
          columns: (1fr, 1fr, 1fr),
          align: (left, center, right),
          [#subject], [#counter(page).display("- 1 / 1 -", both: true)], [#academic-year],
        )
      }
    },
    header:  context {
      let page-number = counter(page).at(here()).at(0)
      if page-number > 1 {
        grid(
          columns: (1fr, 1fr),
          align: (left, right),
          [#footer-text], [#version],
        )
        v(-3pt)
        line(length: 100%, stroke: 0.5pt)
        v(8pt)
      }
    }
  )

  let dict = json("i18n/en.json")
  let lang = "en"
  if polish {
    dict = json("i18n/pl.json")
    lang = "pl"
  }

  set text(font: "Libertinus Serif", lang: lang, size: 13pt)
  set heading(numbering: "1.1")
  
  show heading: it => {
    if it.level == 1 and it.numbering != none {
      pagebreak()
      v(40pt)
      text(size: 30pt)[#dict.chapter #counter(heading).display() #linebreak() #it.body ]
      v(60pt)
    } else {
      v(5pt)
      [#it]
      v(12pt)
    }
  }

  block[
    #box(height: IMAGE_BOX_MAX_HEIGHT, width: IMAGE_BOX_MAX_WIDTH)[
      #align(left + horizon)[
        #company-logo
      ]
    ]
    #h(1fr)
    #box(height: IMAGE_BOX_MAX_HEIGHT, width: IMAGE_BOX_MAX_WIDTH)[
      #align(right + horizon)[
        #if school-logo == none {
          //image("images/ENSIAS.svg")
        } else {
          school-logo
        }
      ]
    ]
  ]
  
  // Title box  
  align(center + horizon)[
    #if subtitle != none {
      text(size: 14pt, tracking: 2pt)[
        #smallcaps[
          #subtitle
        ]
      ]
    }
    #line(length: 100%, stroke: 0.5pt)
    #text(size: 20pt, weight: "bold")[#title]
    #line(length: 100%, stroke: 0.5pt)
    #if supertitle != none {
      text(size: 14pt, tracking: 2pt)[
        #smallcaps[
          #supertitle
        ]
      ]
    }
  ]

  // Credits
  box()
  h(1fr)
  grid(
    columns: (auto, 1fr, auto),
    [
      // Authors
      #if authors.len() > 0 {
        [
          #text(weight: "bold")[
            #if authors.len() > 1 {
              dict.author_plural
            } else {
              dict.author
            }
            #linebreak()
          ]
          #for author in authors {
            [#author #linebreak()]
          }
        ]
      }

      #text(weight: "bold")[
        Liczba stron
        #linebreak()
        #context[
          #counter(page).display("1/1", both: true).split("/").at(-1)
        ]
      ]
      
    ],
    [
      // Mentor
      #if mentors != none and mentors.len() > 0 {
        align(right)[
          #text(weight: "bold")[
            #if mentors.len() > 1 {
              dict.mentor_plural
            } else {
              dict.mentor
            }
            #linebreak()
          ]
          #for mentor in mentors {
            mentor
            linebreak()
          }
        ]
      }
      // Jury
      #if jury != none and jury.len() > 0 {
        align(right)[
          *#dict.jury* #linebreak()
          #for prof in jury {
            [#prof #linebreak()]
          }
        ]
      }
    ]
  )

  align(center + bottom)[
    #if version != none and version.len() > 0 {
        align(center)[
          *#dict.version* #linebreak()
          #version
        ]
      }
    #if branch != none {
      branch
      linebreak()
    }
    #if academic-year != none {
      [#dict.academic_year: #academic-year]
    }
  ]
  
  pagebreak()

  // Table of contents.
  outline(depth: 2)

  // pagebreak()

  // // Table of figures.
  // outline(
  //   title: dict.figures_table,
  //   target: figure.where(kind: image)
  // )

  // pagebreak()

  // outline(
  //   title: dict.tables_table,
  //   target: figure.where(kind: table)
  // )

  pagebreak()

  set par(
    justify: true
  )


  
  // Main body.
  body
}

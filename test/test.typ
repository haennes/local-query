#import "lib.typ": *

#let all = [
  - #clabel("abc")[test
      - acontent
      - #clabel("def")[bcontent
          - ccontent
        ]
    ]


]

#clabel("abc")[bcontent]


all: #repr(all)

queried: #table(query_label("abc", all))


clearing
#repr(clear_labels(all))
#clear_labels(all)

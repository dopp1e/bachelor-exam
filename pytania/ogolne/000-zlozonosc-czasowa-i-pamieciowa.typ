#import "../../res/question.typ": question

#show: question.with(
  q: "Złożoność czasowa i pamięciowa algorytmów."
)

Złożoności (czasowe i pamięciowe) mają na celu w przybliżeniu określić w jaki sposób zwiększenie wielkości danych na wejściu pewnego algorytmu wpłyną na zwiększenie czasu oraz przestrzeni pamięciowej niezbędnej do wykonania owego algorytmu. Opisuje się je za pomocą O (notacji wielkiego O, _big O notation_), w której to notacji znajduje się pewna funkcja opisująca konkretną złożoność, np. O(n#super[2]), O(nlogn), O(1).

Kluczowy jest fakt, że owy opis jest zazwyczaj asymptotyczny, ponieważ "małe" zmiany w wielkościach (w zależności od algorytmu od kilkunastu do potencjalnie nawet kilku milionów punktów danych) nie pozwalają na wychwycenie danej złożoności.

Dodatkowo dla bardziej zaawansowanych algorytmów najważniejsze jest wzięcie pod uwagę "najsłabszego ogniwa" - jeśli algorytm składa się, na przykład, z kilku kroków o złożoności O(1) oraz jednego o złożoności O(n#super[3]), to finalnie brany pod uwagę jest najgorszy przypadek, tj. O(n#super[3]).
#import "../../res/question.typ": question

#show: question.with(
  q: "Rodzaje operacji na plikach graficznych oraz ich typowe zastosowanie."
)

/ Operacje na plikach graficznych: Rodzaje przetwarzania obrazu, modyfikacji jego zawartości, które pozwalają na dostosowanie jego wyglądu. Operacje na plikach graficznych są również wykorzystywane w celu przekształcania obrazu w sposób użyteczny w takich dziedzinach jak np uczenie maszynowe czy analiza obrazu.

#grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      Wyróżniamy rodzaje operacji:
      - punktowe,
      - filtry cyfrowe,
      - geometryczne,
      - morfologiczne.
    ],
    image("../../obrazki/rodzaje-przeksztalcen-obrazu.webp", width: 11.5cm)
)

=== Operacje punktowe

Operacje punktowe to są po prostu operacje które można wykonać "w miejscu" w takim sensie nie uwzględniają otoczenia (sąsiadujących pikseli).
Polega to na modyfikowaniu poszczególnych punktów obrazu, pojedynczych pikseli.
Operacje punktowe służą głównie do korekcji jasności oraz kontrastu obrazu.
Do operacji punktowych zaliczamy:

#{
  set text(hyphenate: false, size: 9pt)
  set par(justify: false)
  table(
    columns: (1fr, 2fr, 2fr),
    align: (col, row) => (
      center + horizon
    ),
    stroke: (x, y) => (
      bottom: 0.5pt + gray.lighten(50%),
      top: if y == 0 { 1pt + black } else { 0pt }
    ),
    fill: (col, row) => (
      if row == 0 { rgb("E0E0E0") } // Darker header
      else if calc.even(row) { rgb("F5F5F5") } // Zebra striping
      else { white }
    ),
  
    table.header(
      [*Rodzaj Operacji*], [*Wzór*], [*Efekt*]
    ),

    [Zmiana kontrastu], 
    [$J_w(x,y) = a*J_w(x,y)$],
    [Zwiększenie kontrastu obrazu poprzez przemnożenie jasności przez współczynnik $a$.],

    [Zmiana jasności], 
    [$J_w(x,y) = J_w(x,y) + b$],
    [Zmiana jasności obrazu przez sumę jasności z wartością $b$.],

    [Negatyw], 
    [$J_w(x,y) = J_{max} - J_w(x,y)$],
    [Odwrócenie wartości piksela.],

    [Potęgowanie], 
    [$J_w(x,y) =255 * (frac(J(x,y), J_{max}))^α$], 
    [Zwiększenie kontrastu w jasnych obszarach], 

    [Pierwiastkowanie],
    [$J_w(x,y) = J(x,y,)^α$],
    [Zwiększenie kontrastu w ciemnych obszarach],

    [Logarytmowanie], 
    [$J_w(x,y) = log(1+J(x,y))$], 
    [Zwiększenie intensywności pikseli w sposób nieliniowy. Zwiększa kontrast w ciemnych miejscach a w jasnych - nie.],
  )
}

=== Filtry cyfrowe

Filtry cyfrowe należą do kategorii operacji przestrzennych, czyli takich które korzystają z informacji pikselów sąsiadujących punktu, który będzie modyfikowany.
Filtry cyfrowe mogą być stosowane do:
- stłumienia obrazu,
- wygładzenia, rozmazania obrazu,
- wyostrzenia obrazu,
- wykrywania krawędzi.

*Liniowe*

Operacja filtracji odbywa się w opraciu o liniową kombinację pewnych pikseli obrazu źródłowego.

Do kategorii filtrów liniowych zaliczamy filtry konwolucyjne, czyli takie które wykorzystują matematyczną funkcję do przetworzenia obrazu poprzez nałożenie “jądra konwolucyjnego” na obraz.
W przypadku filtrów niżej opisanych tym jądrem jest macierz wag, a funkcją jest liniowa kombinacja wartości pikseli i odpowiadające im wagi:
- *Dolnoprzepustowe* - służą do tłumienia szybkozmiennych składowych obrazu.
  Jest to filtr który usuwa wysokie częstotliwości (czyli nagłe zmiany jasności), co prowadzi do wygładzania obrazu. Można go zastosować do:
  - usuwanie szumu i zakłóceń,
  - rozmazywania i wygładzania.
  Przykłady filtrów dolnoprzepustowych:
  - filtr uśredniający:
    #grid(
      columns: (auto, auto),
      gutter: 1em,
      align: (col, row) => (
        center + horizon
      ),
      image("../../obrazki/filtr-dolnoprzepustowy-1.webp", width: 50%),
      image("../../obrazki/filtr-dolnoprzepustowy-2.webp", width: 50%),
      image("../../obrazki/filtr-dolnoprzepustowy-3.webp", width: 100%),
      image("../../obrazki/filtr-dolnoprzepustowy-4.webp", width: 100%)
    )
  - filtr z rozkładem Gaussa:
    #grid(
      columns: (auto, auto),
      gutter: 1em,
      align: (col, row) => (
        center + horizon
      ),
      image("../../obrazki/filtr-dolnoprzepustowy-5.webp", width: 100%),
      image("../../obrazki/filtr-dolnoprzepustowy-6.webp", width: 100%),
    )
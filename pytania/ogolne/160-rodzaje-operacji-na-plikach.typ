#import "@preview/gentle-clues:1.2.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": plot, chart
#import "@preview/showybox:2.0.4": showybox
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
- *Górnoprzepustowe* - służą do podkreślenia elementów które mają szybkie zmiany jasności poprzez wzmocnienie wysokich częstotliwości.
  W wyniku użycia filtra górnoprzepustowego prawie wszystkie punkty należące do tła lub wewnętrznych części obiektów zostaną usunięte.
  Natomiast punkty należące do krawędzi i granic pomiędzy obiektami i tłem zostaną wzmocnione.
  Filtry te służą do:
  - wzmocnienia szczegółów,
  - zwiększenia ostrości obrazu,
  - wykrywania krawędzi,
  Ujemnym skutkiem jest wzmocnienie szumu.
  Przykłady filtrów górnoprzepustowych to:
  - operator Prewitta:
  #figure(
    image("../../obrazki/operator-prewitta.webp", width: 50%)
  )
  - operator Sobela:
  #grid(
    columns: (auto, auto),
    gutter: 1em,
    align: (col, row) => (
      center + horizon
    ),
    image("../../obrazki/operator-sobela-2.webp", width: 100%),
    image("../../obrazki/operator-sobela-3.webp", width: 75%)
  )
  #figure(
    image("../../obrazki/operator-sobela-1.webp", width: 50%)
  )
  Wyostrzanie obrazu polega na wygładzeniu obrazu za pomocą filtru dolnoprzepustowego, wykryciu krawędzi w wygładzonym obrazie za pomocą filtru górnoprzepustowego, a następnie nałożeniu wyniku wykrywania krawędzi na oryginalny obraz w celu podkreślenia szczegółów. 
  #grid(
    columns: (auto, auto),
    gutter: 1em,
    align: (col, row) => (
      center + horizon
    ),
    image("../../obrazki/wyostrzanie-1.webp", width: 100%),
    image("../../obrazki/wyostrzanie-2.webp", width: 100%)
  )

*Nieliniowe*

W tej kategorii są również stosowane maski, aczkolwiek nie jest wykorzystywana funkcja matematyczna polegająca na kombinacji liniowej wag i wartości pikseli.
Wyróżniamy filtry:
- *Medianowe* - bierzemy wszystkie piksele należące do maski i wartość piksela jest równa medianie w posortowanym ciągu pikseli.
  Najlepiej się sprawdza w usuwaniu szumu typu sól i pieprz.
- *Filtry minimalne* - zastępujący wartość piskela minimalną wartością w masce.
- *Filtry maksymalne* - analogicznie jak wyżej.
- *Logiczne* - wykorzystujące operacje logiczne na wartościach pikseli w masce.

=== Operacje geometryczne

Zniekształcenia geometryczne mogą powstać w wyniku perspektywy, optyki obiektu lub ruchu aparatu.
Przekształcenia geometryczne opisane niżej mogą być stosowane do symulacji lub korekcji tych zniekształceń.
Trzeba też pamiętać, że przekształcenia geometryczne tego typu mają również zastosowanie w wizji komputerowej, m.in. wykorzystywanej do nauki sztucznej inteligencji.

#info[
*Geometryczne przekształcenia* obrazu to operacje, które zmieniają *położenie*, *rozmiar*, *kształt* lub *orientację* pikseli obrazu na podstawie określonych reguł matematycznych.
Zasadniczo te operacje polegają na obliczeniach dla konkrentego punktu obrazu poprzez nałożenie jakiejś funkcji transformującej T, którą można przedstawić w postaci macierzy.
$ mat(x_2; y_2) = T mat(x_1; y_1) $
$ mat(x_2; y_2) = mat(a_11, a_12; a_21, a_22) mat(x_1; y_1)   $
]

*Skalowanie*

*Skalowanie obrazu* to operacja polegająca na przemnożeniu koordynatów każdego punktu o dany współczynnik.
Tutaj również możemy to przedstawić tą operację za pomocą macierzy 2x2 w postaci:

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (col, row) => (
    center + horizon
  ),
  $ x_2 = a x_1$,
  $ y_2 = b y_1$,
)

$ mat(x_2; y_2) = S mat(x_1;y_1) = mat(a, 0; 0, b) mat(x_1; y_1) $

Jeśli współczynniki $a$ i $b$ są równe, obraz będzie odpowiednio powiększany lub zmniejszany równomiernie, natomiast jeśli są różne, obraz będzie rozciągany wzdłuż osi x lub y.

#info[
  Istotnym elementem skalowania jest fakt, że w swojej domyślnej formie pozwala ono jedynie na manipulowanie "odstępem" pomiędzy pikselami.
  W przypadku skalowania w górę (powiększania) pojawiają się "puste" przestrzenie pomiędzy pikselami, a w przypadku zmniejszania - utrata informacji o pikselach.

  Z tego tytułu stosuje się interpolację, która pozwala na wypełnienie pustych przestrzeni w przypadku powiększania, lub uśrednienie pikseli w przypadku zmniejszania.
  Do metod interpolacji należą algorytmy najbliższego sąsiada, interpolacji liniowej, czy wielomianowej.
  #figure(
    image("../../obrazki/skalowanie.webp", width: 60%)
  )
]

*Rotacja*

#let drawing-green = rgb("#15e73b")
#let drawing-red = rgb("#e73a17")
#let drawing-blue = rgb("#19a1e5")

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (col, row) => (
    center + horizon
  ),
  cetz.canvas({
    import cetz.draw: *

    set-style(mark: (end: ">", fill: drawing-green, stroke: drawing-green))
    line((0, 0), (0, 3), stroke: drawing-green)
    set-style(mark: (end: ">", fill: drawing-red, stroke: drawing-red))
    line((0, 0), (6, 0), stroke: drawing-red)
    
    set-style(stroke: (dash: "dashed", paint: black), mark: none)
    line((0, 1.5), (4, 1.5))
    line((4, 0), (4, 1.5))

    set-style(stroke: (dash: "solid", paint: drawing-blue))
    circle((4, 1.5), radius: (0.1), fill: drawing-blue)
    line((0, 0), (4, 1.5), stroke: drawing-blue)

    set-style(stroke: (dash: "solid", paint: black), mark: none)
    arc((1, 0), start: 0deg, stop: 20deg, radius: (1))

    content((-0.3, 3), [$y$])
    content((6, -0.3), [$x$])

    content((1.2, 0.25), [$phi$])
    content((-0.3, 1.5), [$y_1$])
    content((4, -0.3), [$x_1$])
    content((2, 1), [$r$])
    content((4.35, 1.7), [$P_1$])
  }),
  [
    $ P_1 = mat(x_1; y_1) $
    #grid(
      columns: (1fr, 1fr),
      gutter: 1em,
      align: (col, row) => (
        center + horizon
      ),
      $ x_1 = r cos(phi) $,
      $ y_1 = r sin(phi) $
    )
  ],
)


#block(breakable:false)[
  Przesunięcie tego punktu przedstawia równanie:
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (col, row) => (
    center + horizon
  ),
  cetz.canvas({
    import cetz.draw: *

    set-style(mark: (end: ">", fill: drawing-green, stroke: drawing-green))
    line((0, 0), (0, 6), stroke: drawing-green)
    set-style(mark: (end: ">", fill: drawing-red, stroke: drawing-red))
    line((0, 0), (6, 0), stroke: drawing-red)
    
    set-style(stroke: (dash: "dashed", paint: black), mark: none)
    line((0, 1.5), (4, 1.5))
    line((4, 0), (4, 1.5))
    line((0, 4), (1.5, 4))
    line((1.5, 0), (1.5, 4))

    set-style(stroke: (dash: "solid", paint: drawing-blue))
    circle((4, 1.5), radius: (0.1), fill: drawing-blue)
    line((0, 0), (4, 1.5), stroke: drawing-blue)
    circle((1.5, 4), radius: (0.1), fill: drawing-blue)
    line((0, 0), (1.5, 4), stroke: drawing-blue)

    set-style(stroke: (dash: "solid", paint: black), mark: none)
    arc((1, 0), start: 0deg, stop: 20deg, radius: (1))
    arc((1, 0.389), start: 20deg, stop: 71deg, radius: (1))

    content((-0.3, 6), [$y$])
    content((6, -0.3), [$x$])

    content((1.2, 0.25), [$phi$])
    content((0.9, 1), [$theta$])
    content((-0.3, 1.5), [$y_1$])
    content((4, -0.3), [$x_1$])
    content((2, 1), [$r$])
    content((0.6, 2.2), [$r$])
    content((4.35, 1.7), [$P_1$])
    content((-0.3, 4), [$y_2$])
    content((1.65, -0.3), [$x_2$])
    content((1.85, 4.2), [$P_2$])

  }),
  [
    #showybox[
      $ P_1 = mat(x_1; y_1) $
      #grid(
        columns: (1fr, 1fr),
        gutter: 1em,
        align: (col, row) => (
          center + horizon
        ),
        $ x_1 = r cos(phi) $,
        $ y_1 = r sin(phi) $
      )
      
    ]
    #showybox[
      $ x_2 = r cos(phi + theta) $
      $ x_2 = r cos(phi) cos(theta) - r sin(phi) sin(theta) $
      $ x_2 = x_1 cos(theta) - y_1 sin(theta) $
    ]
    #showybox[
      $ y_2 = r sin(phi + theta) $
      $ y_2 = r cos(phi) sin(theta) + r sin(phi) cos(theta) $
      $ y_2 = x_1 sin(theta) + y_1 cos(theta) $
    ]
  ],
)
]

#info[
  Podobnie jak w przypadku skalowania, rotacja może prowadzić do utraty informacji o pikselach lub powstawania pustych przestrzeni.

  #figure(
    image("../../obrazki/rotacja.webp", width: 60%)
  )
]

*Przechylenie (skew, shear)*

Operacja która zmienia obraz prostokątny w równoległobok.
Przechylenie można wykonać zarówno wzdłuż osi $x$ oraz wzdłuż osi $y$.
Wystarczy jedynie przełożyć współczynnik $m$.

$ x_2 = x_1 + m_x y_1 $
$ y_2 = y_1 + m_y x_1 $

$ mat(x_2; y_2) = "Sh"mat(x_1; y_1) = mat(1, m_x; m_y, 1) mat(x_1; y_1) $

*Odbicie obrazu*

Odbicie obrazu to operacja która tworzy lustrzane odbicie obrazu względem określonej osi (pionowej lub poziomej).
Można to przedstawić za pomocą macierzy:

- Odbicie względem osi $x$:
  $ mat(x_2; y_2) = mat(1, 0; 0, -1) mat(x_1; y_1) $
- Odbicie względem osi $y$:
  $ mat(x_2; y_2) = mat(-1, 0; 0, 1) mat(x_1; y_1) $

*Przesunięcie*

Przesunięcie to po prostu operacja przesunięcia każdego piksela o wektor o wymiarach ($t_x$, $t_y$).
Przesunięcie o wektor zapisujemy w ten sposób:

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (col, row) => (
    center + horizon
  ),
  $ x_2 = x_1 + t_x $,
  $ y_2 = y_1 + t_y $
)

=== Operacje Morfologiczne

*Dylatacja*

Jest to operacja rozszerzająca obiekt. 
Jest zbiorem punktów wszystkich możliwych wektorowych par dodawań elementów zbioru A i B.

#figure(
  image("../../obrazki/dylatacja.webp")
)

#block(breakable:false)[
*Erozja*

Jest to operacja zwęższająca obiekt. Jest to zbiór wszystkich punktów a takich że a przesunięte o b jest zawarte w A.

#figure(
  image("../../obrazki/erozja-1.webp", width: 80%)
)

#figure(
  image("../../obrazki/erozja-2.webp", width: 80%)
)
]

#memo(title: "Ważne!")[
  *Dylatacja i erozja są operacjami nieodwracalnymi!*
]

*Otwarcie*

Jest to operacja polegająca na wykonaniu erozji a następnie dylatacji.

Operacja otwarcia powoduje:
- usunięcie drobnych szczegółów,
- rozłączenie obiektów połączonych przewężeniami,
- wygładzenie konturów poprzez usuwanie nitek.

*Zamknięcie*

Jest to operacja polegająca na wykonaniu dylatacji a następnie erozji.

Operacja Zakmnięcia powoduje:
- wypełnienie małych dziur i wypełnienie linii brzegowej,
- łączenie blisko położonych obiektów.

#figure(
  image("../../obrazki/otwarcie-zamkniecie.webp", width: 80%)
)
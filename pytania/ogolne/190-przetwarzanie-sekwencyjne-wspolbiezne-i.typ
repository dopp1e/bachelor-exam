#import "@preview/gentle-clues:1.2.0": *
#import "../../res/question.typ": question

#show: question.with(
  q: "Przetwarzanie sekwencyjne, współbieżne i równoległe."
)

Mowa tu zarówno o procesach i wątkach, oba mogą być przetwarzane zarówno współbieżnie i równolegle. Należy się skupić na pewnym abstrakcyjnym zadaniu.

=== Przetwarzanie sekwencyjne

Przetwarzanie sekwencyjne to wykonywanie operacji jedna po drugiej, w określonej kolejności, gdzie każdy krok musi zostać ukończony zanim rozpocznie się kolejny.

Aspekty przetwarzania sekwencyjnego:
- W danym momencie jest wykonywane tylko jedno zadanie,
- Wykorzystywane w zadaniach gdzie kroki wykonania są od siebie zależne.
    
*Zalety:*
- Łatwa implementacja i debugowanie,
- Brak ryzyka wyścigu między wątkami (race conditions).

*Wady:*
- (Relatywnie) niska wydajność w porównaniu z przetwarzaniem współbieżnym i równoległym (przy założeniu że zadanie może się skalować),
- Niewykorzystywanie pełnego potencjału wielordzeniowych i wielowątkowych procesorów.

=== Przetwarzanie współbieżne

Jest to przetwarzanie w którym może być robione kilka zadań jednocześnie w taki sposób że są one wykonywane naprzemiennie.
Jednostka zajmująca się zadaniem jest w stanie dowolnie zaczynać, przerywać, wznawiać, oraz kończyć części zadania w zależności od potrzeby czy możliwości.
Współdzielonym zasobem jest czas, w kontekście programowym nazywanym *czasem pracy procesora*.

Aspekty przetwarzania współbieżnego:
- Procesor przełącza się między zadaniami sprawiając wrażenie że zadania są wykonywane jednocześnie,
- Przetwarzanie współbieżne jest stosowane w aplikacjach wykonujących wiele zadań równocześnie, oraz w rdzeniach procesorów (w dzisiejszych czasach również w wielordzeniowych procesorach),
- Kluczowym aspektem implementacji jest zapewnienie synchronizacji oraz zapobieganiu wyścigu wątków.

*Zalety:*
- Usprawnienie wykonywania wielu zadań współdzielących zasoby,
- Poprawienie responsywnosci aplikacji (aplikacja nie zamraża się podczas obliczeń).

*Wady:*
- Nie zwiększa szybkości wykonywania jednego zadania,
- Wymaga synchronizacji między wątkami,
- Wprowadza wyścigi wątków oraz niebezpieczeństwo *zakleszczenia*.

=== Przetwarzanie równoległe

Przetwarzanie równoległe polega na tym że wiele zadań jest wykonywanych równocześnie.

Aspekty przetwarzania równoległego:
- Równoległość wymaga odpowiedniego zarządzania zasobami aby uniknąć problemów z synchronizacją,
- Może być użyte w:
    - aplikacjach obliczeniowych (jak symulacje, uczenie maszynowe),
    - przetwarzaniu dużych zbiorów danych w bazach,
    - grach komputerowych (obsługa fizyki i renderowania grafiki w osobnych procesach).

*Zalety:*
- Zwiększa wydajność przetwarzania zadań intensywnych obliczeniowo,
- W pełni wykorzystuje potencjał wielu rdzeni w procesorze,
- Umożliwia skalowanie aplikacji na klaster komputerów.

*Wady:*

- Trudniejsze w implementacji oraz w debugowaniu (prześledzenie pracy wielu równoległych procesów jest co najmniej trudne, potencjalnie niemożliwe),
- O wiele trudniejsza komunikacja, wymaga stosowania mechanizmów IPC (interprocess communication), takich jak kolejki, gniazda, itp..

#{
  set text(hyphenate: false, size: 9pt)
  set par(justify: false)
  table(
    columns: (auto, 1fr, 1fr, 1fr),
    align: (col, row) => (
      if col == 0 { center + horizon } else { left + top }
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
      [*Cecha*], [*Przetwarzanie Sekwencyjne*], [*Przetwarzanie Współbieżne*], [*Przetwarzanie Równoległe*]
    ),

    [*Wykonywanie \ zadań*], 
    [Jedno zadanie w danym czasie, musi zostać skończone przed przejściem dalej.], 
    [Kilka zadań przetwarzanych naprzemiennie.], 
    [Kilka zadań przetwarzanych równocześnie.],

    [*Wykonywanie \ na wielu rdzeniach*], 
    // [Niemożliwe, wszystko dzieje się na jednym rdzeniu.], 
    // [Niemożliwe, wiele zadań jest realizowanych na jednym rdzeniu.], 
    // [Możliwe, wiele zadań może być przetwarzane na różnych rdzeniach / procesorach.],
    [Nie], 
    [Nie], 
    [Tak],

    [*Złożoność \ implementacji*], 
    [Niska.], 
    [Średnia.], 
    [Wysoka.],

    [*Zastosowanie*], 
    [Proste aplikacje.], 
    [Aplikacje wielowątkowe.], 
    [Obliczenia wymagające dużej wydajności.],

    [*Przykład*], 
    [Skrypt w pythonie.], 
    [Aplikacja z interfejsem.], 
    [Uczenie maszynowe, gry komputerowe.],
  )
}

=== Procesy vs wątki

#memo(title: "Ważne!")[
  Zarówno procesy jak i wątki mogą być wykonywane współbieżnie i równolegle!
]

*Proces:*
- Jest instancją programu działający w systemie operacyjnym,
- Każdy proces ma własną przestrzeń adresową, nie współdzieli pamięci z innymi procesami,
- Procesy mogą się komunikować przy użyciu mechanizmów IPC,
- Może tworzyć inne procesy, które nazywają się wtedy child-procesami,
- Jest zasobożerne ze względu na to że każdy proces ma przypisane środowisko wykonawcze,
- Proces może tworzyć także wątki.

*Wątek:*
- Jest elementem procesu który może być wykonywany współbieżnie w obrębie procesu,
- Wątki w ramach jednego procesu współdzielą tę samą przestrzeń adresową co pozwala na łatwe współdzielenie danych i komunikację.

/ Zakleszczenie: Sytuacja w której dwa procesy lub wątki czekają na siebie nawzajem aby zwolnić zasoby czy skończyć część pewnego zadania, przez co oba nie mogą kontynuować działania.
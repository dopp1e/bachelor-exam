#import "@preview/gentle-clues:1.2.0": *
#import "../../res/question.typ": question

#show: question.with(
  q: "Zasady modelowania dla konstrukcji relacyjnych baz danych.",
)

/ Baza danych: zbiór powiązanych logicznie ze sobą danych zorganizowany zgodnie z określonym modelem danych.
  Wybrany model określa logiczne reguły konstrukcji tej bazy i jest jednym z poziomów architektury systemu baz danych.
  #figure(
    image("../../obrazki/dbms.webp", width: 80%),
  )
  - Poziom zewnętrzny (Użytkownika) - Zbiór widoków, czyli fragmentów bazy danych uzyskanych w wyniku zapytania.
  - *Poziom logiczny (modelu danych)* - Poziom, w którym znajduje się konceptualny opis bazy danych który definiuje jej zawartość, formę i związki między danymi.
  - Poziom wewnętrzny (fizyczny) - Fizyczna reprezentacja w postaci plików dyskowych i algorytmów dostępu do nich.

Podział na poziomy architektury pozwala na zapewnienie niezależności programu od danych -  logika programu nie zależy od struktur danych i metod dostępu.
Niezależność ułatwia na skalowalność fizyczną bazy (np. poprzez zwiększenie liczby czy rozmiarów dysków).

Relacyjne bazy danych to model który opiera się na relacjach i związkach między nimi.

*Relacja* to dowolny podzbiór iloczynu kartezjańskiego skończonej liczby dziedzin prostych. Dziedzina prosta to zbiór danych atomowych (niezłożonych).

#info(title: "Matematycznie")[
  Mamy dziedziny proste:
  - $D_1$ = zbiór liczb {1, 2},
  - $D_2$ = zbiór słów {Tak, Nie},
  - $D_3$ = zbiór dat {21.12, 24.12}.

  Z których tworzymy relację:
  $ R_1 ⊆ D_1 times D_2 times D_3 = {(1, "Tak", 21.12), (2, "Nie", 24.12)} $

  Tę relację możemy przedstawić w formie tabeli:
  #block(breakable: false, width: 100%)[
    #{
      set text(hyphenate: false, size: 9pt)
      set par(justify: false)
      set align(center)
      table(
        columns: (2cm, 2cm, 2cm),
        align: (col, row) => (
          center + horizon
        ),
        stroke: (x, y) => (
          bottom: 0.5pt + gray.lighten(50%),
          top: if y == 0 { 1pt + black } else { 0pt },
        ),
        fill: (col, row) => (
          if row == 0 { rgb("E0E0E0") } // Darker header
          else if calc.even(row) { rgb("F5F5F5") } // Zebra striping
          else { white }
        ),

        table.header([*$D_1$*], [*$D_2$*], [*$D_3$*]),

        [1], [Tak], [21.12],
        [2], [Nie], [24.12],
      )
    }
  ]
]

Relacja to inaczej zbiór *encji* (jednoznacznie odróżnialnych od siebie obiektów).
Każda relacja może być przedstawiona za pomocą tabeli, ale takowa tabela służy jedynie do wizualizacji relacji, a nie jest jej implementacją.
Należy również pamiętać że relacja jest *zbiorem* encji, co narzuca właściwości:
- nie ma dwóch identycznych encji,
- nie ma kolejności encji (zbiór nie można posortować rosnąco).

Encja w zbiorze encji jest rozróżnialna przy użyciu atrybutów, które muszą być atomowe (zawierać jedną informację a nie zbiór), gdzie przez atrybuty rozumiemy właściwości encji, jakieś informacje.
Np. dla zbioru encji Człowiek atrybutem może być imię czy nazwisko.

Każda relacja musi mieć zdefiniowany *Klucz* - podzbiór atrybutów, które jednoznacznie wskazują na daną encję.
Wyróżniamy rodzaje kluczy:
- *Klucz główny* - klucz jednoznacznie wskazujący na encję, wybrany z kluczy kandydujących,
- *Klucz kandydujący* - atrybut należący do zbioru klucza,
- *Klucz biznesowy* - klucz który jednoznacznie identyfikuje encje także w rzeczywistości (np. PESEL),
- *Klucz surogatowy* - abstrakcyjny klucz, automatycznie generowany identyfikator,
- *Klucz obcy* - klucz identyfikujący relację w której encja jest w związku.

#memo(title: "Ważne!")[
  Klucz główny musi spełniać następujące właściwości:
  - *Unikatowość* - zbiór atrybutów składających się na klucz musi zapewnić że nie pojawi się identyczna kombinacja,
  - *Minimalność* - dla złożonych kluczy, atrybuty muszą być tak dobrane że usunięcie jednego powoduje niejednoznaczne określenie encji.
]

Między relacjami w bazie danych mogą zachodzić związki (relationships).
Jest to zbiór krotek takich, że encje z jednego zbioru są połączone jakąś zależnością z encją drugiego zbioru.

// #info(title: "Formalnie")[
// Związek między zbiorami encji $E_1, E_2, … , E_n$ to zbiór n-elementowych krotek ($e_1, e_2, … , e_n$) takich że e1∈ E1, e2 ∈ E2, … , en ∈ En.
// ]
// Zacząłem to przepisywać, ale mam wrażenie że raczej nikt tego nie spamięta

W kontekście baz danych związki są realizowane przy użyciu *kluczy obcych*.

Rodzaje związków:
- 1:1 (jeden do jeden) - klucz obcy jest po dowolnej stronie,
  #figure(
    image("../../obrazki/relacja-1-1.webp", width: 90%),
  )
- 1:n (jeden do wielu) - klucz obcy jest po stronie "wielu",
  #figure(
    image("../../obrazki/relacja-1-n.webp", width: 90%),
  )
- n:m (wiele do wielu) - tworzymy dodatkową relację łącznikową z kluczami obcymi do obu relacji,
  #figure(
    image("../../obrazki/relacja-n-m.webp", width: 90%),
  )
- 1:0..n (jeden do wielu lub zero) - klucz obcy może być pusty po stronie "wielu".
  #figure(
    image("../../obrazki/relacja-1-0-n.webp", width: 90%),
  )

W procesie tworzenia modelu relacyjnego bazy danych jest to istotne żeby była znormalizowana.
Normalizacja bazy danych jest przeprowadzana w celu uniknięcia redundancji danych oraz uniknięcia problemów z integralnością.
Jest to istotne żeby uniknąć anomalii.

Anomalia to sytuacja, w której projekt bazy danych prowadzi do niespójności lub nieefektywności operacji na danych.
Dzieje się tak głównie z powodu nadmiarowości danych.
Mogą powodować problemy w zarządzaniu danymi i ich użytkowaniu.

Rodzaje anomalii:
+ Anomalia wstawiania:
  - *Problem:* Nie można dodać nowych danych bez jednoczesnego podania innych, niepotrzebnych danych.
  - *Przykład:*
    - Tabela „Pracownicy” zawiera kolumny: *Imię, Dział, Kierownik*.
    - Chcemy dodać nowy dział, ale nie ma w nim jeszcze pracowników. Bez podania informacji o przynajmniej jednym pracowniku w nowym dziale, nie możemy dodać rekordu.
+ Anomalia aktualizacji:
  - *Problem:* Zmiana danych w jednym miejscu wymaga aktualizacji wielu rekordów, co prowadzi do niespójności, jeśli któryś z rekordów zostanie pominięty.
  - *Przykład*:
    - Tabela „Faktury” zawiera kolumny: *Numer faktury, Klient, Adres klienta*.
    - Klient zmienia adres. W rezultacie musimy zaktualizować adres we wszystkich rekordach związanych z tym klientem. Jeśli pominie się choć jeden rekord, dane staną się niespójne.
+ Anomalia usuwania:
  - *Problem:* Usunięcie jednych danych powoduje utratę innych, powiązanych danych.
  - *Przykład*:
    - Tabela „Zamówienia” zawiera kolumny: *ID zamówienia, ID klienta, Szczegóły zamówienia*.
    - Jeśli wszystkie zamówienia danego klienta zostaną usunięte, tracimy również informację o samym kliencie.

Normalizację przeprowadza się poprzez zapewnienie że relacja spełnia poniższe zasady:
- *1NF* - pierwsza forma normalna:
  - Dane muszą być atomowe i niepodzielne.
    W takim znaczeniu że atrybut nie jest listą wartości oraz że nie można go podzielić na mniejsze atrybuty,
  - Przykład naruszenia: Podanie listy wartości jako atrybut (np. listy numerów telefonów).
- *2NF* - druga forma normalna:
  - Spełnia 1NF,
  - Każdy atrybut, który nie należy do klucza, musi być funkcjonalnie zależny od *całego* klucza (nie od jego części),
  - Przykład naruszenia: Podanie atrybutu który dotyczy części klucza.
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    figure(
      image("../../obrazki/relacja-2nf-1.webp", width: 90%),
    ),
    figure(
      image("../../obrazki/relacja-2nf-2.webp", width: 45%),
    ),
  )
- *3NF* - trzecia forma normalna:
  - Spełnia 2NF,
  - Atrybuty nienależące do klucza powinny być niezależne od siebie,
  - Przykład naruszenia: Wprowadzenie atrybutu, który jest niezależny od klucza głównego a od innego jakiegoś $n$.
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    figure(
      image("../../obrazki/relacja-3nf-1.webp", width: 90%),
    ),
    figure(
      image("../../obrazki/relacja-3nf-2.webp", width: 45%),
    ),
  )

=== Możliwe dopytania

- Czym jest / na czym polega ACID? (Boiński)
- Jaki jest powód rezygnacji z normalizacji danych? (Manus) (Odp: Żeby uzyskać krótki czas odpowiedzi z systemu. Jedna wielka tabela z redundancjami jest szybsza, niż milion joinów na mniejszych tabelach.)

#import "@preview/gentle-clues:1.2.0": *
#import "../../res/question.typ": question

#show: question.with(
  q: "Klasy języków programowania na wybranych przykładach."
)

=== Klasy według generacji języka

Generacja języka, czyli poziom abstrakcji i zaawansowania technologicznego:

- *niskopoziomowe (generacja I oraz II)* - są blisko sprzętu, zapewniają pełną kontrolę nad zasobami sprzętowymi. Jeżeli są stosowane umiejętnie, to mogą zapewnić najlepszą wydajność. Charakteryzują się one wysokim progiem wejścia i topornością wykorzystania.
- *wysokopoziomowe (generacja III+)* - oferują pewien poziom abstrakcji, czyli warstwę pomiędzy zasobami sprzętowymi a programistą. Dzięki temu programista zostaje zwolniony z pewnych obowiązków jak np. zarządzanie pamięcią.

#{
  set text(hyphenate: false, size: 9pt)
  set par(justify: false)
  table(
    columns: (auto, 2fr, 1fr, 2fr),
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
      [*Generacja*], [*Opis*], [*Przykłady*], [*Zastosowanie*]
    ),

    [*I*], 
    [Kod maszynowy wykonywany przez procesor. Bardzo mała przenośność.], 
    [Kod binarny], 
    [Systemy wbudowane \ Układy scalone],

    [*II*], 
    [Asembler, gdzie symbole i instrukcje (mnemoniki) zastępują kod maszynowy. Kod musi być podany asemblacji, żeby był uruchomiony przez procesor ($arrow$ przekompilowany w kod maszynowy).], 
    [Asembler], 
    [Optymalizowanie programów pod kątem wydajności \ Sterowniki],

    [*III*], 
    [Języki wysokopoziomowe, zbliżone do języka naturalnego. \ *Języki imperatywne.*], 
    [C, Java, Python], 
    [Aplikacje webowe, desktopowe itp.],

    [*IV*], 
    [Języki stworzone do konkretnych celów z jeszcze większym poziomem abstrakcji. \ *Języki deklaratywne.*], 
    [SQL, HTML, CSS], 
    [Bazy danych],

    [*V*], 
    [Zorientowane na logikę i sztuczną inteligencję. Deklaratywne.], 
    [Prolog, Mercury], 
    [-],
  )
}

=== Klasy ze względu na sposób wykonania

Wyróżnia się trzy klasy ze względu na sposób wykonania:

- *kompilowanie (C, C++)* - kod źródłowy zostaje "przetłumaczony" do postaci kodu maszynowgo przed jego wykonaniem. Kompilacja może zająć trochę czasu, ale wykonanie programu jest szybsze, ponieważ procesor otrzymuje instrukcje bezpośrednio z przekompilowanego pliku z kodem maszynowym,
- *interpretowane (Python, Javascript)* - kod źródłowy nie jest przekształcany do postaci maszynowej przed jego wykonaniem. Kod jest tłumaczony do postaci maszynowej linijka po linijce przez interpreter. Języki tego typu są znacząco wolniejsze od kompilowanych,
- *hybrydowe (Java)* - hybrydowe łączą ze sobą jednocześnie interpretację oraz kompilację kodu źródłowego do maszynowego. W przypadku Javy kod jest domyślnie interpretowany, natomiast drugi, równolegle działający i profilujący działanie programu kompilator JIT kompiluje kod bytecode w czasie wykonania.

=== Klasy ze względu na paradygmat programowania

Paradygmat programowania, to zbiór zasad które definiują sposób tworzenia i strukturyzacji programów. Paradygmat programowania definiuje sposób patrzenia programisty na przepływ sterowania i wykonanie programu komputerowego. Paradygmaty możemy podzielić na dwie główne rodziny:

- *imperatywne* - polegają na przedstawieniu algorytmu/zadania w postaci sekwencji instrukcji które zmieniają stan programu. *Programista mówi jak coś zrobić, a nie co ma być zrobione.* Można to rozumieć jako książkę kucharską. Przykładowe języki to C, C++, Python.
- *deklaratywne* - *programista pisze co chce osiągnąć*, a nie w jaki spoób chce to osiągnąć. Określenie celu lub wyniku, a nie sekwencji operacji. Przykładowe języki to SQL, HTML, CSS.

==== Paradygmaty imperatywne

- *Strukturalne* - kod dzielony na logiczne bloki, moduły i procedury. Zwiększa to jego czytelność i ułatwia zarządzanie. Ten paradygmat wprowadza instrukcje `if`, `switch`, `for`, `while` itd. Skupia się na tym, aby unikać używania instrukcji `goto`. *W programie można, ale nie trzeba korzystać z funkcji, po prostu wprowadzamy strukturę aby unikać `goto`.* Programowanie strukturalne jest nadzbiorem programowania proceduralnego. Przykładowe języki: C, Pascal.
- *Proceduralne* - podzbiór programowania strukturalnego. Skupia się na opakowywaniu kodu w procedury (funkcje). Kod który jest zapisany poza funkcjami nie zostanie wykonany. Procedury:
    - posiadają swoje parametry, których wartości przekazywane są podczas wywołania,
    - mają swój stan lokalny oraz mogą korzystać z globalnego,
    - mogą być wywołane z dowolnego miejsca w kodzie (również z siebie samej).
  Przykładowe języki: C, Ada, Fortran.
- *Obiektowe* - skupienie na organizacji programu w obiekty, aby kod był bardziej modularny, łatwy do utrzymania, rozwoju, i ponownego użycia. Obiekty zawierają dane oraz metody do przetwarzania tych danych. Przykładowe języki: Java, C\#.

==== Paradygmaty deklaratywne

- *Funkcyjne* - _myślenie o programie jak o zestawie funkcji matematycznych, które opisują jak przekształcić dane wejściowe w wyjściowe_.
  #info[
    W Haskellu nie można uruchomić funkcji bez użycia monady, ponieważ byłaby to instrukcja dla programu, która zmieniłaby jego stan. Monada opakowuje funkcje, efekty uboczne oraz zmianystanów programu.
  ]
  Cechy języków funkcyjnych to:
      - nie zachodzi zmiana stanu programu,
      - nie ma efektów ubocznych (funkcja nie wpływa na program poza swoją funkcją),
      - koncentruje się głównie na *funkcjach matematycznych*,
      - funkcje są traktowane jako pierwszorzędne obiekty - są na równi ze zmiennymi, można je przypisywać do zmiennych i przekazywać jako parametr.
  Występuje coś takiego jak *funkcje wyższych rzędów* - funkcje które spełniają jeden z dwóch kryteriów:
      - przyjmują inne funkcje jako argument
        ```python
def apply_function(func, x):
    return func(x)

# Funkcja przekazana jako argument
print(apply_function(lambda x: x ** 2, 5))  # Wynik: 25
        ```
      - zwracają funkcję jako wynik
        ```python
def multiplier(n):
    def multiply(x):
        return x * n
    return multiply

double = multiplier(2)  # Zwrócona funkcja, która mnoży przez 2
print(double(5))  # Wynik: 10
        ```
  Przykładowe języki: Haskell (czysto funkcyjny), Lisp (wspiera także paradygmat imperatywny).
- *Logiczne* - program jest zbudowany z zestawu zależności, a obliczenia są dowodem pewnego twierdzenia w oparciu o te zależności. Programista definiuje fakty, reguły i zapytania, a język programowania sam dedukuje odpowiedzi lub realizuje cel. Programowanie logiczne skupia się na relacjach między danymi. Przykładowe języki: Prolog, Mercury.

=== Możliwe dopytania

- Wg prowadzącego: Java i C\# są na 3 i 4 generacji, ponieważ mają dużo zaawansowanych mechanizmów. (autor nieznany)
- Wg prowadzącego: Obiektowe nie należą do imperatywnych. (Manus)
- Wg prowadzącego: Logiczne i funkcyjne nie do końca podpadają pod deklaratywne. (Manus)
- Pytanie o wersję najnowszego C\# lub Javy. (Kuchta)
- Wymienić wszystkie klasy jakie się zna. (Manus)
- Do jakiej generacji należy Prolog? (Manus) (odp: 5)
- Przykłady i do czego służą języki 5 generacji? (Manus)
- Kiedy występują komunikaty o błędach w językach kompilowanych i interpretowanych? (Szłapczyńska)
- *Jak już dzieli się na imperatywne i deklaratywne, to kolejne klasy przyporządkować do którejś z tych kategorii. (Szłapczyńska)*
- Jaką nowość technologiczną w kompilacji JIT wprowadził Microsoft w .NET względem Javy. (Matuszek) (odp: Wersjonowanie kodu pośredniego. Skompilowany kod jest przechowywany w stałym cache'u.)
- Zwrócić uwage na języki półkompilowane C\# i Java. (Szłapczyńska)
- Pytanie o języki niskiego i wysokiego poziomu, gdzie jest asembler a gdzie Scratch. (autor nieznany)
- Czy Scratch jest językiem obiektowym? (autor nieznany) (odp: tak)
- Jakim rodzajem języka jest SQL? (autor nieznany)
- Podaj różne paradygmaty programowania. (Daciuk)

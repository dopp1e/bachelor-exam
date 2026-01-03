#import "../../res/question.typ": question

#show: question.with(
  q: "Złożoność czasowa i pamięciowa algorytmów."
)

=== Złożoność obliczeniowa

Jest to jedna z charakterystyk które stosuje się przy porównywaniu algorytmów. Zasadniczo złożoność obliczeniowa odnosi się do ilości zasobów potrzebnych do wykonania algorytmu. Jako zasób rozumiemy tutaj zasób pamięci i czasu. Istotne jest to że zarówno złożoność czasowa jak i pamięciowa jest zależna od wielkości danych wejściowych.

=== Złożoność czasowa

Określa nam ile czasu algorytm potrzebuje aby skończył pracę. Ten czas jest określany za pomocą liczby operacji ktore będą wykonywane w tym algorytmie. Złożoność czasowa jest określana za pomocą notacji asymptotycznej:

- *O* (wielkie o) - określa górną granicę złożoności. Mówi że algorytm działa nie gorzej niż określony czas w najgorszym przypadku. Duże O jest kojarzone z terminem pesymistycznej złożoności, czyli takiej która może zajść w najgorszym przypadku. O(g(n)) mówi nam że złożoność algorytmu jest lepsza lub tak samo dobra jak g(n) nie jest gorsza.
- *#sym.Omega* (wielkie omega) - określa dolną granicę złożoności. Np $Omega(n)$ mówi że algorytm potrzebuje przynajmniej liniowej liczby operacji. Nosi również nazwę optymistycznej złożoności, której zazwyczaj się nie liczy. 
 $Omega(g(n))$mówi nam że złożoność algorytmu jest gorsza lub taka sama jak $g(n)$, czyli nie jest lepsza.
- *#sym.Theta* (wielkie theta) - mówi że czas wykonania algorytmu rośnie dokładnie zgodnie z określoną funkcją. $Theta(g(n))$ mówi że algorytm zarówno w najlepszym i najgorszym przypadku ma złożoność czasową $g(n)$, czyli ma dokładnie złożoność $g(n)$. 
- *o* (małe o) - określa ściśle górną granicę złożoności. $o(g(n))$ mówi że algorytm ma lepszą złożoność niż $g(n)$ i nigdy nie osiąga $g(n)$.
- *#sym.omega* (małe omega) - określa ściśle dolną granicę złożoności. $omega(g(n))$ mówi że złożoność algorytmu jest gorsza niż $g(n)$ i nigdy nie osiąga $g(n)$.

Rodzaje złożoności:

#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  stroke: 0.5pt + gray,
  
  table.header(
    [*Kategoria*], [*Rodzaj*], [*Przykłady*], [*Uwagi*]
  ),

  table.cell(rowspan: 2, align: center)[*Subliniowa*],
  [Stała], 
  [$Theta(1), Theta(1/n)$], 
  [liczba operacji niezależna od $n$],

  [Polilogarytmiczna], 
  [$Theta(log n), Theta(log^2 n), \ Theta(log log log n)$], 
  [wzrost znacznie wolniejszy od $n$],

  table.cell(rowspan: 3, align: center)[*Wielomianowa*],
  [Liniowa], 
  [$Theta(n)$], 
  [rośnie proporcjonalnie do $n$],

  [Quasi-liniowa], 
  [$Theta(n log n), \ Theta(n log log n)$], 
  [],

  [Kwadratowa], 
  [$Theta(n^2)$], 
  [],

  table.cell(rowspan: 3, align: center)[*Niewielomianowa*],
  [Superwielomianowa], 
  [$Theta(2^(sqrt(n)))$], 
  [],

  [Wykładnicza], 
  [$Theta(2^n), Theta(n^5 dot 6^n), \ O(2^n)$], 
  [],

  [Superwykładnicza], 
  [$Theta(2^(3n^7)), Theta(n^(sqrt(n))), \ Theta(n^n), Theta(n!)$], 
  [],
)

Przykłady operacji dla różnych złożoności czasowych:

#table(
  columns: (auto, auto, 1fr),
  inset: 10pt,
  align: (col, row) => (if col == 0 { center } else { left }) + horizon,
  stroke: 0.5pt + gray,
  
  table.header(
    [*Złożoność Czasowa*], [*Opis*], [*Przykład*]
  ),

  [$O(1)$], [stała], [Dostęp do elementu tablicy],
  [$O(log n)$], [logarytmiczna], [Przeszukiwanie binarne],
  [$O(n)$], [liniowa], [Przeszukiwanie tablicy],
  [$O(n log n)$], [quasiliniowa], [Sortowanie szybkie, heap sort],
  [$O(n^2)$], [kwadratowa], [sortowanie bąbelkowe],
  [$O(2^n)$], [wykładnicza], [Wieża Hanoi],
  [$O(n!)$], [superwykładnicza], [generowanie permutacji],
)

Przykładowe algorytmy (wypada znać jak działają):


#table(
  columns: (auto, 1fr, 1fr),
  inset: 10pt,
  align: (col, row) => (if col == 0 { center } else { left }) + horizon,
  stroke: 0.5pt + gray,
  
  table.header(
    [*Algorytm*], [*Złożoność czasowa*], [*Złożoność pamięciowa*]
  ),

  [Heapify],  [$O(log n)$], [$O(1)$],
  [Bubble sort], [$O(n^2)$], [$O(1)$],
  [Heap sort], [$O(n log n)$], [$O(1)$],
  [Quick sort], [średnio: $O(n log n)$, najgorzej $O(n^2)$], [$O(log n)$ lub $O(n)$],
  [Merge sort], [$O(n log n)$], [$O(n)$]
)

=== Złożoność pamięciowa

Jest to miara określająca ilość pamięci wykorzystywanej przez algorytm. Jest ona liczona jako użyta pamięć jakiejś maszyny na którym by działał algorytm, np w postaci komórek pamięci RAM. W procesie obliczenia złożoności pamięciowej pod uwagę bierzemy struktury pomocnicze alokowane dynamicznie których rozmiar jest zależny od rozmiaru danych wejściowych oraz pamięć stosu wywołań rekurencyjnych. Wówczas złożoność pamięciowa to jest "suma" tych złożoności, czyli po prostu wybranie tej funkcji która jest "gorsza" (rośnie szybciej).

Przykładowo w poniższej iteracyjnej implementacji funkcji Fibonacciego złożoność pamięciowa wynosi $O(1)$. Wynika to z faktu, że nie korzystamy z żadnej struktury pomocniczej której rozmiar byłby dynamiczny (mamy a i b które zawsze, zawsze będą o rozmiarze 1). Dodatkowo nie są korzystamy z żadnej rekurencji dlatego stos będzie zawsze też $O(1)$.

```python
def fibonacci(n):
    if n <= 1:
        return n
    a, b = 0, 1
    for _ in range(2, n + 1):
        a, b = b, a + b
    return b
```

Natomiast w poniższej implementacji złożoność pamięciowa jest równa O(n) wyłącznie z powodu maksymalnego zagłębienia stosu rekurencji. Jak można zauważyć w kawałku kodu zamieszczonym poniżej, dla fibonacci_recursive(5) maksymalne zagłębienie na stosie jest równe 5.

```python
def fibonacci_recursive(n):
    if n <= 1:
        return n
    return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)
```

Typy złożoności pamięciowej:

- stała $O(1)$ - algorytm wykorzystuje stałą liczbę komórek pamięci do wykonania. Przykładowo: do wyliczenia sumy wszystkich elementów w tablicy wykorzystuje się zmienną pomocniczą,
- logarytmiczna $O(log n)$ - np. rekursywny binary search,
- liniowa $O(n)$ - np. algorytm który wymaga przepisania tabeli do tabeli tymczasowej, wtedy jest tworzona nowa tablica o rozmiarze n,
- wielomianowa $O(n^2)$ - algorytmy które wymagają tworzenia macierzy wielowymiarowych.

=== Możliwe dopytania

- Podać kilka algorytmów z różnymi zależnościami pamięciowymi i określić jakie mają. (autor nieznany)
- W jakich jednostkach podaje się złożoność asymptotyczną np $O(n)$ w ilościach operacji. Złożoności quicksorta. (Boiński)
- Przykłady algorytmów w danej złożoności. (Dereniowski)
- W jakiej jednostce jest mierzona złożoność czasowa? (Szłapczyńska)
- W jakiej strukturze danych szukanie jest $O(1)$? (Szwoch)
- Czy algorytm o mniejszej złożoności czasowej zawsze wykona się szybciej? (Daciuk) (odp: Nie, zależy od poziomu skomplikowania operacji elementarnych i rozmiaru danych)
- Jakie mamy trzy złożoności algorytmów? (Janczewski) (odp: Optymistyczną, pesymistyczną, oczekiwaną)
- Podaj przykład algorytmu o stałej złożoności pamięciowej. (Manus)
- Czy i dlaczego ignorujemy stałe w określaniu złożoności obliczeniowej? (Waloszek)

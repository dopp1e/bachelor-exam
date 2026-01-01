#import "../../res/question.typ": question

#show: question.with(
  q: "Podstawowe struktury danych i algorytmy do ich przetwarzania."
)

Struktury danych to zasadniczo sposób przechowywania danych w pamięci. Wybór danej struktury zależy głównie od celu tych danych. Struktura danych może być prymitywna, czyli jak np jakiś integer czy char (String już jest tablicą) lub może być abstrakcyjna. Struktury danych możemy wstępnie podzielić ze względu na sposób organizacji danych:

#image("../../res/aids.webp")

=== Liniowe struktury danych

W liniowych strukturach danych dane są ułożone w liniowej sekwencji.

==== Tablica

Tablica to naprostsza, złożona struktura danych w której elementy są ułożone sekwencyjnie i do których mamy dostęp poprzez wykorzystanie indeksu elementu. Tablica może być statyczna, czyli taka której rozmiar jest stały, niezmienialny oraz dynamiczna, czyli taka której rozmiar jest alokowany w trakcie wykonywania programu. 

Pewnego rodzaju standardem stał się wariant tablicy zwany wektorem, która alokuje się dynamicznie i w trakcie zmiany liczby elementów dynamicznie powiększa (lub pomniejsza) swój rozmiar. Przykładowo, w języku C++, w przypadku braku miejsca na nowy element, tablica jest kopiowana z rozmiarem równym 150% poprzedniego rozmiaru, zaokrąglonego do najbliższej liczby całkowitej.

Z algorytmów działających na tablicach możemy wyróżnić:

- wyszukiwanie liniowe,
- wyszukiwanie binarne (tylko w uporządkowanej tablicy).


==== Stos

Jest to struktura typu LIFO (Last In First Out). Nowy element jest dodawany na wierzchołek stosu, a dostęp do niego mamy poprzez zdejmowanie go z wierzchołka stosu stosu. 

#image("../../res/stos.webp")

Stos wspiera trzy akcje:

- push - dodaj element na wierzchołek stosu,
- pop - zdejmij element z wierzchołka stosu,
- isEmpty - czy stos jest pusty.

Stos można zrozumieć jak stos książek, push odpowiada za położenie książki na stosie a pop odpowiada za zdjęcie książki ze stosu.

==== Kolejka

Jest typu FIFO - First in, First out. W tej strukturze nowy element jest dodawany na koniec listy a zabierane są z początku. 

Wspiera dwie operacje:

- enqueue - dodanie elementu na końcu kolejki,
- dequeue - pobranie elementu z początku kolejki.


==== Linked List

W tej strukturze danych dane są ustawiane sekwencyjnie, ale nie do końca liniowo (jeśli patrzymy pod kątem pamięci). Każdy element, oprócz danych, posiada wskaźnik, który informuje gdzie znajduje się kolejny element.

Można wyróżnić:

- listę jednokierunkową - zawiera jedynie wskaźnik na następny element,
- listę dwukierunkową - zawiera wskaźnik na następny i poprzedni element,
- listę cykliczną - ostatni element wskazuje na pierwszy element w liście.

Operacje które umożliwia lista:

- insert - dodanie elementu,
- delete - usunięcie elementu,
- search - odszukanie elementu.

=== Nieliniowe struktury danych

==== Drzewa

Drzewa to struktura złożona nieliniowa która charakteryzuje się tym że każdy element tej struktury znajduje się w "węźle" (node). Ten węzeł przechowuje daną informację oraz wskaźniki do jego dzieci. Węzły są połączone krawędziami. 

#image("../../res/tree.webp")

Drzewo to graf skierowany. Wyróżniamy dwa algorytmy do eksploracji drzew:

- DFS (Depth First Search) - eksploracja wgłąb. Polega on na wykorzystaniu stosu, w sposób:
    1. `push` dzieci węzła na stos,
    2. `pop` wierzchołku stosu, przechodząc do niego,
    3. powrót do punktu 1.
  Kolejność w której dodajemy dzieci węzła decyduje o tym w którym kierunku będziemy wchodzić wgłąb.
- BFS (Breadth First Search) - eksploracja wszerz. Po kolei odwiedzane są wszystkie poziomy drzewa. Zamiast stosu wykorzystywana jest kolejka:
    1. `enqueue` dzieci do węzła,
    2. `dequeue` oraz przejście do wziętego elementu,
    3. powrót do punktu 1.

Najważniejsze rodzaje drzew:

- Drzewa binarne - jeden węzeł może mieć co najwyżej dwoje dzieci. Można w nich wyróżnić regularne drzewo binarne, w którym każdy węzeł ma albo 2 lub 0 dzieci.
- #grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      Binary Search Tree (BST) - typ drzewa binarnego, w którym każde lewe poddrzewo węzła zawiera elementy mniejsze od węzła i prawe poddrzewo zawiera elementy większe od węzła. Algorytm DFS wtedy służy do przejrzenia zawartości drzewa w kolejności rosnącej.
    ],
    image("../../res/binarysearchtree.webp", width: 6cm)
  )
- Kopiec (Heap) - "kompletne drzewo", czyli każdy poziom jest wypełniony, a liście wypełniane są od lewej strony. Wysokość kopca jest równa $log(n)$. Wyróżniane są dwa rodzaje kopców:
      - max heap - każde poddrzewo zawiera elementy mniejsze niż węzeł (zarówno prawe i lewe),
      - min heap - analogicznie jak max heap, tylko większe niż węzeł.
      #grid(
        columns: (auto, auto),
        gutter: 1em,
        image("../../res/min-heap.webp"),
        image("../../res/max-heap.webp"),
      )
  Kopce można przedstawić w postaci tablicy (dla indeksowania od 1):
      - lewe dziecko: $2*i$
      - prawie dziecko: $2*i+1$
      - rodzic: $floor(i/2)$
  Przykład budowania:
  #block(breakable: false)[
  ```python
def max_heapify(array, heap_size, i):
    l = 2 * i
    r = 2 * i + 1
    largest = i

    if l < heap_size and array[l - 1] > array[i - 1]:
        largest = l

    if r < heap_size and array[r - 1] > array[i - 1]:
        largest = r

    if largest != i:
        array[i - 1], array[largest - 1] = array[largest - 1], array[i - 1]
        max_heapify(array, heap_size, largest)


def build_max_heap(array):
    heap_size = len(array)

    for i in range(heap_size // 2, 0, -1):
        max_heapify(array, heap_size, i)
  ```
  ]
  Budując kopiec, można posortować tablicę. Metoda nazywa się *heap sort*:
      1. stworzenie max_heap
      2. wierzchołek ustawiany jest na koniec tablicy
      3. ostatni element kopca ustawiany jest na wierzchołek
      4. powrót do kroku 1 z tablicą o rozmiarze 1 mniejszym (ponieważ wierzchołek kopca który został przeniesiony jest już posortowany)
  https://www.youtube.com/watch?v=2DmK_H7IdTo
- TRIE - TODO:
- Red-Black Tree - TODO:

==== Grafy

Grafy mogą mieć różne sposoby reprezentacji:

- tablica - dla konkretnych przypadków,
- macierz sąsiedztwa - macierz binarna zawierająca 0 i 1, wartość 1 oznacza sąsiedztwo i-tego węzła z j-tym (gdzie i to nr kolumny a j to wiersza),
- lista sąsiedztwa - n-elementowa tablica list, gdzie każdy element składa się z wierzchołka grafu i wskaźnika na inny wierzchołek, który jest jego sąsiadem,
- pęki wyjściowe.

#image("../../res/macierzlistaporownanie.webp")

=== Możliwe dopytania

- Jaka jest największa zaleta kopca? (autor nieznany)
- Pytanie o problem plecakowy. (autor nieznany)
- Z czego wynika złożoność wstawiania/usuwania węzła w drzewie? (autor nieznany) (odp: Z konieczności rozmieszczenia pozostałych węzłów tak, aby były spełnione zasady/cechy danego drzewa np mniejsze po lewej)
- Tablice haszowane, jakie są algorytmy w tabliach, drzewa czarno-czerwone. (Pikies)
- TRIE (Dereniowski)
- Czy można kompresować i jak to wpływa na ilość węzłów? (Manus) (odp: Można wstawiać człony słów ale wtedy ilość rozgałęzień może się zwiększyć)
- Jak reprezentowana jest kolejka w pamięci? (Pikies)
- Czy w przypadku tablicy w pamięci mogą być jakieś luki pomiędzy kolejnymi wartościami? (Pikies)
- Odnośnie struktury "Set" - jak to jest zaimplementowane że nie mogą tam się powtarzać elementy? (Pikies) (odp: Tablice haszowane)
- "Coś pytał o algorytmy przetwarzania macierzy" (Matuszek)
- Jak reprezentowany jest kopiec w pamięci? (Ostrowski)
- Gdzie wykorzystać DFS, a gdzie BFS? (Gierłowski)
- Jakby chciał Pan zaimplementować słownik, to jakiej struktury by Pan użył? (Manus)
- Czym różni się stowrzenie 3 tablic z typami prostymi od 3 tablic z structami? (Czarnul)

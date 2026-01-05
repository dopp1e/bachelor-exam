#import "@preview/gentle-clues:1.2.0": *
#import "../../res/question.typ": question

#show: question.with(
  q: "Podać różnice w implementacji obiektowości w kilku wybranych językach programowania."
)


Paradygmat programowania - zbiór zasad, które definiują sposób tworzenia i strukturyzacji programów. Określa sposób patrzenia programisty na przepływ sterowania i wykonanie programu komputeroweg.

Programowannie obiektowe - paradygmat programowania, w którym program jest złożony z współpracujących ze sobą obiektów, które są instancjami klas. Te klasy zaweriają informacje oraz metody, które będą przechowywane w obiekcie. Klasy te mogą reprezentować byty rzeczywiste ze świata lub abstrakcyjne.

- Abstrakcja - polega na ukrywaniu szczegółów implementacyjnych obiektu przekazując co klasa robi, a nie w jaki sposób. Jest to egzekwowane poprzez tworzenie klas abstrakcyjnych oraz interfejsów. Np. możemy mieć interfejs `Pojazd`, który mówi o istnieniu metody `jedź()`, wtedy klasa `Samochód` lub `Ciężarówka` implementując ten interfejs.
    - Klasa abstrakcyjna - nie można z niej bezpośrednio stworzyć obiektu, są to szablony które mają właściwości, metody z pełną implementacją oraz metody wirtualne które muszą być zaimplementowane w klasie dziedziczącej.
    - Interfejs - definiuje zestaw metod bez ich implementacji. Interfejsy nie mogą zawierać zmiennych. Klasy korzystające z interfejsu muszą realizować implementację wszystkich metod zdefiniowanych w interfejsie.
- Enkapsulacja - opakowanie danych i metod przetwarzających te dane w klasy. Przykładowo klasa `KontoBankowe` może mieć zmienną `saldo`, ale dostęp do niej może być poprzez metody `wpłać()` i `wypłać()`. Zapewnia ukrywanie szczegółów implementacyjnych poprzez ukrywanie danych i metod za pomocą modyfikatorów dostępu takich jak: `public`, `protected`, `private`.
     #memo(title: "Ważne!")[
      Enkapsulacja nie jest jednoznaczna z hermatyzacją. Hermetyzacja to szersze pojęcie dotyczące ukrywania szczegółów implementacyjnych. Enkapsulacja jest narzędziem implementującym hermetyzację.
    ]
- Hermetyzacja - ukrywanie szczegółów implementacyjnych klasy i eksponowanie tylko tych, które są istotne dla użytkownika klasy. Jest to *konceptualny fundament* programowania obiektowego. Obejmuje enkapsulację, ale jest szersze, ponieważ odnosi się do projektu i abstrakcji a nie tylko do technicznych mechanizmów.
- Polimorfizm - instancja klasy może być różna. Przykładowo, tablica może mieć obiekty typu `Pojazd`, przy czym możemy iterować po całej tablicy wywołując metodę `jedź()`, ponieważ wiemy że będzie to zaimplementowane.
- Dziedziczenie - pozwala na wydzielenie głównych cech obiektu do klasy nadrzędnej. Przykładowo, w klasie pojazd możemy mieć zmienną `koła`.

=== Java

Java jest w pełni obiektowym językiem. Wszystko (z wyjątkiem typów prymitywnych) musi znajdować się w klasie.

==== Abstrakcja

Java wsbiera abstrakcję poprzez klasy abstrakcyjne oraz interfejsy. Klasy abstrakcyjne mogą mieć metody wirtualne (implementacja po stronie klas dziedziczących) jak i zdefiniowane (z implementacją). Interfejsy są używane do definiowania kontraktów.

==== Enkapsulacja

Modyfikatory dostępu do danych:

- `public` - pole/metoda dostępna z dowolnego miejsca w kodzie,
- `private` - pole/metoda jest widoczna tylko w obrębie tej samej klasy,
- `protected` - dostęp w tej samej klasie, klasach dziedziczących oraz innych klasach tego samego pakietu,
- brak modyfikatora - pole/metoda ma dostęp pakietowy.

==== Polimorfizm

Java wspiera polimorfizm poprzez klasy abstrakcyjne, interfejsy oraz metody wirtualne. Mogą być przesłaniane poprzez annotacje (`@Override`), co pozwala na różne zachowanie obiektów w zależności od typów.

==== Dziedziczenie

W Javie można dziedziczyć jedynie po jednej klasie, ale można implementować wiele interfejsów.

=== Python

Python jest językiem wieloparadygmatowym, jednakże paradygmat obiektowy jest silnie wspierany, tak, że nawet typy prymitywne są obiektem.

==== Abstrakcja

W Pythonie abstrakcja jest możliwa za pomocą modułu `abc` (abstract base class), która pozwala na stworzenie klasy abstrakcyjnej oraz metod abstrakcyjnych.

```python
from abc import ABC, abstractmethod

class Vehicle(ABC):
	
	@abstractmethod
	def drive():
		pass
		
class Car(Vehicle):
	
	def drive():
		print("You are driving a car) 
```

Nie ma formalnych interfejsów.
#memo(title: "Ważne!")[
  Nie ma formalnych interfejsów! Abstrakcje są często realizowane przez konwencje i Duck Typing.
  W Duck Typing obiekt jest określonego typu, jeśli wszystkie jego metody i właściwości są wymagane przez ten typ (jeśli chodzi jak kaczka i kwacze jak kaczka, to musi być kaczka).
]

==== Enkapsulacja

Python nie oferuje formalnych modyfikatorów dostępu, wszystko jest domyślnie publiczne. Posiada jednak możliwość ukrywania szczegółów przez konwencje przedrostka z podkreśleniami:

- bez podkreślenia - atrybuty i metody są publiczne,
- jedno podkreślenie (np. `_zmienna`) - oznacza atrybut lub metodę chronioną, co jest wskazówką dla programistów niż prawdziwym ograniczeniem,
- dwa pokreślenia (np. `__zmienna`) - oznacza atrybut lub metodę prywatną. Python realizuje to przez "name mangling" - zmienia nazwę pola, aby uniknąć przypadkowego dostępu z zewnątrz.

==== Polimorfizm

Dzięki Duck Typing polimorfizm w Pythonie jest dynamiczny. Pozwala na traktowanie obiektów w podobny sposób jeżeli zawierają podobne właściwości/metody.

==== Dziedziczenie

Python wspiera wielokrotne dziedziczenie

=== Możliwe dopytania

- Wytłumaczyć polimorfizm. (Manus)
- Wytłumaczyć Duck Typing na zasadzie Javascripta (i/lub) Pythona. (Manus)

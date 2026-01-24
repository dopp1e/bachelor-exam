#import "@preview/gentle-clues:1.2.0": *
#import "../../res/question.typ": question

#show: question.with(
  q: "Nowoczesne platformy programowania obiektowego.",
)

*Platforma programowania* - środowisko programistyczne, które dostarcza narzędzia umożliwiające tworzenie, testowania i uruchamianie aplikacji. Elementy platformy programowania:

- język programowania,
- środowiska uruchomieniowe,
- biblioteki,
- narzędzia wspomagające debugowanie, testowanie kodu, zarządzanie zależnościami itp.

Istnieją platformy do różnych celów, między innymi:

- Unity, Unreal Engine - platformy do tworzenia gier,
- .NET - platforma do tworzenia backendu aplikacji,
- Java - ogólna platforma do tworzenia różnych zastosowań.

=== Java

Platforma technologiczna należąca do firmy Oracle. Platforma Java składa się z:

- *Język Java* - obiektowy język programistyczny, który może być kompilowany poprzez dostarczony kompilator w JDK, oraz uruchomiony w wirtualnej maszynie w środowisku JRE.
- *JVM (Java Virtual Machine)* - wirtualna maszyna, która jest środowiskiem, w którym jest wykonywany bytecode (pliki .class). Przez to, każde urządzenie posiadające JVM jest w stanie uruchomić programy Java. JVM jest kompatybilne wstecz.
  - *JIT (Just in Time compiler)* - działa w trakcie działania programu, kompiluje wybrane fragmenty kodu, oraz zapisuje je w postaci maszynowej do szybszej egzekucji. Szczególnie przydatne do fragmentów programu, które egzekwowane są wielokrotnie.
- *Biblioteki Java API* - zestaw gotowych klas i metod.
- *JRE (Java Runtime Environment)* - środowisko uruchomieniowe, odpowiada za utworzenie instancji maszyny wirtualnej. To JRE służy do uruchamiania aplikacji. To system zarządzanjący JVM + biblioteki standardowe.
- *JDK (Java Development Kit)* - zestaw narzędzi programistycznych dla języka Java. Zawiera on:
  - JRE,
  - kompilator - `javac`,
  - debugger - `jdb`,
  - narzędzia do dokumentacji - `javadoc`,
  - inne narzędzia wspomagające tworzenie aplikacji w Javie.


#memo(title: "Ważne!")[
  JVM nie ogranicza się do języka Java. Każdy język, który może być skompilowany do bytecodu rozumianego przez JVM może być wykorzystany w tej platformie, np. Kotlin, Groovy, Scala.
]

=== .NET

Platforma technologiczna należąca do firmy Microsoft. Kiedyś głównie na Windows, teraz możliwy do uruchomienia na różnych platformach. Składa się z:

- *Języki programowania* - platforma .NET wspiera wiele języków programowania, w tym C\#, F\#, Visual Basic .NET, a także inne języki poprzez implementacje zgodne z .NET.
- *BCL (Base Class Library)* - podstawowa biblioteka klas, która dostarcza zestaw gotowych klas i metod do różnych zastosowań, takich jak operacje na plikach, obsługa sieci, manipulacja danymi itp.
- *CIL (MSIL)* - kod w postaci pośredniej, odpowiednik bytecodu w Javie. Kod w tej postaci jest niezależny od systemu operacyjnego. Może być uruchomiony wszędzie, gdzie wspierany jest .NET.
- *CLR (Common Language Runtime)* - środowisko wykonawcze, które wykonuje kod w postaci CIL (odpowiednik bytecodu) za pomocą dwóch kompilatorów. W Javie, byłby to odpowiednik JVM, jednakże .NET nie korzysta z maszyny wirtualnej. CLR ma swój garbage collector oraz JIT (które działają inaczej niż na platformie Java).
  - NGEN - kompilator, który przetwarza CIL w postać wykonywalną przed uruchomieniem programu. Sprawia to, że uruchomienie trwa dłużej ale działanie jest szybsze. Pliki NGEN są dedykowane do platformy na którą zostały skompilowane.
  - JIT - kompilator, który kompiluje kod CIL w czasie działania programu. Jest międzyplatformowy, oraz pliki wytworzone przez JIT są usuwane po wykonaniu się programu.
- *CTS (Common Type System)* - definiuje jak typy danych są deklarowane, używane i zarządzane w czasie wykonywania. Umożliwia to współdzielenie danych między różnymi językami programowania działającymi na platformie .NET. Dzieli się na dwie kategorie:
  - typy wartościowe - przechowywane na stosie, zawierają bezpośrednio dane (np. int, float, struct),
  - typy referencyjne - przechowywane na stercie, zawierają odniesienia do danych (np. klasy, interfejsy, tablice).
- *CLS (Common Language Specification)* - zestaw reguł i standardów, które muszą spełniać wszystkie języki działające na platformie .NET. Jak Java, też jest platformą wielojęzykową.
- *Frameworki i narzędzia* - platforma .NET oferuje różne frameworki do tworzenia aplikacji, takie jak ASP.NET (aplikacje webowe), Windows Forms (aplikacje desktopowe), WPF (Windows Presentation Foundation) oraz narzędzia do zarządzania pakietami (NuGet) i środowiska IDE (Visual Studio).


=== Nowoczesność tych platform

==== Środowisko Zarządzane (Managed Environment)
To fundamentalna cecha odróżniająca nowoczesne platformy od języków starszej generacji (C/C++).
- *Automatyczne zarządzanie pamięcią (Garbage Collection):* Programista nie alokuje i nie zwalnia pamięci ręcznie. GC działa w tle, eliminując błędy typu _memory leaks_ oraz _dangling pointers_.
- *Bezpieczeństwo typów (Type Safety):* Maszyna wirtualna weryfikuje dostęp do pamięci, uniemożliwiając operacje poza dozwolonym obszarem (ochrona przed _buffer overflow_).

==== Wieloparadygmatowość (Hybrid Approach)
Nowoczesne platformy OOP zaadaptowały kluczowe koncepcje z programowania funkcyjnego, stając się hybrydami:
- *Wyrażenia Lambda:* Możliwość przekazywania funkcji jako argumentów.
- *Przetwarzanie strumieniowe:* Deklaratywne operacje na kolekcjach (Java Streams, .NET LINQ), co zwiększa czytelność i ułatwia zrównoleglenie obliczeń.
- *Niezmienność (Immutability):* Wprowadzenie struktur danych sprzyjających bezpiecznej wielowątkowości (np. `Records` w Javie/C\#).

==== Wydajność i Optymalizacja (JIT & AOT)
Model wykonania kodu ewoluował, aby zapewnić wydajność zbliżoną do kodu natywnego:
- JIT (Just-In-Time): Kod pośredni (Bytecode/CIL) jest kompilowany do kodu maszynowego w trakcie działania programu. Pozwala to na optymalizacje "w locie" pod konkretny procesor.
- AOT (Ahead-Of-Time): Nowoczesny trend (GraalVM, .NET Native AOT) polegający na kompilacji do pliku binarnego przed uruchomieniem. Kluczowe dla środowisk Cloud i Serverless (błyskawiczny start aplikacji).

==== Współbieżność i Asynchroniczność
Odchodzenie od ciężkich wątków systemowych na rzecz lekkich abstrakcji:
- *Model asynchroniczny:* Wzorce `async/await` (C\#) oraz `CompletableFuture` (Java) pozwalają na nieblokujące operacje wejścia/wyjścia (I/O).
- *Lekkie wątki:* Rewolucyjne podejście do skalowalności - _Virtual Threads_ (Project Loom w Javie) pozwalają uruchamiać miliony wątków na jednej maszynie.

==== Przystosowanie do Chmury (Cloud-Native)
Platformy te nie są już monolityczne. Zostały zoptymalizowane pod konteneryzację (Docker/Kubernetes):
- Modularyzacja bibliotek (zmniejszenie rozmiaru obrazów).
- Szybki czas startu i niski narzut pamięciowy (footprint).
- Wbudowane narzędzia do diagnostyki w środowiskach rozproszonych (_Observability_).

#image("../../res/csharpbytecode.png")

=== Możliwe dopytania

+ Czym jest platforma? Czym różni się od języka oprogramowania? (autor nieznany)
+ Czy któraś z platform jest płatna? (Manus)
+ Polimorfizm. (idk o co z tym chodzi)
+ W Javascript i Pythonie jak coś wygląda jak kaczka, to czy jest kaczką? (Manus)

=== Odpowiedzi na możliwe dopytania
+ Czym jest platforma? Czym różni się od języka oprogramowania? (autor nieznany)
  - Platforma programowania to środowisko, które dostarcza narzędzia, biblioteki i runtime do tworzenia i uruchamiania aplikacji. Język programowania to tylko składnia i semantyka używana do pisania kodu. Platforma może obsługiwać wiele języków.
+ Czy któraś z platform jest płatna? (Manus)
  - Java jest darmowa, jeśli korzysta się z OpenJDK i przestrzegamy warunków licencji. Jednakże Oracle JDK może wymagać licencji komercyjnej w niektórych zastosowaniach.
  - .NET jest również darmowy i open-source, dostępny pod licencją MIT. Microsoft oferuje dodatkowe usługi i narzędzia, które mogą być płatne, ale sama platforma .NET jest bezpłatna.
+ Polimorfizm. (Manus)
  - Polimorfizm to zdolność obiektów do przyjmowania różnych form. W programowaniu obiektowym oznacza to, że metoda może działać różnie w zależności od obiektu, na którym jest wywoływana (np. metody o tej samej nazwie w różnych klasach).
+ W Javascript i Pythonie jak coś wygląda jak kaczka, to czy jest kaczką? (Manus)
  - Tak, to jest zasada "duck typing". Jeśli obiekt zachowuje się jak kaczka (ma odpowiednie metody i właściwości), to jest traktowany jako kaczka, niezależnie od jego faktycznego typu. W praktyce oznacza to, że ważne jest, jak obiekt się zachowuje, a nie jego formalna definicja typu.

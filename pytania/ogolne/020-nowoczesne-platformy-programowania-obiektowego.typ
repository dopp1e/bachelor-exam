#import "@preview/gentle-clues:1.2.0": *
#import "../../res/question.typ": question

#show: question.with(
  q: "Nowoczesne platformy programowania obiektowego."
)

*Platforma programowania* - środowisko programistyczne, które dostarcza narzędzia umożliwiające tworzenie, testowania i uruchamianie aplikacji. Elementy platformy programowania:

- język programowania,
- środowiska uruchomieniowe,
- frameworki - szkielety oraz szablony aplikacji, które przyspieszają tworzenie oprogramowania. Wspomagają poprzez nakładanie założeń,
- biblioteki,
- edytoru kodu, systemy kontroli wersji, narzędzia wspomagające debugowanie, testowanie kodu.

Istnieją platformy do różnych celów, między innymi:

- Unity, Unreal Engine - platformy do tworzenia gier,
- .NET - platforma do tworzenia backendu aplikacji,
- Java - ogólna platforma do tworzenia różnych zastosowań.

=== Java

Platforma technologiczna należąca do firmy Oracle. Platforma Java składa się z:

- *JVM (Java Virtual Machine)* - wirtualna maszyna, która jest środowiskiem, w którym jest wykonywany bytecode (pliki .class). Przez to, każde urządzenie posiadające JVM jest w stanie uruchomić programy Java. JVM jest kompatybilne wstecz.
    - *JIT (Just in Time compiler)* - działa w trakcie działania programu, kompiluje wybrane fragmenty kodu, oraz zapisuje je w postaci maszynowej do szybszej egzekucji. Szczególnie przydatne do fragmentów programu, które egzekwowane są wielokrotnie.
- *JRE (Java Runtime Environment)* - środowisko uruchomieniowe, odpowiada za utworzenie instancji maszyny wirtualnej. To JRE służy do uruchamiania aplikacji. Zaweria biblioteki standardowe.
- *JDK (Java Development Kit)* - zestaw narzędzi programistycznych dla języka Java. Zawiera on:
    - kompilator - `javac`,
    - JRE - narzędzie do uruchamiania bytecode,
    - Debugger.
- *Język Java* - obiektowy język programistyczny, który może być kompilowany poprzez dostarczony kompilator w JDK, oraz uruchomiony w wirtualnej maszynie w środowisku JRE.
- *Biblioteki Java API* - zestaw gotowych klas i metod.


#memo(title: "Ważne!")[
  JVM nie ogranicza się do języka Java. Każdy język, który może być skompilowany do bytecodu rozumianego przez JVM może być wykorzystany w tej platformie, np. Kotlin, Groovy, Jython.
]

=== .NET

Platforma technologiczna należąca do firmy Microsoft. Kiedyś głównie na Windows, teraz możliwy do uruchomienia na różnych platformach. Składa się z:

- *CLR (Common Language Runtime)* - środowisko wykonawcze, które wykonuje kod w postaci CIL (odpowiednik bytecodu) za pomocą dwóch kompilatorów. W Javie, byłby to odpowiednik JVM, jednakże .NET nie korzysta z maszyny wirtualnej. CLR ma swój garbage collector oraz JIT (które działają inaczej niż na platformie Java).
    - NGEN - kompilator, który przetwarza CIL w postać wykonywalną przed uruchomieniem programu. Sprawia to, że uruchomienie trwa dłużej ale działanie jest szybsze. Pliki NGEN są dedykowane do platformy na którą zostały skompilowane.
    - JIT - kompilator, który kompiluje kod CIL w czasie działania programu. Jest międzyplatformowy, oraz pliki wytworzone przez JIT są usuwane po wykonaniu się programu.
- *CIL (MSIL)* - kod w postaci pośredniej, odpowiednik bytecodu w Javie. Kod w tej postaci jest niezależny od systemu operacyjnego. Może być uruchomiony wszędzie, gdzie wspierany jest .NET.
- *CLS (Common Language Specification)* - zestaw reguł i standardów, które muszą spełniać wszystkie języki działające na platformie .NET. Jak Java, też jest platformą wielojęzykową.

#image("../../res/csharpbytecode.png")

=== Możliwe dopytania

- Czym jest platforma? Czym różni się od języka oprogramowania? (autor nieznany)
- Czy któraś z platform jest płatna? (Manus)
- Polimorfizm. (idk o co z tym chodzi) (Manus)
- W Javascript i Pythonie jak coś wygląda jak kaczka, to czy jest kaczką? (Manus)  (Odp. Tak, Manus ma tutaj na myśli duck typing - czyli jeśli coś zachowuje się jak dana rzecz, to można to tak traktować bez względu na typ formalny, np. dodatkowe atrybuty, metody niedefiniowane w typie.)

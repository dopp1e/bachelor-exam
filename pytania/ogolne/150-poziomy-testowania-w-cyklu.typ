#import "@preview/gentle-clues:1.2.0": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "../../res/question.typ": question

#show: codly-init.with()

#show: question.with(
  q: "Poziomy testowania w cyklu życia oprogramowania."
)

=== Etapy testowania

*Testowanie:* Jest to analiza zachowania oprogramowania w celu pomiaru jego jakości.
Testowanie jest jednym z najistotniejszych elementów tworzenia oprogramowania ponieważ stworzenie idealnego oprogramowania jest co najmniej trudne, najpewniej niemożliwe.

Kluczowe w ramach omawiania tego tematu są pojęcia:
- *Defekt* - jest to niepoprawny krok, proces lub definicja danych w oprogramowaniu,
- *Błąd* - niepoprawny stan lub zachowanie oprogramowania (może być niewidoczny dla użytkownika),
- *Awaria* - niemożność skorzystania z funkcji oprogramowania (już jest widoczne dla użytkownika).

Między tymi terminami zachodzi zależność, w której defekt może doprowadzić do błędu, a błąd może doprowadzić do awarii.

Zasadniczo wyróżniamy cztery poziomy testowania w cyklu życia oprogramowania, zaczynając od najmniejszej jednostki kodu aż do całego systemu:
+ Testy jednostkowe, 
+ Testy integracyjne,
+ Testy systemowe,
+ Testy akceptacyjne.

=== Testy jednostkowe

Głównym celem testów jednostkowych jest jedynie znalezienie defektów zrobionych w kodzie na poziomie pojedynczej metody/klasy.
Te pojedyncze kawałki kodu są testowane w sposób izolowany względem siebie. 

Testy te można robić ręcznie, ale wraz z zwiększaniem się projektu nadmiar pracy na samo testowanie byłby za duży, dlatego można prowadzić testy automatyczne.
Wiele języków programowania posiada dedykowane frameworki do pisania testów jednostkowych, np. JUnit dla Javy, unittest dla Pythona czy NUnit dla C\#.

#info[
Przykład testu jednostkowego w TypeScript z użyciem frameworka Vitest:

#codly(languages: codly-languages)
```typescript
import { describe, it, expect } from "vitest";
import { add } from "../math.js"

describe("add function", () => {
  it("should return 3 when adding 1 and 2", () => {
    expect(add(1, 2)).toBe(3);
  });
});
```
]

Testy są pisane przez programistów, którzy tworzą kod. Mogą być one pisane przed samym kodem (podejście TDD - Test Driven Development).

=== Testy integracyjne

Są to testy scalenia modułów systemu, których celem jest weryfikacja czy oddzielne komponenty poprawnie się komunikują oraz współpracują jako całość.
Testowaniu podlega także interakcja oprogramowania z innymi systemami, jak np. system operacyjny, system plików czy sprzęt.

W celu sprawdzenia czy całość jako system działa możemy podjąć konkretną strategię, której wybór zależy głównie od architektury systemu:
- *Strategia big bang (skokowa)* - jednoczesne scalenie wszystkich modułów.
  Wszystkie moduły są testowane jednocześnie po ich połączeniu.
  Takie podejście nie jest najlepsze, ponieważ jest wysokie ryzyko niepowodzenia i daje niewiele informacji, gdzie mógłby wystąpić błąd.
- *Strategia przyrostowa* - testowane moduły są łączone stopniowo.
  Umożliwia to nam wykrycie błędu na poziomie konkretnego modułu.
  Wyróżniamy dwa podejścia:
  - top-down - testowanie zaczyna się od modułów najwyższego poziomu w hierachii systemu, komponenty znajdujące się niżej w hierarchii są symulowane za pomocą atrap,
  - bottom-up - testowanie zaczyna się od najniższych modułów w hierarchii, wtedy wówczas wyższe komponenty korzystają już z tych faktycznych istniejących.
  Zakładając, że strzałki określają udostępnianie funkcji/usług, można to zobrazować następująco:
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    figure(
      image("../../obrazki/top-down.webp", width: 100%),
      caption: [Podejście top-down]
    ),
    figure(
      image("../../obrazki/bottom-up.webp", width: 100%),
      caption: [Podejście bottom-up]
    )
  )

=== Testy systemowe

Testy systemowe to są testy całego systemu w celu sprawdzenia czy jako produkt spełnia wszystkie uzyskane w procesie wytwarzania wymagania funkcjonalne jak i niefunkcjonalne.

*Wymagania funkcjonalne*

W kontekście sprawdzenia wymagań funkcjonalnych sprawdzane jest czy system spełnia wszystkie funkcje ustalone przez klienta, czy jest kompletny.

Mogą być wykorzystywane “smoke testy”  czyli testy sprawdzające czy zbiór najważniejszych funkcjonalności działa poprawnie (czyli czy aplikacja w ogóle działa).
Nazwa pochodzi z sytuacji uruchamiania urządzenia po raz pierwszy aby sprawdzić czy “nie wydobywa się z nich dym”, czyli czy po uruchomieniu “nie wybuchnie”.

*Wymagania niefunkcjonalne*

Te wymagania noszą również nazwę wymagań jakościowych i obejmują takie aspekty jak:
- *Wydajność/niezawodność* - którą można testować poprzez testy obciążeniowe i przeciążeniowe,
- *Ochrona* - np. testy penetracyjne symulujące ataki hakerskie w celu znalezienia luk w systemie.

Środowisko testowe w tych testach powinno być przybliżone temu w którym ma być wdrożony, w celu zminimalizowania ryzyka powstawania błędów wynikających z środowiska, które nie były wykryte podczas błędów.

Przykładem mogą być także testy E2E - testy, które obejmują działanie całego systemu jako jednej całości.

Testy systemowe są wykonywane zazwyczaj przez zespół testerów.

#info[
  (Vibe-coded) Przykładowe pytania na które odpowiadają testy systemowe:
  - Czy wszystkie funkcje systemu działają zgodnie z wymaganiami technicznymi?
  - Czy system zachowuje spójność danych przy awariach lub błędach?
  - Czy system jest odporny na ataki typu SQL injection, Cross-site Scripting (XSS), itp.?
  - Czy system obsługuje przewidywaną liczbę użytkowników bez spadku wydajności?
]

=== Testy akceptacyjne

Na etapie testów akceptacyjnych zachodzi demonstracja działania systemu użytkownikom końcowym.
Sprawdzane jest czy dostarczony produkt, system spełnia wszystkie wymagania biznesowe.
Celem tych testów jest określenie czy zbudowano oczekiwany system, czy jest gotów to pełnienia funkcji biznesowych zamawiającego.
Przejście przez ten sytem oznacza ostateczną odpowiedź czy zespołowi się udało i czy można wprowadzić ten produkt na rynek. 

Jest to test formalny, wykonywany w celu ustalenia czy system jest gotowy dla użytku przez klienta. 

Wynikiem takich testów może być przyjęcie, odrzucenie lub akceptacja warunkowa.

Testy akceptacyjne są wykonywane przez klienta, interesariuszy lub użytkowników końcowych, ponieważ to oni oceniają czy system spełnia ich oczekiwania.

#info[
  Przykładowe pytania na które odpowiadają testy akceptacyjne:
  - Czy system spełnia wszystkie wymagania biznesowe określone przez klienta (np. raportowanie, analiza danych)? (no klient zauważa np że mu się raport nie generuje jakiś albo by chciał żeby pdfa dostał a nie docxa)
  - Czy interfejs użytkownika jest zgodny z oczekiwaniami klienta (np. kolory, układ, dostępność)?
  - Czy proces zakupów jest intuicyjny i spełnia oczekiwania użytkownika końcowego (np. koszyk, płatności, fakturowanie)?
]

=== Możliwe dopytania

- Jak komponenty komunikują się w testach integracyjnych? (Pikies) (Odp. Jakieś przestrzenie adresowe, api.)
- Testy akceptacyjne, pokrycie wymagań funkcjonalnych i niefunkcjonalnych. (Dziubich)
- Czy sam JUnit wystarczy do pisania testów jednostkowych? (Przybylek) (Odp. Niekoniecznie, chociażby dlatego, że czasem potrzebne są mocki lub stuby do izolacji testowanego kodu od reszty systemu. W takich przypadkach można użyć dodatkowych bibliotek jak Mockito.)
- Czy duże testy są lepsze od mniejszych? (Manus) (Odp. Zależy od kontekstu, ale generalnie mniejsze są lepsze, nie zawsze warto jest szczegółowo testować wszystko.)
- Dlaczego nie warto pisać zbyt wiele testów jednostkowych? (Manus) (Odp. Zależy od kontekstu, ale duża liczba testów może spowodować że za dużo czasu jest na nie poświęcane. Dodatkowo istnieje możliwość dotarcia do momentu, w którym testy testują więcej niż jedną funkcjonalność.)
- Dlaczego testy nie powinny testować więcej niż jednej funkcjonalności? (Manus) (Odp. Jeśli jedna funkcjonalność zawiera błąd, to wiele testów może się nie powieść, a my nie będziemy wiedzieć co dokładnie nie działa.)
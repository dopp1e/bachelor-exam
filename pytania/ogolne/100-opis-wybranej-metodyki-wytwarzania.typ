#import "@preview/gentle-clues:1.2.0": *
#import "../../res/question.typ": question

#show: question.with(
  q: "Opis wybranej metodyki wytwarzania oprogramowania.",
)

/ Metodyka wytwarzania oprogramowania: Konkretna metoda, zbiór szczegółowych zasad, narzędzi i praktyk stosowanych w konkretnym procesie tworzenia oprogramowania.
  Metodyka może bazować na jednym lub więcej modelach wytwarzania, ale definiuje konkretne sposoby realizacji etapów wytwarzania oprogramowania.
  Metodyka wytwarzania może określać sposób w jaki zespoły projektowe powinny planować, testować, wdrażać oraz utrzymywać oprogramowanie, aby zapewnić jego jakość i zgodność z wymaganiami klienta.

Wyrózniamy dwie główne kategorie metodyk:
- *Metodyki sterowane planem / ciężkie / zdyscyplinowane:*
  - zorientowane na ścisłe planowanie, zarządzanie oraz przewidywanie rezultatów,
  - kluczowym elementem jest tworzenie szczegółowej dokumentacji oraz ścisłe przestrzeganie precyzyjnie zdefiniowanych procesów,
  - jakość jest zapewniana poprzez dodatkowe testowanie, kontrole i nadzór,
  - stosowane w dużych projektach, w których ważne jest zapewnienie wysokiego poziomu bezpieczeństwa oraz w projektach rozproszonych o utrudnionym przepływie wiedzy w zespole.
  Przykład: Rational Unified Process (RUP).
- *Metodyki zwinne / lekkie / agile:*
  - oryginalnie dla mniejszych projektów i zespołów (ale później powstały propozycje skalowania “scaling frameworks”),
  - są *lekkie* procesy, w których jest relatywnie mniejsza liczba działań i produktów.
  - jakość jest zapewniana poprzez transparentność i wspólne zaangażowanie,
  - istotą metodyk zwinnych jest iteracyjność (szczególnie model przyrostowy), częste dostarczanie działającego oprogramowania i współpraca z klientem.
  Przykład: Scrum, Kanban, Feature Driven Development.

#info[
  *Agile Manifesto (2001)* - deklaracja wartości i zasad które są podstawą podejścia zwinnego do zarządzania projektami i tworzenia oprogramowania.
  - *Ludzi i interakcje ponad procesy i narzędzia* - ludzie i ich współpraca jest ważniejsza niż sztywne procedury,
  - *Działające oprogramowanie ponad obszerną dokumentacją* - dostarczanie działającego produktu ma wyższy priorytet niż szczegółowe dokumentowanie każdego kroku,
  - *Współpraca z klientem ponad negocjowanie kontraktów* - współpraca z klientem jest bardziej efektywna niż trzymanie się sztywno warunków umowy,
  - *Reagowanie na zmiany ponad realizowanie planu* - Elastyczne dostosywanie się do zmian jest ważniejsze niż ścisłe trzymanie się z góry ustalonego planu.
]

=== Scrum

Jest to najpopularniejsza metodyka zwinna (Agile) która definiuje proces wytwarzania w krótkich iteracjach (sprintach) trwających maksymalnie jeden miesiąc, wyznacza role w zespole i sposoby komunikacji między członkami.

*Główne założenia Scrum:*
1. *Iteracyjność i przyrostowość* - Praca nad produktem jest dzielona na krótkie cykle zwane sprintami (1-4 tygodniowe).
  Każdy sprint kończy się dostarczeniem potencjalnie gotowego do wdrożenia fragmentu produktu (increment, merge z gałęzią produkcyjną).
2. *Samoorgranizujące się zespoły* - Zespół scrum jest niewielki (składający się z 6 do 10 osób) i multidyscyplinarny, co oznacza, że członkowie posiadają różnorodne umiejętności i doświadczenie w różnych dziedzinach.
  Ważne w scrumie jest zaangażowanie każdego członka w dostarczenie wartościowych wyników pracy.
3. *Transparentność i inspekcja* - Cały proces w Scrum opiera się na jawności informacji, przejrzystości zadań i wyników oraz regularnych inspekcjach pracy zespołu aby szybko identyfikować i eliminować problemy (inspekcje na takiej zasadzie że ktoś może ma problem to inni mogą pomóc).
4. *Adaptacja* - Zmiany są naturalnym elementem pracy. Dzięki regularnym przeglądom i retrospektywom zespół może szybko się dostosować do nowych wymagań i okoliczności.

*Role w Scrumie:*
+ *Właściciel produktu (Product owner):*
  - Odbiorca produktu lub jego przyszły użytkownik,
  - Odpowiada za maksymalizację wartości produktu,
  - Zarządza backlogiem produktu, wyznacza priorytety zadań i dodaje nowe,
  - Akceptuje koniec sprintu.
+ *Scrum master:*
  - Guru zespołu scrumowego, dba o przestrzeganie zasad Scrum,
  - Usuwa przeszkody, blokery w zespole,
  - Wspiera zespół w organizacji pracy, prowadzi spotkania.
+ *Zespół Scrum (Scrum Team):*
  - Grupa specjalistów którzy realizują zadania zaplanowane na sprint.

#figure(
  image("../../obrazki/scrum-role.webp", width: 50%),
)

#info[
  Priorytety mogą być wyznaczane przez product ownera w postaci skali high, medium, low.
  Używane mogą być również np. story points.
  Można też wyróżnić technikę MoSCoW:
  - Must have → kluczowe,
  - Should have → przydatne,
  - Could have → dodatkowe,
  - Won't have → niepotrzebne.
]

*Artefakty w Scrum:*
1. *Product Backlog:*
  - Lista wszystkich wymagań, funkcji i zmian które mają zostać zrealizowane w projekcie,
  - Elementy backlogu są stale aktualizowane, uszczegóławiane i priorytetyzowane przez product ownera,
  - Elementy w backlogu występują w postaci “historyjek” (user stories), które mogą być grupowane w epiki.
2. *Sprint Backlog, Active sprint:*
  - Zbiór historyjek wybranych z backlogu sprintu do realizacji w danym sprincie,
  - Jest dynamiczy, jego zawartość jest ustalana na etapie planowania sprintu aczkolwiek w przypadku szybszego wykonania zadania można dopisać zadania do sprintu,
  - Zadania niewykonane w sprincie w wyniku jakichś problemów są traktowane jako “spilovery” i są wykonywane po prostu w kolejnym sprincie i są traktowane jak normalne zadania. Mają taki sam wpływ na zakres sprintu.
3. *Increment (przyrost):*
  - Potencjalnie gotowa do wdrożenia część produktu dostarczona na zakończenie sprintu. Może być tak, że warunkiem ukończenia historyjki jest zmergowanie nowej funkcjonalności do jakiejś gałęzi.

*Elementy procesu Scrum:*
- *Historyjka* - User story, metoda opisywania wymagań.
  Jednostka pracy, która opisuje funkcjonalność lub wartość dla użytkownika.
  Może być zrealizowana w jednym sprincie przez jedną osobę.
  Dla pojedynczej historyjki można zdefiniować Definition Of Done (DoD), czyli kryteria jej zakończenia.
  Można również przypisać priorytety (np. za pomocą MoSCoW, low-medium-high) oraz estymaty za pomocą story points.
  Polega na pisaniu wymagania z perspektywy użytkownika, np. jako *klient banku* chcę *zobaczyć listę ostatnich transakcji*, żeby *kontrolować swoje wydatki*.
- *Epika* - Jest ogólnym, dużym zadaniem, celem, który jest zbyt duży aby zrealizować go w jednym sprincie i który można podzielić na mniejsze zadania.
  Przykładowo Epiką może być zadanie “Zarządzanie kontem użytkownika” które obejmuje tworzenie kont, resetowanie hasła, edycję itd.
  Epika składa się z historyjek i jest realizowana w wielu sprintach.
- *Story point* - Jest to jednostka miary używana do określenia czasochłonności lub czasu potrzebnego na zrealizowanie historyjki.
  Należy mieć na uwadze to, że jest to miara subiektywna, dlatego w celu jej obrania stosuje się metody takie jak Planning Poker.
  Różni ludzie mają różną perspektywę na zadanie i mogą pomóc w dokładniejszym oszacowaniu.

*Wydarzenia Scrumowe:*
+ *Sprint Planning* - Spotkanie na samym początku sprintu, w czasie którego zespół wraz z product ownerem wybierają zadania z backlogu produktu realizowane w kolejnym sprincie.
+ *Daily Scrum* - Codzienne (może być weekly) spotkanie na którym relacjonuje się co się zrobiło wczoraj, jakieś problemy, blokery, oraz co się planuje zrobić dzisiaj. Trwa maksymalnie 15 minut.
+ *Sprint review preparation* - Spotkanie mające na celu przygotowanie listy zrobionych w sprincie zadań, zazwyczaj w formie listy która wyznacza też kolejność przedstawianych zrobionych historyjek.
+ *Sprint review* - Spotkanie z product ownerem polegające na przedstawieniu przez zespół zrealizowanych zadań.
  Umożliwia uzyskanie opinii i informacji zwrotnych od po lub interesariuszy. Zakończenie sprintu.
+ *Sprint Retrospective* - Spotkanie, na którym zespół analizuje swoją pracę po zakończeniu sprintu.
  Pomaga to wyróżnić co się odbyło pomyślnie (np. współpraca w zespole) albo co było źle (np. zbyt małe estymaty zadań prowadzące do spiloverów).
+ *Backlog Refinement* - Spotkanie, w czasie którego omawiane są historyjki, które zostały zarejestrowane przez PO lub przez innych członków zespołu, na którym przypisywane są np. story points zadania lub doprecyzowanie szczegółów tego zadania.

=== Kanban

Metodyka wywodząca się z Japonii (Toyota), która początkowo miała sterować procesami produkcyjnymi, maksymalizując wydajność produkcji.
Polegała na organizowaniu procesu, aby każda komórka organizacyjna produkowała dokładnie tyle, ile w danej chwili jest potrzebne.
Nazwa kanban oznacza “tablicę wizualną” i odnosi się do sposobu zarządzania przepływem pracy za pomocą wizualizacji.

Metodyka ta jest na tyle uniwersalna że znalazła swoje użycie w metodykach wytwarzania oprogramowania.

#figure(
  image("../../obrazki/kanban-board.webp"),
)

*Kluczowe założenia:*
+ *Zarządzanie przepływem pracy* - Kanban koncentruje się na usprawnianiu i płynności procesu poprzez identyfikowanie wąskich gardeł i eliminowanie zbędnych przestojów.
+ *Tablica Kanban* - Centralnym elementem metody jest tablica wizualizująca przepływ zadań.
  Tablica jest podzielona na kolejne etapy reprezentujące przepływ zadania w procesie: _To do_, _In progress_ i _Done_.
  Każdy z tych etapów można rozdrobnić na mniejsze np. _In progress_ na _working_ i _waiting for review_.
+ *Ograniczanie liczby zadań w toku* - Aby zapobiec przeciążeniu zespołu, Kanban wprowadza ograniczenie liczby zadań, które mogą być zrobione jednocześnie w danym etapie.
  Dzięki temu praca skupia się na kończeniu zadań, a nie rozpoczynaniu nowych.
+ *Ciągłe doskonalenie* - Proces w kanban podlega stałej optymalizacji.
  Regularne analizy pomagają wykrywać wąskie gardła i wprowadzać usprawnienia.

=== RUP (Rational Unified Process)

Jest to metodyka wytwarzania oprogramowania stworzona przez firmę Rational Software (obecnie część IBM). W przeciwieństwie do "lekkich" metodyk zwinnych, RUP jest procesem sformalizowanym (heavyweight), który kładzie duży nacisk na architekturę, planowanie i dokumentację, zachowując przy tym podejście iteracyjne.
Proces ten jest sterowany przypadkami użycia (Use-Case Driven) i skoncentrowany na architekturze (Architecture-Centric).

#figure(
  image("../../obrazki/rup-hump-chart.webp", width: 90%),
  caption: [Wykres faz i dyscyplin RUP (Hump Chart)],
)

*Struktura RUP (Dwa wymiary):*
Proces RUP opisywany jest zazwyczaj w dwóch wymiarach:
1. *Wymiar czasowy (Fazy)* - Organizacja procesu w czasie, dzieląca cykl życia projektu na cztery główne etapy.
2. *Wymiar statyczny (Dyscypliny)* - Zbiór działań (takich jak implementacja, testowanie, zarządzanie), które odbywają się w trakcie trwania całego projektu, ale z różnym natężeniem w zależności od fazy.

*Cztery fazy cyklu życia:*
1. *Faza rozpoczęcia (Inception):*
  - Zdefiniowanie wizji projektu i zakresu systemu (scope),
  - Ustalenie uzasadnienia biznesowego (Business Case) oraz wstępna wycena,
  - Identyfikacja głównych ryzyk i kluczowych interesariuszy,
  - Efektem jest decyzja "Life Cycle Objective" (czy projekt ma sens).
2. *Faza opracowania (Elaboration):*
  - Ustabilizowanie architektury systemu ("szkielet" aplikacji),
  - Szczegółowa analiza wymagań i doprecyzowanie większości przypadków użycia,
  - Wyeliminowanie najbardziej krytycznych ryzyk technicznych,
  - Powstaje tzw. "executable architecture baseline".
3. *Faza konstrukcji (Construction):*
  - Jest to faza, w której powstaje najwięcej kodu – budowa kompletnego systemu,
  - Implementacja wszystkich pozostałych funkcjonalności,
  - Testowanie i integracja komponentów,
  - Przygotowanie do pierwszego wdrożenia (Initial Operational Capability).
4. *Faza przekazania (Transition):*
  - Instalacja systemu w środowisku produkcyjnym u klienta,
  - Szkolenia użytkowników, tworzenie instrukcji i migracja danych,
  - Poprawki błędów wykrytych po wdrożeniu oraz optymalizacja wydajności.

#info[
  Kluczową koncepcją wizualną RUP jest tzw. "wykres wieloryba" (hump chart).
  Obrazuje on, że *dyscypliny* (np. wymagania, kodowanie, testy) nie są przypisane do jednej fazy na sztywno (jak w Waterfallu).
  Wszystkie czynności wykonuje się przez cały projekt, ale ich *intensywność* zmienia się w czasie (np. najwięcej analizy jest na początku, a najwięcej kodowania w środku).
]

*Główne dyscypliny (Inżynieryjne):*
- *Modelowanie biznesowe* - Zrozumienie procesów biznesowych organizacji.
- *Wymagania* - Ustalenie co system ma robić (głównie poprzez Use Cases).
- *Analiza i projektowanie* - Przekształcenie wymagań w projekt architektury.
- *Implementacja* - Tworzenie kodu, struktury plików, kompilacja.
- *Testowanie* - Weryfikacja jakości i zgodności z wymaganiami.
- *Wdrożenie* - Dostarczenie oprogramowania do użytkownika końcowego.

*6 Najlepszych Praktyk RUP:*
+ *Rozwój iteracyjny* - Podział projektu na mniejsze cykle, aby szybciej wykrywać błędy i ryzyka.
+ *Zarządzanie wymaganiami* - Ścisła kontrola zmian w wymaganiach i ich dokumentowanie.
+ *Architektura oparta na komponentach* - Tworzenie modularnego systemu, co ułatwia testowanie i ponowne użycie kodu.
+ *Modelowanie wizualne (UML)* - Używanie standardu UML do graficznego przedstawiania struktury i zachowania systemu.
+ *Ciągła weryfikacja jakości* - Testowanie odbywa się w każdej iteracji, a nie tylko na końcu projektu.
+ *Kontrola zmian* - Zarządzanie konfiguracją i zmianami w kodzie oraz dokumentach (aby uniknąć chaosu przy pracy wielu osób).

=== Możliwe dopytania

- Zalety i wady scruma z punktu widzenia produktu i z punktu widzenia zespołu. (Godlewska)
- Co kanban mówi o releasach? (Manus) (Odp: Nic.)
- Co należy zrobić jeśli w scrumie interasariusz jest w innej strefie czasowej, nie ma z nim kontaktu? (Kuchta) (Odp: Robić prezentacje wyników na jakiś czas.)

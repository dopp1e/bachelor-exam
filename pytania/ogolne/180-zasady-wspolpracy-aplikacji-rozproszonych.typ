#import "@preview/gentle-clues:1.2.0": *
#import "../../res/question.typ": question

#show: question.with(
  q: "Zasady współpracy aplikacji rozproszonych z bazami danych."
)

/ Aplikacje rozproszone: Systemy które działają na wielu komputerach (węzłach) lub w chmurze (np. multum wirtualek amazonowych), które mogą wykonywać tą samą lub różne funkcje (np. obsługiwać żądania HTTP). Każdy z węzłów może potrzebować dostępu do bazy danych co wymaga specjalnej komunikacji między węzłami a bazą tak aby zapewnić spójność danych, wydajność dostępu i skalowalność systemu.  

W kontekście komunikacji wyzwaniem w zaprojektowaniu tej komunikacji jest zapewnienie trzech głównych cech, opisanych w CAP Theorem.

=== CAP Theorem

W aplikacjach rozproszonych, bazy danych mogą zapewniać maksymalnie dwa z trzech elementów:
- *Consistency* - Spójność czyli zapewnienie że węzły widzą te same dane,
- *Availability* - System zawsze działa i odpowiada na pytania,
- *Partition Tolerance* - System działa nawet jeżeli jego część nie działa np przez utratę komunikacji między węzłami.

Podczas projektowania systemu należy podjąć decyzje które cechy są dla nas najważniejsze (np. na podstawie wymagań biznesowych).
Jest to fizycznie niemożliwe żeby osiągnąć wszystkie 3 jednocześnie.
Możliwe kombinacje:
- *CA* - Czyli dane w systemie są spójne i zawsze jest do nich dostęp czego nie da się osiągnąć w systemach rozproszonych (czyli działa na jednym węźle, monolit),
- *CP* - Czyli dane są spójne i system jest rozproszony ale w celu zapewnienia spójności może być chwilowo niedostępny (System poczeka aż wszystko wróci do normy),
- *AP* - Czyli system jest nieprzerwanie dostępny i działa w sposób rozproszony kosztem niemożności zapewnienia spójności danych. (Czyli każdy węzeł może widzieć dane inaczej).

=== Eventual Consistency

W systemach rozproszonych *spójność ostateczna* to strategia zapewnienia osiągnięcia stanu zgodności danych z czasem, nawet jeśli przez pewien okres czasu będą one niespójne.
Jest to kompromis w systemach, gdzie priorytetem jest dostępność i tolerancja na podziały sieciowe AP, który pozwala systemowi działać wydajnie, nawet w warunkach rozproszonych i przypadku chwilowych niespójności danych.

=== Podejścia do zarządzania danymi w systemach rozproszonych

*ACID*

#info[
  Stosując ACID zapewniamy C i P z CAP.
]

1. *A* - *Atomicity*. Transakcja, czyli sekwencja działań jest wykonywana w sposób niepodzielny. Albo się wykonuje w całości albo wcale. 
  #info[
    *Przykład*: W przelewie bankowym kwota musi być odjęta z konta A i dodana do konta B w jednym kroku. Jeśli jedna z operacji się nie powiedzie, cała transakcja jest anulowana. 
  ]
2. *C* - *Consistency*. Spójność danych w znaczeniu przekształcania danych z jednego prawidłowego stanu do innego prawidłowego stanu. 
  #info[
  *Przykład*: Kiedy przelewamy pieniądze z konta A do B to musimy:
  - odjąć kwotę z konta A,
  - dodać tą kwotę do konta B.
  Jeżeli po pierwszej operacji byśmy przerwali, to byśmy doprowadzili dane do stanu nieprawidłowego (niespójnego) ponieważ nie możemy pozwolić na zniknięcie pieniędzy w systemie.
  ]
    
3. *I* - *Isolation*. Transakcje wykonywane równocześnie nie wpływają na siebie nawzajem. Transakcje nie widzą swoich zmian dopóki nie wykonają się w pełni. Każda akcja działa tak jakby była jedyną w tym momencie.   
  #info[
    W DBMSach, poziom izolacji transakcji definuje stopień w którym operacje jednej transakcji są odizolowane od operacji innych równocześnie wykonujących się transakcji. Czyli w skrócie definiuje kiedy i jak zmiany jednej transakcji są widoczne dla innych transakcji. Poziomy Izolacji sa wyjaśnione niżej.
  ]
    
4. *D* - *Durability*. Po zakóczeniu transakcji zmiany są trwałe, nawet w razie awarii. 
    
  #info[
    Przykład: Po zapisaniu przelewu kwota zostaje na nowym koncie nawet po ewentualnym restarcie systemu.
  ]

*Poziomy izolacji w bazach danych*

Zjawiska występujące w nieizolowanych transakcjach:
- *Dirty read* ("brudny odczyt") - transakcja odczyta daną której przetwarzanie przez inną transakcję się nie zakończyło. Jeśli druga transakcja się wycofa, to pierwsza transakcja będzie miała błędne dane.
- *Non Repeatable read* ("niepowtarzalne odczyty") - w jednej transakcji chcemy odczytać tę samą informację i uzyskujemy różne wyniki. Może to być spowodowane przez to że inna transakcja w tym samym czasie, między odczytami w pierwszej transakcji, zmieni tę informację.
- *Phantom read* ("fantomowy odczyt") - w ramach identycznych zapytań w trakcie jednej transakcji otrzymujemy różne zestawy wyników. Dzieje się tak gdy inna transakcja w międzyczasie doda lub usunie rekordy które spełniają warunki zapytania.

W związku z istnieniem zjawisk opisanych poniżej, w bazach SQL zdefiniowano 4 poziomy izolacji:
1. *Read Uncommitted* - Najniższy poziom izolacji w którym transakcje mogą sobie wchodzić w parade. Zero izolacji.
2. *Read Committed* - Nie pozwala na odczytywanie zmian które nie zostały jeszcze zatwierdzone, co zapobiega sytuacji, w której transakcja wprowadzi błędy w wyniku cofnięcia innej równoczesnej. Zapobiega brudnym odczytom.
3. *Repeatable read* - Transakcja blokuje przed odczytem lub zapisem dostęp do danych, z których korzysta. Ponieważ inne transakcje nie mają do niego dostępu, zapobiega to zachodzeniu niepowtarzalnych odczytów.
4. *Serializable* - Najwyższy poziom izolacji, w którym transakcje są wykonywane jedna po drugiej, jakby były szeregowane. Zapobiega wszystkim trzem zjawiskom: brudnym odczytom, niepowtarzalnym odczytom i fantomowym odczytom.

#figure(
  image("../../obrazki/db-izolacje.webp", width: 100%)
)

*BASE*

#info[
  Stosując BASE zapewniamy A i P z CAP.
]

- *BA* - *Basically Available* (podstawowa dostępność). System gwarantuje że żądania będą obsługiwane, nawet jeśli niektóre węzły systemu są niedostępne.
- *S* - *Soft state* (stan tymczasowy). Dane mogą być chwilowo niespójne w systemie, ale pozwala to na zwiększenie wydajności.
- *E* - *Eventually consistent* (ostatecznie spójna). Mimo chwilowych niespójności, dane w systemie rozproszonym z czasem osiągną stan spójny.

=== Strategie zarządzania awariami

*Fail-Fast*

Strategia Fail-Fast polega na jak najszybszym wykrywaniu i zgłaszaniu błędów aby uniknąć propagacji błędu.

Przykładowe użycie strategii fail-fast:
- Używanie wyjątków (throw i catch). Gdy metoda napotka problem (np. invalid operation exception), rzuca runtime exception i jego obsługa jest wykonywana przez komponent nadrzędny w bloku catch,
- Walidacja danych wejściowych. Jeśli użytkownik wprowadzi nieprawidłowe dane, natychmiast zwracany jest błąd zamiast kontynuowania przetwarzania.

=== Mechanizmy wykorzystywane przy awarii

*Time-Out*

Jest to mechanizm który ustawia maksymalny czas oczekiwania na odpowiedź od usługi (np. bazy danych, serwera).
Jeśli czas ten zostanie przekroczony, żądanie jest przerywane w celu uniknięcia zablokowaniu zasobów.
W przypadku przekroczenia, mogą być podejmowane akcje (np. ponowienie żądania, lub wyświetlenie komunikatu o problemie).

*Retry Policy*

Mechanizm który zawiera zestaw zasad dotyczących ponownej próby skorzystania z usługi w przypadku tymczasowego błędu (np. przeciążenie bazy danych, chwilowa utrata połączenia).
Liczba prób i czas między nimi jest konfigurowalna.
Przykładem jest Exponential Backoff, gdzie czas między próbami rośnie wykładniczo.

*Idempotencja*

Mechanizm polegający na tym że wielokrotne wykonanie tej samej operacji przyniesie ten sam efekt co jej pojedyncze wykonanie.
Przykładowo, call GET jest idempotentny ponieważ każde jego wywołanie nie zmienia stanu systemu.
W klasycznej realizacji REST API, operacja POST nie jest idempotentna ponieważ każde jej wywołanie ma jedynie zapewnić przeprocesowanie danych (np. utworzenie nowego zasobu) @fieldingHypertextTransferProtocol2014. 
Z kolei metoda PUT jest idempotentna, ponieważ wielokrotne wywołanie PUT z tymi samymi danymi nadpisze zasób do tego samego stanu.

=== Możliwe dopytania

- Jakie są kompromisy podczas realizacji CAP theorem - CA, CP, AP? (Manus)
- Zaprojektuj system rozproszony i określ jego wyzwania. (Czarnul) 
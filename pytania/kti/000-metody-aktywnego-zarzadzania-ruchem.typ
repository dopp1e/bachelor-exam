#import "../../res/question.typ": question

#show: question.with(
  q: "Metody aktywnego zarządzania ruchem w sieciach IP.",
)

=== Routing
Routing to proces wybierania i kierowania pakietów danych przez sieci komputerowe od źródła do celu, polegający na ustalaniu najoptymalniejszej ścieżki, co umożliwiają urządzenia zwane routerami i specjalne protokoły. Ma kluczowe znaczenie dla działania Internetu i dużych sieci, pozwala na efektywną wymianę danych, zarządzanie ruchem i dostosowywanie tras w razie awarii.

Routing można uznać za jedną z metod aktynwego zarządania ruchem w sieciach, ponieważ te algorytmy mogą dostosowywać i zarządzać trasami pakietów.
// Routing możemy dzielić na płaszczyznach takich jak:
// - *Statyczny/Dynamiczny*: wpisy są zdefiniowane w urządzeniach sieciowych/z wykorzystaniem protokołów lub algorytmów routingu
// - *Scentralizowany/Zdecentralizowany* -  decyzje o trasowaniu podejmowane w jednym centralnym urządzeniu/każde urządzenie samo sobie decyduje lokalnie
// - *Inteligentny/Naiwny* - podejmowanie decyzji w oparciu o złożone algorytmy i parametry łącza/proste systemy decydujące np. na zasadzie hopów
// Można też tutaj byłoby wymienić algorytmu routingu, ale już jest o tym pytanie "3.2 Protokoły routingu wewnątrz- i międzydomenowego - charakterystyka i porównanie."

=== Kolejkowanie pakietów
Kolejkowanie pakietów pozwala na zarządzanie buforem urządzeń sieciowych, co ma na celu zapobiec przeciążeniom i zapewniać jakość usług sieciowych.

Wybrane mechanizmy kolejkowania pakietów:
- *FIFO* _(ang. First In First Out)_;
- *Priority Queueing* - algorytmy kolejkowania operujące na koncepcie priorytetów;
- *Weighted Fair Queuing* - każda klasa ruchu otrzymuje proporcjonalny podział pasma.

W przypadku pakietów, które nie zmieszczą się w kolejce, można stosować różne strategie odrzucania:
- *Drop Tail* - odrzucanie pakietów, gdy kolejka jest pełna;
- *AQM (Active Queue Management)* - aktywne zarządzanie kolejkami, które pozwala na ograniczenie opóźnień pakietów poprzez redukcję wielkości kolejki;
- *RED (Random Early Detection)* - wczesne losowe odrzucanie pakietów zanim bufor się zapełni. Działa jak filtr dolnoprzepustowy, tłumiąc wybuchy wielkości kolejki. Chwilowe przeciążenia są rozwiązywane poprzez zwiększenie długości kolejek, a długotrwałe przeciążenia poprzez powiadamianie losowych połączeń o przeciążeniu (ECN lub odrzucanie losowych pakietów).

=== Zarządzanie pasmem
Zarządzanie pasmem to proces kontrolowania i optymalizacji dostępnej przepustowości sieci, aby zapewnić sprawiedliwy podział zasobów.

Przykładowe metody zarządzania pasmem to:
- *Limitowanie pasma* - pozwala na ograniczanie przepustowości pasma dla konkretnych urządzeń/aplikacji, ogólnie strumieni;
- *Token Bucket* - to metoda kształtowania ruchu sieciowego, która polega na "wpadaniu" tokenów (żetonów) do ograniczonego pojemnościowo kubełka w stałym tempie. Każdy pakiet danych lub jednostka "pobiera" jeden token, aby zostać przesłany; brak tokenów wstrzymuje ruch lub powoduje jego odrzucenie/opóźnienie, pozwalając na chwilowe "bursty", o ile kubełek jest pełny. Działa to jak bufor, który gromadzi rezerwę na chwilowe skoki obciążenia, zapewniając stabilne średnie natężenie przepływu. Dodatkowo istnieje wariant Hierarchical Token Bucket w którym wiadra mogą mieć rodzciów czy dzieci, który dodatkowo pozwala na "pożyczanie" tokenów od rodzica;
- *Band steering* - w sieciach bezprzewodowych można przenosić ruch sieciowy między pasmami (np. 2.4GHz -> 5GHz) w celu uzyskania lepszej jakości usług.

=== Congestion control
Mechanizm protokołu TCP dostosowywujący prędkość transmisji danych w zależności od przepustowości sieci. Operuje na tym, że w przypadku przeciążenia sieci kolejki buforów rosną co zwiększa opóźnienia i powoduje utratę pakietów. Nadawca może samodzielnie wykrywać przeciązenia i dostosowywać swoją prędkość.

Kluczowe pojęcia dla congestion control:
- *Congestion Window* - zmienna nadawcy określająca maksymalną liczbę niepotwierdzony bajtów "w locie";
- *Slow Start* - przesyłanie pakietów zaczyna się od niższej wartości congestion windows i zwiększa się wykładniczo;
- *Fast Recovery* - powolne zmniejszanie wartości congestion window, tak aby zaczynać od wyższej wartosci, a nie powtarzać slow start;
- *ECN (Explicit Congestion Notification)* - rozszerzenie do IP pozwalające na bezpośrednią sygnalizację wystąpienia przeciążenia. Zamiast odrzucania pakietów (jak w tradycyjnym TCP/IP), ECN ustawia znacznik w nagłówku IP informując o przeciążeniu, dzięki czemu pakiety nie muszą być odrzucane by uzyskać zachowanie kontroli przeciążenia.
=== Quality of Service
Quality of service to całość charakterystyk usługi telekomunikacyjnej stanowiących podstawę do wypełnienia wyrażonych i zaspokajanych potrzeb użytkownika tej usługi.

Mechanizmy QoS:
- *IPv4 TOS (type of service)* - pole w nagłówku, które kiedyś definiowało priorytet pakietu. Zastąpione później przez Differentiated Services Code Point (DSCP);
- *DiffServ* - architektura sieci przypisujące strumienie do danych klas usług. Działa na zasadzie oznaczania pakietów w nagłówku (6-bitowy DSCP w polu DS). Każda klasa ma swój PHB (Per Hop Behavior): Default Forwarding (best effort), Expedited Forwarding (najwyższy priorytet, niska utrata/opóźnienie), Assured Forwarding (12 klas z priorytetami i prawdopodobieństwem odrzucenia), Class Selector (8 klas dla kompatybilności wstecznej);
- *IntServ* - architektura sieci przypisujące zasoby dla konkretnych strumieni. Wykorzystuje protokół RSVP (Resource Reservation Protocol) do rezerwacji zasobów. Odbiorcy wysyłają PATH definiujący wymagane zasoby (Tspec), routery uczą się ścieżki, następnie odbiorcy odsyłają RESV wzdłuż tej ścieżki. Rezerwacje muszą być odświeżane (np. co 30 sekund). Ograniczona adopcja ze względu na wymagania dotyczące przechowywania stanu dla każdego przepływu.

#table(
  columns: (auto, 1fr, 1fr),
  inset: 10pt,
  align: horizon,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [*Cecha*], [*IntServ (Integrated Services)*], [*DiffServ (Differentiated Services)*],
  [Filozofia],
  [Rezerwacja: Rezerwuje zasoby na całej ścieżce przed transmisją.],
  [Priorytetyzacja: Oznacza pakiety i nadaje im priorytety.],

  [Granularność],
  [Per-flow: Rozpoznaje każdy pojedynczy strumień danych.],
  [Per-class: Grupuje ruch w ogólne kategorie (klasy).],

  [Skalowalność],
  [Niska: Routery muszą przechowywać stan każdego przepływu.],
  [Wysoka Routery obsługują tylko kilka zagregowanych klas.],

  [Sygnalizacja], [Wymaga protokołu RSVP.], [Wykorzystuje pole DSCP w nagłówku IPv4/IPv6.],
)

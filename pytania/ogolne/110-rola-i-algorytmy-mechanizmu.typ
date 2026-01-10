#import "../../res/question.typ": question

#show: question.with(
  q: "Rola i algorytmy mechanizmu szeregowania zadań w jądrze systemu operacyjnego."
)

System operacyjny to programowanie, które jest zarząądcą tego co się dzieje na komputerze. Jest odpowiedzialny za uruchamianie aplikacji oraz zarządzanie zasobami komputera (np. czas pracy procesora).

Centralnym elementem systemu operacyjnego jest *jądro systemu* (kernel), które dostarcza możliwość zarządzania zasobami sprzętowymi komputera i pośredniczy w komunikacji między sprzętem a oprogramowaniem. Wykonuje zadania takie jak:

- zarządzanie pamięcią (alokowanie pamięci i zwalnianie),
- zarządzanie procesami,
- zarządzanie urządzeniami.

System operacyjny zapewnia sobie dostęp poprzez mechanizm *wywłaszczania* (przerywanie proecsu i przełączanie kontekstu). System operacyjny robi to za pomocą przerwań systemowych, które wykonywane są co kwant czasu. Scheduler może wtedy decydować co dalej zrobić procesem.

*Scheduler (planista)* - element należący do jądra systemu operacyjnego, który jest odpowiedzialny za zarządzanie czasem procesora. Scheduler odpowiada za szeregowanie zadań, czyli określa priorytet procesu, w którym zostanie uznane pierwszeństwo wykonania. Do głównych zadań schedulera należą:

1. Zarządzanie procesorem i obsługa wielozadaniowości - przydzielanie czasu procesora zadaniom w systemi oraz efektywne przełączanie kontekstu między nimi.
2. Zapewnienie wydajności:
    - minimalizacja opóźnień (latency),
    - maksymalizacja przepustowości (throughput),
    - minimalizacja czasu odpowiedzi (response time).
3. Zarządzanie priorytetami - wykonywanie procesów o wyższych priorytetach w odpowiednim czasie w sposób zrównoważony.
4. Zapewnienie sprawiedliwości - każdy proces ma prawo do korzystania z procesora. Planista musi pilnować żeby nie doszło do problemu zagłodzenia.

=== Algorytmy szeregowania

#grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      *FIFO* - jeden z najprostszych algorytmów szeregowania. Pierwsze procesy są obsługiwane jako pierwsze. Działa bez wywłaszczania.
    ],
    image("../../res/fifo.webp", width: 6cm)
)

#grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      *SJF (shortest job first)* - szeregowane na podstawie przewidywanego czasu ich wykonania. Działa bez wywłaszczania.
    ],
    image("../../res/sjf.webp", width: 6cm)
)


#grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      *STCF (shortest time to completion first)* - podobnie do SJF, najszybciej robione są te zadania, które są najkrótsze do wykonania. Działa z wywłaszczaniem.
    ],
    image("../../res/stcf.webp", width: 6cm)
)


#grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      *Round Robin* - Planowanie rotacyjne, w którym każdy proces otrzymuje równy kwant czasu na wykonaniu. Po wykonaniu proces jest przenoszony na koniec kolejki. Działa z wywłaszczaniem.
    ],
    image("../../res/roundrobin.webp", width: 6cm)
)


#grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      *MLQ (Multilevel Queue)* - trzy różne kolejki w zależności od priorytetów. Każda kolejka ma własny algorytm szeregowania (np. FIFO, Round Robin). Często dochodzi do głodzenia procesów.
    ],
    image("../../res/mlq.webp", width: 6cm)
)

#grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      *MLFQ (Multilevel Feedback Queue)* - rozszerzenie MLQ, pozwala dynamicznie przenosić procesy między kolejkami w zależności od ich zachowania.
    ],
    image("../../res/mlq.webp", width: 6cm)
)


#{
  set text(hyphenate: false, size: 9pt)
  set par(justify: false)
  table(
    columns: (auto, 1fr, 1fr, 1fr),
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
      [*Algorytm*], [*Zalety*], [*Wady*], [*Zastosowanie*]
    ),

    [*FIFO*], 
    [Proste do zaimplementowania], 
    [Może prowadzić do efektu konwoju (długie procesy blokują krótsze)], 
    [Systemy wsadowe],

    [*SJF*], 

    [Minimalizuje średni czas oczekiwania], 
    [Trudności w przewidywaniu czasu wykonania; możliwość głodzenia dłuższych procesów. Możliwość konwoju], 
    [Preferowany w systemach wsadowych],

    [*STCF*], 
    [Takie jak SJF], 
    [Takie jak SJF, tylko eliminuje problem konwoju], 
    [],

    [*Round Robin*], 
    [Sprawiedliwy, dobry w systemach interaktywnych], 
    [Wybór zbyt krótkiego lub zbyt długiego kwantu czasu może wpływać na wydajność systemu], 
    [Powszechnie używany w systemach interaktywnych],

    [MLFQ], 
    [Elastyczny i dostosowujący się do wymagań procesów], 
    [Ryzyko zagodzenia, gdy aplikacje interaktywne nie dopuszczają zadań o niższym priorytecie; można oszukać planiste], 
    [Stosowane w Windowsie i MacOS, zaawansowane systemy wielozadaniowe i interaktywne],
  )
}

=== Sprawiedliwe szeregowanie

W sprawiedliwym szeregowaniu planista nie zajmuje się optymalizowaniem pod kątem metryk czasu cyklu przetwarzania i czasu odpowiedzi. Zapewnia tylko, że każde zadanie otrzyma pewną część czasu CPU. Wyróżnia się *szeregowanie losowe* i *szeregowanie krokowe*.

#grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      *Szeregowanie losowe* - każdy proces otrzymuje pewną liczbę losów. Planista w danym momencie losuje liczbę i wylosowana liczba określa który proces będzie uruchomiony. W zależności od priorytetu, może to być więcej lub mniej losów. To szeregowanie jest niedeterministyczne.
    ],
    image("../../res/szeregowanielosowe.webp", width: 6cm)
)
#grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      *Szeregowanie krokowe (stride scheduling)* - planista wybiera proces o najmniejszej wartości kroku. Każdy proces ma przypisaną wartość wzrostu kroku i ogólną wartość kroku, którą planista zwiększa po wykonaniu na procesorze. Im wyższy priorytet, tym niższa wartość zwrostu kroku. To szeregowanie jest deterministyczne.
    ],
    image("../../res/szeregowaniekrokowe.webp", width: 6cm)
)

=== Możliwe dopytania

- Rozwinąć część dotyczącą roli - do czego to służy i po co jest tyle tych algorytmów? (Matuszek)
- Czy FIFO i SJF są gdzieś używane? (Szwoch) (odp: Systemy wsadowe.)
- Co ma najwyższy priorytet w obsłudze? (Szwoch) (odp: Mechanizmy żądań.)
- Jak mierzy się czas przetwarzania zadania? (Manus) (część odp: Dawno temu w systemach wsadowych gość obsługujący karty perforowane widział jak dużo kodu na niej jest.)

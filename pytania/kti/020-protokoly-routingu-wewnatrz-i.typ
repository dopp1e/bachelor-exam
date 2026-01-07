#import "../../res/question.typ": question

#show: question.with(
  q: "Protokoły routingu wewnątrz- i międzydomenowego - charakterystyka i porównanie."
)

Protokoły routingu są odpowiedzialne za wyznaczanie tras przesyłania danych w sieciach komputerowych. Można je podzielić na protokoły routingu wewnątrzdomenowego (Interior Gateway Protocols, IGP) oraz protokoły routingu międzydomenowego (Exterior Gateway Protocols, EGP).

=== Routingi wewnątrzdomenowe (IGP)
*Charakterystyka:*
- stosowane w obrębie jednej autonomicznej domeny (AS), czyli sieci zarządzanej przez jedną organizację lub operatora (zakłada że wszystkie routery wewnątrz AS działają w dobrej wierze),
- główne zadanie to wybór najlepszej trasy dla pakietów danych wewnątrz tej samej domeny administracyjnej,
- koncentrują się na szybkości i wydajności, muszą szybko reagować na zmiany topologii sieci (np. awarie).

*Przykłady:*
- *RIP (Routing Information Protocol):*
  - oparty o algorytm *distance-vector* - zna tablicę tras tylko swoich bezpośrednich sąsiadów,
  - ograniczona skala (maksymalnie 15 przeskoków),
  - wolna konwergencja i podatność na pętle bez wykorzystania technik zapobiegawczych np. *split horizon*(zapobieganie rozgłaszaniu informacji o trasie do interfejsu, z którego ta informacja została otrzymana), route poisoning (oznaczanie nieosiągalnych tras maksymalną metryką).
- *OSPF (Open Shortest Path First):*
  - oparty o algorytm *link-state* - każdy router zna pełną topologię sieci w obrębie swojej strefy,
  - wykorzystuje algorytm Dijkstry do wyznaczania najkrótszej ścieżki,
  - szybka konwergencja i większa niezawodność niż w *RIP*.
- *EIGRP (Enhanced Interior Gateway Routing Protocol):*
  - hybrydowy protokół łączący cechy *distance-vector* i *link-state*,
  - specyficzny dla urządzeń Cisco (zamknięty standard).

*Distance-vector:*
- żaden router nie ma pełnej wiedzy o topologii sieci,
- informacje wymieniane są jedynie między sąsiednimi routerami. Zbieżność algorytmu jest osiągana przyrostowo w całej sieci, co każdy interwał aktualizacji,
- bazuje na algorytmie Bellmana-Forda do wyznaczania najlepszej trasy.

*Link-state:*
- każdy router posiada pełną mapę topologii sieci,
- informacje o stanie łączy są rozgłaszane do wszystkich routerów w sieci,
- algorytm osiąga zbieżność niezależnie, osobno dla każdego routera,
- bazuje na algorytmie Dijkstry do wyznaczania najkrótszej ścieżki.

=== Routingi międzydomenowe (EGP)
*Charakterystyka:*
- Stosowane do wymiany informacji o trasach między różnymi autonomicznymi systemami (AS),
- główne zadanie to zarządzanie routingiem między sieciami należącymi do różnych organizacji lub operatorów,
- oparty na politykach wybór trasy nie jest zależny tylko od metryk technicznych, ale także od umów handlowych i preferencji administracyjnych,
- brak metryk takich jak liczba przeskoków czy opóźnienie, zamiast tego używa się atrybutów polityki routingu.

Jedyny wykorzystywany protokół to *BGP (Border Gateway Protocol):*
- jedyny szeroko wykorzystywany protokół EGP,
- wykorzystuje algorytm path-vector,
- pozwala na stosowanie złożonych polityk routingu, takich jak preferencje tras na podstawie długości AS-path, lokalnych preferencji czy opłat za łącza,
- skalowalny i stabilny, ale bardziej złożony w konfiguracji i zarządzaniu niż IGP.

*Path-vector w kontekście BGP:*
- zawiera informacje o dostępnych sieciach oraz pełną ścieżkę (listę AS-ów) do tych sieci,
- nie zawiera informacji o fizycznym dystansie czy koszcie trasy zamiast tego skupia się na politykach routingu,
- umożliwia zapobieganie pętlom routingu poprzez analizę AS-path,
- używany głównie dla sieci rozległych jak internet, dzięki wymianie tras między AS.

=== Porównanie IGP i EGP
#table(
  columns: (auto, 1fr, 1fr),
  inset: 10pt,
  align: horizon,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [*Cecha*], [*IGP*], [*EGP*],
  [Obszar działania], [Wewnątrz jednej domeny autonomicznej (AS)], [Między różnymi domenami autonomicznymi (AS)],
  [Protokoły], [RIP, OSPF, EIGRP], [BGP],
  [Cel routingu], [Optymalizacja tras wewnątrz sieci], [Zarządzanie trasami między sieciami],
  [Kryterka wyboru trasy], [Metryki techniczne (np. liczba przeskoków, opóźnienie)], [Polityki routingu i atrybuty],
  [Skalowalność], [Mniejsza, odpowiednia dla sieci lokalnych i kampusowych], [Duża, odpowiednia dla globalnych sieci operatorskich],
  [Złożoność konfiguracji], [Prostsza], [Bardziej złożona],
  [Szybkość konwergencji], [Szybsza (szczególnie dla OSPF i EIGRP)], [Wolniejsza, ale dostosowana do rozległych sieci]
)

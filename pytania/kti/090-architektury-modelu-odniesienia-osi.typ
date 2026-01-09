#import "../../res/question.typ": question

#show: question.with(
  q: "Architektury Modelu Odniesienia OSI oraz TCP/IP; podobieństwa i różnice."
)

#set text(lang: "pl", font: "linux libertine", size: 9pt)

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt + gray,
  inset: 8pt,
  fill: (col, row) => if row == 0 { gray.lighten(80%) } else { white },
  
  [*ISO-OSI*], [*TCP-IP*],

  [
    *Warstwa aplikacji*
    - obsługa użytkownika
    - transmisja plików
    - dostęp do baz danych
    - zarządzanie transmisją
    - rozsyłanie poczty
    
    *Warstwa prezentacji*
    - przekształcanie danych użytkownika do danych w postaci stosowanej w sieci
    - zabezpieczenia kryptograficzne
    - kompresja danych
    
    *Warstwa sesji*
    - nawiązywanie i rozwiązywanie sesji
    - dialog między procesami
    - sockety
  ],
  [
    *Warstwa aplikacji*
    - procesy i protokoły użytkowe (np. HTTP, SMTP, FTP)
    - funkcje realizowane są w stacjach końcowych a nie specjalnie wydzielonych pośredniczących (jak w OSI)
    - jednostka danych: *strumienie (TCP), wiadomości (UDP)*
  ],

  [
    *Warstwa transportowa*
    - niezawodny i przezroczysty przekaz danych end-to-end
    - wykrywanie i retransmisja błędnych danych
    - sterowanie przepływem
  ],
  [
    *Warstwa transportowa*
    - protokoły TCP, UDP
    - jednostki danych - *segmenty (TCP), pakiety (UDP)*
    - *NACHODZI NA WARSTWĘ SESJI*
  ],
  [
    *Warstwa sieciowa*
    - routing
    - ochrona sieci przed przeciążeniami
    - łączenie heterogenicznych sieci
    - segmentacja/resegmentacja pakietów
    - przezroczysty przekaz danych (brak ingerencji)
    - wyróżnia się podwarstwę współpracy międzysieciowej
  ],
  [
    *Warstwa międzysieciowa*
    - enkapsulacja datagramów w ramki
    - odwzorowywanie adresów IP na fizyczne
    - przesyłanie pakietów/segmentów
    - defragmentacja pakietów/segmentów
    - protokół pomocniczy ICMP
    - protokół IP
  ],
  [
    *Warstwa łącza danych*
    - tworzenie ramek
    - niezawodny przekaz ramek kanałem cyfrowym
    - sterowanie dostępem do medium komunikacyjnego
    - dzieli się na podwarstwy LLC (podwarstwa kanału logicznego, konwersja warstwa sieciowa <-> dany protokół typu Ethernet, WiFi) i MAC (dostęp do medium)
  ],
  [
    *Warstwa dostępu do sieci*
    - komutacja pakietów
    - bezpołączeniowość
    - jednostka danych: *ramki*
    - rozwiązania np. Ethernet, WiFi, SONET
    - *NACHODZI NA WARSTWĘ SIECIOWĄ*
  ],

  [
    *Fizyczna*
    - przekaz ciągów bitów między stacjami
    - dostosowanie postaci sygnałów do właściwości medium (np. czy full-duplex, techniki modulacji)
    - dzieli się na podwarstwy PHY (protokół warstwy fizycznej) i PMD (podwarstwa dopasowania do medium fizycznego)
    - np. 100BaseTX
  ],
  [
    *Fizyczna* (nie ma tej warstwy w TCP). To nie jest tak, że w TCP/IP warstwy fizycznej nie ma tylko warstwa dostępu do sieci/łącza danych realizuje również jej funkcje.
  ]
)



=== Podobieństwa między modelami
- *Oparcie na idei protokolów warstwowych* – oba modele dzielą komunikację sieciową na warstwy, z których każda ma określone funkcje i zadania, co umożliwia modułowe podejście do projektowania i implementacji.
- *Orientacja warst powyżej transportowej na aplikacje* - w obu modelach warstwy powyżej transportowej (warstwa sesji, prezentacji i aplikacji w OSI oraz warstwa aplikacji w TCP/IP) koncentrują się na dostarczaniu usług bezpośrednio użytkownikowi końcowemu.
- *Zapewnienie dwupunktowej komunikacji na warstwach poniżej transportowej* – zarówno OSI, jak i TCP/IP dążą do umożliwienia niezawodnej komunikacji między procesami na różnych użądzeniach za pomocą warstw niższego poziomu.

=== Różnice między modelami
- *Cel powstania*:
  - ISO-OSI: Model odniesienia stworzony do projektowania sieci, a nie jako opis konkretnego istniejącego rozwiązania. Powstał przed implementacją odpowiadających mu protokołów, dlatego zawiera wiele elementów niewykorzystywanych w praktyce.
  - TCP/IP: Model protokołów wywodzący się z ewolucji sieci ARPANET, opisujący konkretne rozwiązanie stosowane w Internecie.
- *Zastosowanie*:
  - ISO-OSI: Jest bardziej uniwersalny i może być używany do opisu różnych architektur sieciowych.
  - TCP/IP: Ograniczony do opisu sieci bazujących na tych protokołach.
- *Ewolucja i zmiany*:
  - ISO-OSI: Pozostaje teoretycznym modelem bez bezpośredniego wpływu na rozwój technologii.
  - TCP/IP: Rozwija się w ścisłej korelacji z potrzebami Internetu.
- *Realizacja funkcji sieciowych*:
  - ISO-OSI: Funkcje mogą być realizowane zarówno w urządzeniach końcowych, jak i pośredniczących.
  - TCP/IP: Funkcje sieciowe są głównie realizowane w stacjach końcowych (krótko).
    - (DŁUŻEJ) W modelu TCP/IP mechanizmy zapewniające niezawodność komunikacji end-to-end (takie jak retransmisja, kontrola przepływu i przeciążenia) zostały przeniesione do warstwy transportowej i są realizowane przez systemy końcowe, podczas gdy warstwy sieciowe realizują transmisję typu best-effort. Umożliwia to uproszczenie wnętrza sieci i jest zgodne z zasadą End-to-End.
- *Architektura vs model*:
  - ISO-OSI: Jest teoretycznym modelem opisującym funkcje poszczególnych warstw, ale nie definiuje konkretnych protokołów.
  - TCP/IP: Jest architekturą sieci, która określa konkretne protokoły w każdej warstwie.
- *Tryby połączeniowe w warstwie sieciowej:*
  - ISO-OSI: Obsługuje zarówno tryb połączeniowy, jak i bezpołączeniowy w warstwie sieciowej.
  - TCP/IP: Warstwa sieciowa (IP) jest bezpołączeniowa.
- *Liczba warstw*:
  - ISO-OSI: Składa się z siedmiu warstw, z wyraźnym podziałem funkcji między nimi.
  - TCP/IP: Składa się z czterech warstw, które są bardziej zintegrowane i elastyczne w realizacji funkcji.
- *Zasada przysłaniania w górę i przezroczystości w dół warstw:*
  - ISO-OSI: Idąc w górę wyższa warstwa nie zna szczegółów warstwy niższej. Idąc w dól warstwa niższa nie powinna modyfikować, ani odczytywać nagłówków warstwy wyższej.
  - TCP/IP: Ze względu na praktykę implementacji, czasem łamie te zasady np. tworząc aplikacje musimy się przejmować każdą warstwą TCP/IP poprzez np:
    - Wybór warstwy transportowej, jej parametrów, adresu, portu, potrzebna jest również wiedza czy transmisja jest połączeniowa, niezawodna.
    - Wybór wersji IP po której przeprowadzamy transmisję (IPv4/IPv6)
- *Zasada komunikacji wyłącznie między sąsiednimi warstwami, ścisła odpowiedzilność warstw:*
  - ISO-OSI: Komunikacja odbywa się tylko między sąsiednimi warstwami.
  - TCP/IP: Ze względu na praktykę łamie tę zasadę np:
    - MPLS jest technologią typu "Layer 2.5", która zastępuje tradycyjne trasowanie IP w rdzeniu sieci mechanizmem przełączania etykiet (Label Switching). MPLS enkapsuluje pakiety warstwy 3, dodając własny nagłówek pomiędzy L2 i L3.
    - ARP pełni funkcję pomocniczą na styku warswy 2 i 3. Jego zadaniem jest mapowanie adresów IP na adresy MAC, bez czego komunikacja IPv4 w sieciach Ethernet nie byłaby możliwa.
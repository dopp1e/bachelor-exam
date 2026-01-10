#import "../../res/question.typ": question

#show: question.with(
  q: "Architektury Modelu Odniesienia OSI oraz TCP/IP; podobieństwa i różnice."
)
#block(breakable: false)[
#text(lang: "pl", font: "linux libertine", size: 9pt)[
#grid(
  columns: (24pt, 1fr, 1fr, 24pt),
  stroke: 0.5pt + luma(200),
  inset: 8pt,
  fill: (col, row) => if row == 0 { rgb("#aaaaaa") },
  grid.cell([*ISO-OSI*], colspan: 2), grid.cell([*TCP-IP*], colspan: 2),
  grid.cell(align(horizon)[#rotate(270deg, reflow: true)[*Warstwy~aplikacyjne*]], rowspan: 3),
  [
    #align(center)[*Warstwa aplikacji*]
    - Obsługa użytkownika,
    - Transmisja plików,
    - Dostęp do baz danych,
    - Zarządzanie transmisją,
    - Rozsyłanie poczty.
  ],
  grid.cell([
    #align(center)[*Warstwa aplikacji*]
    - Procesy i protokoły użytkowe (np. HTTP, SMTP, FTP),
    - Funkcje realizowane są w stacjach końcowych a nie specjalnie wydzielonych pośredniczących (jak w OSI),
    - Jednostki danych: *strumienie (TCP), wiadomości (UDP)*.
  ], rowspan: 3),
  grid.cell(align(horizon)[#rotate(270deg, reflow: true)[*Protokoły*]], rowspan: 3),
  [
    #align(center)[*Warstwa prezentacji*]
    - Przekształcanie danych użytkownika do danych w postaci stosowanej w sieci,
    - Zabezpieczenia kryptograficzne,
    - Kompresja danych.
  ],[  
    #align(center)[*Warstwa sesji*]
    - Nawiązywanie i rozwiązywanie sesji,
    - Dialog między procesami,
    - Sockety.
  ],
  grid.cell(align(horizon)[#rotate(270deg, reflow: true)[*Warstwy~przepływu~danych*]], rowspan: 4),
  [
    #align(center)[*Warstwa transportowa*]
    - Niezawodny i przezroczysty przekaz danych end-to-end,
    - Wykrywanie i retransmisja błędnych danych,
    - Sterowanie przepływem.
  ],
  [
    #align(center)[*Warstwa transportowa*]
    - Protokoły TCP, UDP,
    - Jednostki danych - *segmenty (TCP), pakiety (UDP)*,
    - Nachodzi na warstwę sesji ISO-OSI.
  ],
  grid.cell(align(horizon)[#rotate(270deg, reflow: true)[*Sieci*]], rowspan: 4),
  [
    #align(center)[*Warstwa sieciowa*]
    - Routing,
    - Ochrona sieci przed przeciążeniami,
    - Łączenie heterogenicznych sieci,
    - Segmentacja/resegmentacja pakietów,
    - Przezroczysty przekaz danych (brak ingerencji),
    - Wyróżnia się podwarstwę współpracy międzysieciowej.
  ],
  [
    #align(center)[*Warstwa międzysieciowa*]
    - Enkapsulacja datagramów w ramki,
    - Odwzorowywanie adresów IP na fizyczne,
    - Przesyłanie pakietów/segmentów,
    - Defragmentacja pakietów/segmentów,
    - Protokół pomocniczy ICMP,
    - Protokół IP.
  ],
  [
    #align(center)[*Warstwa łącza danych*]
    - Tworzenie ramek,
    - Niezawodny przekaz ramek kanałem cyfrowym,
    - Sterowanie dostępem do medium komunikacyjnego,
    - Dzieli się na podwarstwy LLC (podwarstwa kanału logicznego, konwersja warstwa sieciowa <-> dany protokół typu Ethernet, WiFi) i MAC (dostęp do medium).
  ],
  [
    #align(center)[*Warstwa dostępu do sieci*]
    - Komutacja pakietów,
    - Bezpołączeniowość,
    - Jednostka danych: *ramki*,
    - Rozwiązania np. Ethernet, WiFi, SONET,
    - Nachodzi na warstwę sieciową ISO-OSI.
  ],

  [
    #align(center)[*Warstwa fizyczna*]
    - Przekaz ciągów bitów między stacjami,
    - Dostosowanie postaci sygnałów do właściwości medium (np. czy full-duplex, techniki modulacji),
    - Dzieli się na podwarstwy PHY (protokół warstwy fizycznej) i PMD (podwarstwa dopasowania do medium fizycznego),
    - Np. 100BaseTX.
  ],
  [
    #align(center)[*Warstwa fizyczna*]
    Nie jest tak, że w TCP/IP warstwy fizycznej nie ma, tylko warstwa dostępu do sieci / łącza danych realizuje również jej funkcje.
  ]
)
]
]
=== Podobieństwa między modelami
- *Oparcie na idei protokolów warstwowych* - oba modele dzielą komunikację sieciową na warstwy, z których każda ma określone funkcje i zadania, co umożliwia modułowe podejście do projektowania i implementacji.
- *Orientacja warst powyżej transportowej na aplikacje* - w obu modelach warstwy powyżej transportowej (warstwa sesji, prezentacji i aplikacji w OSI oraz warstwa aplikacji w TCP/IP) koncentrują się na dostarczaniu usług bezpośrednio użytkownikowi końcowemu.
- *Zapewnienie dwupunktowej komunikacji na warstwach poniżej transportowej* - zarówno OSI, jak i TCP/IP dążą do umożliwienia niezawodnej komunikacji między procesami na różnych użądzeniach za pomocą warstw niższego poziomu.

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
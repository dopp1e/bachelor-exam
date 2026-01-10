#import "../../res/question.typ": question

#show: question.with(
  q: "Porównanie sieci LAN i WAN."
)

*LAN* (Local Area Network) - sieć komputerowa łącząca komputery na określonym, ograniczonym obszarze jak np. szkoła czy biuro.

*WAN* (Wide Area Network) - sieć komputerowa łącząca ze sobą sieci LAN. Ta sieć komputerowa jest na tyle rozległa że obejmuje obszar wykraczający poza tereny miasta, kraju a nawet kontynentu.

#{
  set text(hyphenate: false, size: 9pt)
  set par(justify: false)
  table(
  columns: (18%, 41%, 41%),
  inset: 10pt,
  align: horizon,
  stroke: 0.5pt + luma(200),
  
  fill: (col, row) => 
    if row == 0 { rgb("#aaaaaa") } 
    else if calc.even(row) { rgb("#f5f6fa") } 
    else { white },

  table.header(
    [Cecha], [LAN (Local Area Network)], [WAN (Wide Area Network)]
  ),

  [Zakres Geograficzny],
  [
    *Lokalny* \
    Obejmuje np. budynek, biuro. \
    Zasięg: do kilkuset metrów.
  ],
  [
    *Globalny* \
    Obejmuje kraj lub kontynent. \
    Zasięg: tysiące kilometrów.
  ],

  [Szybkość i przepustowość],
  [
    *Znacznie szybsza* \
    Od kilku do kilkuset Gb/s dla pojedynczego użytkownika.
  ],
  [
    *Wolniejsza* \
    Ze względu na odległości i ilość danych. \
    Zazwyczaj do kilkunastu/kilkuset Mb/s.
  ],

  [Opóźnienia],
  [
    *Niskie* \
    Maksymalne opóźnienie jest zazwyczaj przewidywalne i znane z góry.
  ],
  [
    *Wysokie / Zmienne* \
    Sieci WAN wprowadzają znaczne opóźnienia ze względu na długie dystanse.
  ],

  [Koszty i zarządzanie],
  [
    *Niskie* \
    Zarządzanie odbywa się lokalnie, infrastruktura prywatna.
  ],
  [
    *Ogromne* \
    Wymaga budowania infrastruktury na skalę globalną lub dzierżawienia łączy.
  ],

  [Bezpieczeństwo],
  [
    *Wysokie* \
    Mała liczba urządzeń, trudniejszy fizyczny dostęp dla osób niepowołanych.
  ],
  [
    *Niskie / Umiarkowane* \
    Duża liczba urządzeń, łatwość podłączenia, dane przesyłane przez sieci publiczne.
  ],

  [Struktura adresów],
  [
    *"Płaska adresacja"* \
    Wspólna przestrzeń adresowa. Urządzenia mają unikalne ID, ale nie są dzielone na skomplikowane segmenty logiczne.
  ],
  [
    *Hierarchiczna* \
    Zorganizowany system warstwowy, w którym adresy są grupowane w agregowalne bloki (np. kontynent -> operator -> klient), co umożliwia efektywny routing w skali globalnej.
  ],
  [Technologie],
  [
    - Ethernet
    - Wi-Fi
  ],
  [
    - Technologie mobilne (4G/5G)
    - Łącza satelitarne
    - Protokoły: SONET, SDH, ATM, Frame Relay, MPLS
  ],

  [Topologie],
  [
    - Gwiazda
    - Magistrala
    - Pierścień
    - Siatka
  ],
  [
    - Punkt-punkt
    - Pierścień
    - Siatka
  ],

  [Urządzenia],
  [
    *Służące do komunikacji wewnętrznej:*
    - *Switche:* Łączą komputery wewnątrz sieci.
    - *Access Pointy:* Punkty dostępu Wi-Fi.
    - *Huby:* Proste koncentratory (warstwa fizyczna).
    - *Mosty (Bridges):* Łączą segmenty LAN.
  ],
  [
    *Służące do komunikacji zewnętrznej i styku sieci:*
    - *Routery:* Łączą sieci LAN i kierują ruchem WAN.
    - *Modemy:* Konwersja sygnału (analog/cyfra).
    - *Firewalle:* Zapory sieciowe i bezpieczeństwo.
    - *Bramy (Gateways):* Tłumaczenie protokołów między systemami.
  ],

  [Skalowalność],
  [
    Dodanie nowego urządzenia jest proste i tanie.
  ],
  [
    Zależna od infrastruktury:
    - Prosta przy użyciu sieci publicznych.
    - Trudna i kosztowna przy budowie własnych łączy na duże odległości.
  ]
)
}

=== Możliwe dopytania

- Dwa typowe urządzenia dla LAN i dla WAN. (Manus)
- Czy sieć politechniczna jest siecią LAN? (Manus, wg. niego nie)
- Używane technologie. (Przybyła)
- Jakie są różnice w topologii sieci? (Gumiński) (odp: W WAN wiele kabli (redundancja), LAN zwykle pojedyncze. WAN nie ma większej stopy błędów.)
- Wartości przepustowości sieci LAN i WAN (Proficz) (odp: LAN - kilka do kilkuset Gb/s, WAN - kilkaset Gb/s do Tb/s)
- Protokoły warstwy sieci drugiej. (Proficz)

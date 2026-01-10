#import "../../res/question.typ": question

#show: question.with(
  q: "Metody obsługi mobilności w sieciach IP; motywacja, przykłady, porównanie z mechanizmami przełączania w sieciach Wi-Fi."
)

Motywacją jest utrzymywanie aktywnych sesji sieciowych podczas zmiany lokalizacji, zapewnieni ciągłości usług, redukcji opóźnień i przerw w dostępie do sieci.

#image("../../obrazki/homeagent.png")

Elementy *Mobile IP dla IPv4*:
- *Home Agent* - serwer w siecie macierzystej urządzenia mobilnego, który przechowuje informacje o jego lokalizacji i przekazuje pakiety,
- *Foreign Agent* - serwer w sieci obcej, do której aktualnie podłączony jest host mobilny,
- *Mobile Node* - urządzenie mobilne,
- *Care-of Address* - tymczasowy adres przypisywany hostowi mobilnemu w obcej sieci,
- *Correspondent Node* - dowolny węzeł sieciowy który komunikuje się z *Mobile Node*.

Proces działania:
1. *Mobile Node* szuka *Foreign Agent*, który przydzieli mu *Care of Address*. Teraz *Foreign Agent* działa jak takie "proxy".
2. *Mobile Node* rejestruje się u *Home Agent*, informując go o swoim *Care-of Address* w obcej sieci.
3. Pakiety wysyłane na stały adres IP hosta mobilnego (adres domowy) są przesyłane do Home Agent, po czym:
    - są enkapsulowane przez *Home Agent* i przesyła je do Care-of Address hosta mobilnego,
    - *Foreign Agent* odbiera pakiety, dekapsuluje je i dostarcza do hosta mobilnego.
4. Odpowiadając, *Mobile Node* odpowiada wprost do *Correspondent Node* wpisując w nagłówku IP adres źródłowy jako swój *Home Address*.


=== Problem routingu trójkątnego

Routing trójkątny polega na tym, że pakiety kierowane do węzła mobilnego najpierw trafiają do Home Agenta, a dopiero potem do jego Care-of Address, co może tworzyć nieoptymalną trasę.
Mobile IPv6 eliminuje ten problem dzięki mechanizmowi *Route Optimization*, który umożliwia korespondentowi wysyłanie pakietów bezpośrednio na aktualny Care-of Address węzła mobilnego.


=== Przełączanie Wi-Fi

Motywacją dla mobilności w *Wi-Fi* jest konieczność pokrycia zasięgiem obszarów większych niż zasięg pojedynczego punktu dostępowego (kampusy, biura, magazyny) oraz zwiększenie pojemności sieci (obsługa większej liczby użytkowników poprzez podział na mniejsze komórki). Kluczowe jest zapewnienie roamingu bez konieczności ponownego uwierzytelniania i pobierania adresu IP.
Sieci Wi-Fi są w warstwie drugiej. Nie ma trasowania, więc przełączanie nie ma wiele wspólnego z Mobile IP, oprócz tego, że *Mobile Node* przemieszcza się w przestrzeni i zmienia punkt podłączenia do sieci. Przełączanie w Wi-Fi ma za zadanie zwiększyć zasięg sieci Wi-Fi oraz ilość obsługiwanych użytkowników, poprzez użycie więcej access pointów. 
*BSSID* - adres konkretnego access pointa.
*SSID* - nazwa sieci.
==== Handover

Handover to domyślny sposób przełączania pomiędzy nadajnikami, w którym klient decyduje o wybraniu z którym access pointem się łączy.
Minusy:
- przy przełączaniu mogą następować utraty połączenia,
- klient może trzymać się słabszego access pointa, mimo istnienia dla niego lepszego wyboru.

==== Virtual Cell

Przy *Virtual Cell* wszystkie AP mają ten sam BSSID. To kontroler decyduje, który AP będzie odpowiedzialny za komunikację. Z punktu widzenia klienta przejście między AP jest niewidoczne (*0-handoff*).

Plusy:
- *0-handoff*,
- klient nie trzyma się gorszego AP.
Minusy:
- cała komunikacja odbywa się na jednym kanale.

==== Virtual Port

Dla każdego klienta jest tworzony wirtualny BSSID, z którym ma się łączyć. Konkretny AP jest wyznaczony przez kontroler do obsługi tego wirtualnego BSSID. Patrząc abstrakcyjnie, jest wirtualny AP który porusza się pomiędzy fizycznymi AP aby obsługiwać klienta.
Plusy:
- plusy Virtual Cell,
- można sterować transmisją per-client,
- wirtualny AP może być na dowolnym kanale.

#figure(image("../../obrazki/virtual-cell.png"))

=== Porównanie MobileIP oraz Wi-Fi

#{
  set text(hyphenate: false, size: 9pt)
  set par(justify: false)
  table(
    columns: (auto, 2fr, 1fr, 2fr),
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
      [*Aspekt*], [*MobileIP*], [*Wi-Fi*]
    ),

    [Warstwa], [Warstwa sieciowa (IP)], [Warstwa łącza danych],
    [Przełączanie], [Między różnymi podsieciami], [Między AP w ramach jednej podsieci],
    [Adres IP], [Zmienny w MobileIP], [Niezmienny],
    [Zakres działania], [Globalny], [Lokalny, w ramach jednej sieci Wi-Fi],
    [Mechanizm], [Tunelowanie, aktualizacja wpisów routingowych], [Asocjacja, Re-asocjacja, wymiana kluczy (Handshake)],
    [Złożoność], [Wymaga infrastruktury (Home Agent, Foreign Agent)], [Wymaga nakładania się zasięgów AP i (zazwyczaj) kontrolera]
  )
}

#import "../../res/question.typ": question

#show: question.with(
  q: "Porównanie rozwiązań protokołów warstwy sieciowej IPv4 i IPv6."
)

#{
set text(hyphenate: false, size: 9pt)
set par(justify: false)
table(
  columns: (auto, 1fr, 1fr),
  inset: 5pt,
  align: horizon,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [*Cecha*], [*IPv4*], [*IPv6*],
  [Długość adresu], [32 bity], [128 bitów],
  [Przestrzeń adresowa], [Około 4,3 miliarda unikalnych adresów], [praktycznie nieograniczona ok. 3,4×10^38 unikalnych adresów],
  [Notacja], [Dziesiętna odzielona kropkami], [Szestnastkowa odzielona dwukropkami],
  [Konfiguracja adresów], [- Ręczna konfiguracja (statyczne adresy)
   - Automatyczna przez DHCP], [- Automatyczna konfiguracja przez SLAAC
   - Wspiera też DHCPv6,
   - Ręczna konfiguracja (statyczne adresy)],
  [Nagłówek], [20-60 bajtów (Jeśli Nowicki w komisji to można dodać, że większość niepotrzebna)], [40 bajtów z czego 32 to adresy (mały overhead)] ,
  [Fragmentacja], [Dozwolona przez nadawcę i routery pośredniczące], [Dozwolona tylko przez nadawcę],
  [Suma kontrolna], [Obecna w nagłówku (obciąża routery)], [Brak (odpowiedzialność przeniesiona na warstwę łącza danych i transportową)],
  [Bezpieczeństwo], [Opcjonalne (IPsec nie jest wbudowany)], [Obowiązkowe (IPsec jest wbudowany)],
  [Zarządzanie QoS], [Obsługiwane przez pole Type of Service (ToS) (ignorowane przez większość urządzeń)], [Obsługiwane przez pole Traffic Class i Flow Label],
  [Broadcast], [Obsługiwane (też istnieje multicast i anycast, dla multicast istnieje nawet specjalna klasa D)], [Nieobsługiwane (zastąpione przez multicast i anycast)],
  [NAT], [Powszechnie używany, ze względu na ograniczoną przestrzeń adresową], [Niepotrzebny dzięki ogromnej przestrzeni adresowej, ale większość sieci to nadal IPv4, więc trzeba tunelować co wymaga użycia NAT],
  [Mobilność], [Ograniczona, obsługiwana przez dodatkowe protokoły (np. Mobile IPv4)], [Wbudowana obsługa mobilności (Mobile IPv6)],
  [Obsługa multicast], [Wspiera, ale nie posiada usprawnień z IPv6. Brak wbudowanego mechanizmu na dołączanie do grup multicast], [Wspiera z usprawnieniami (MLD - Multicast Listener Discovery do zarządzania członkostwem w grupach multicast). 
  
  Wg Gumińskiego telewizja dzisiaj działa tak, że kanał to adres multicastowy i opóźnienie ok. 1-2s przy przełączaniu zanim zobaczysz obraz wynika z czasu potrzebnego na dołączenie do adresu multicastowego],
)
}

=== Mechanizmy współpracy IPv4 i IPv6
- Dual Stack - Urządzenia i sieci obsługujące oba protokoły jednocześnie, umożliwiające komunikację zarówno przez IPv4, jak i IPv6.
- Tłumaczenie adresów (NAT64) - Przekształca adresy IPv6 na IPv4 i odwrotnie. Z IPv4 na IPv6 jest statyczne mapowanie. Podobnie można z MAC utworzyć adres IPv6. W drugą stronę z IPv6 na IPv4 nie jesteśmy w stanie przypisać każdemu adresowi IPv6 unikalnego adresu IPv4, musi być jakiś konfigurowalny mechanizm translacji.
- Tunelowanie - Pakiety IPv6 są enkapsulowane w pakiety IPv4, co pozwala na przesyłanie ich przez sieci obsługujące tylko IPv4. Tunelowanie IPv4 over IPv6 też jest możliwe.

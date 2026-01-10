#import "../../res/question.typ": question

#show: question.with(
  q: "Porównanie rozwiązań sieci ethernetowych na poziomie warstwy fizycznej i łącza danych."
)

=== Warstwa fizyczna w Ethernet
Rozwiązania w większości nazywane: <prędkość>BASE<suffix>
*Rodzaje mediów transmisyjnych:*
- T - Twisted Pair (skrętka)
- S - (Short) światłowód, krótka fala
- L - (Long) światłowód, dłuższa fala
- L4 - cztery długie fale równolegle (różnie tu bywa, albo niezależne światłowody, albo różne długości w jednym)
- E (lub Z) - (Extra long) światłowód, bardzo długa fala
- B - dwukierunkowy światłowód
- P - Passive Optical - Passive Optical Network - bez żadnych zasilanych urządzeń - generalnie stosowane jako “last mile” - doprowadzenie od infrastruktury do klienta. Bez przełączania, analizowania, regeneracji
- C - (Copper) - koncentryk/dwuosiowy
- K - (Backplane) - ścieżki na płytce drukowanej
- F - (Fiber) - światłowód po prostu
- H - Plastikowy światłowód
- W - 10G ethernet może być przenoszony w ramkach SONET - rozwiazanie do światłowodowych sieci WAN. Szybsze ethernety same w sobie są używane też jako WAN

Rodzaj kodowania
- X - 8b/10b (wyjątek, oznacza 4b/5b w Fast - 100Mb)
- R - 64/66b

*Standardy Ethernet:*
- Classic Ethernet 10Mbps, np. 10BASE-T (TP) (skrętka)
- Fast Ethernet 100Mbps, np. 100BASE-FX (światłowód)
- Gigabit Ethernet 1Gbps, np. 1000BASE-T
- 2.5GBASE-T
- 5GBASE-T
- 10GBASE-T
- 25GBASE-T
- 40GBASE-T
- 50GBASE-LR
- 100GBASE-LR4
- 200GBASE-LR4
- 400GBASE-LR4
- 800GBASE-SR8

=== Kodowanie
*Po co kodujemy?*
- Synchronizacja zegara - odbiornik musi wiedzieć, kiedy próbkuje sygnał
- Równowaga sygnału - unikanie długich serii jedynek lub zer, które mogą powodować dryft napięcia
- Detekcja błędów - niektóre schematy kodowania umożliwiają wykrywanie błędów transmisji

*Rodzaje kodowania:*
- (suffix X) 8b/10b - stosowane w Gigabit Ethernet i 10 Gigabit Ethernet. Każde 8 bitów danych jest kodowane na 10 bitów sygnału.
- (suffix R) 64b/66b - stosowane w 10 Gigabit Ethernet i wyższych prędkościach. Każde 64 bity danych są kodowane na 66 bitów sygnału. Zmniejsza narzut kodowania w porównaniu do 8b/10.
- Manchester - kodowanie z użyciem zboczy (malejące 0 rosnące 1). Stosowane w klasycznym Ethernet 10Mbps.
#figure(image("../../obrazki/manchester.png"))
- MLT-3 - kodowanie na trzech poziomach napięcia (niskie, 0, wysokie) 1oznacza przejście do innego poziomu, 0 brak zmiany. Stosowane w Fast Ethernet 100Mbps wraz z 4b/5b i czasem 8b10b.
#figure(image("../../obrazki/mlt-3.png"))
- NRZI (Non-Return to Zero Inverted) - działa poprzez zmianę stanu sygnału dla bitu 1 i brak zmiany dla bitu 0. Często używane w połączeniu z innymi schematami kodowania. Stosowane wraz z 8b/10b i 64b/66b w Gigabit i wyższych prędkościach.
#figure(image("../../obrazki/nrzi.png"))
- PAM  (Pulse Amplitude Modulation) - stosowane w 10GBASE-T i wyższych prędkościach. Kodowanie w aplitudzie. Dzieli sygnał na więcej poziomów, co pozwala na przesyłanie większej ilości danych na jeden symbol.
#figure(image("../../obrazki/pam.png"))
- QAM (Quadrature Amplitude Modulation) - te co w wifi, 16-QAM, 64-QAM, 256-QAM - jest czasami używane też w ethernecie - kodowanie w amplitudzie i fazie sinusoidy - np 400GBASE-ZR korzysta z 16-QAM.

=== Autonegocjacja i wybór standardu
Dobór standardu Ethernet w warstwie fizycznej (100BASE-T, 100GBASE-LR4 itp.) zachodzi za sprawą autonegocjacji kart sieciowych. Karty komunikują się ze sobą i ustalają najwyższy wspólny standard obsługiwany przez oba urządzenia.

*Pozycja ramki w modelu OSI:*
Ramka zgodnie z modelem ISO/OSI powinna istnieć dopiero w warstwie łącza danych. Jednak Ethernet implementuje stos TCP/IP, a nie ISO/OSI, dlatego Ethernet jest rozwiązaniem obejmującym zarówno warstwę fizyczną, jak i warstwę łącza danych w modelu OSI.

=== Warstwa łącza danych
Stosuje abstrakcję ramk. Nie interesuje się fizycznym medium transmisyjnym.

Wykorzystuje adresacje z użyciem adresu MAC (Media Access Control) sześć bajtów AA:BB:CC:DD:EE:FF:
Sześć bajtów szesnastkowo: AA:BB:CC:DD:EE:FF
- AA:BB:CC - unikatowy, well known, identyfikator producenta sprzętu, można sobie sprawdzić kto produkował wasze karty sieciowe: https://www.macvendorlookup.com/ Przydziela go IEEE
- DD:EE:FF - unikatowy na skalę globalną kod urządzenia - producent powinien zadbać by się nie powtarzał

#image("../../obrazki/ramka_ethernet.png")
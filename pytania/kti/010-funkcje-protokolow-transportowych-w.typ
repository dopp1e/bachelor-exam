#import "../../res/question.typ": question

#show: question.with(
  q: "Funkcje protokołów transportowych w sieciach IP."
)

=== Połączeniowość
Protokół transportowy może być połączeniowy lub bezpołączeniowy. Protokół połączeniowy (np. TCP) ustanawia logiczne połączenie między dwoma punktami końcowymi przed rozpoczęciem transmisji danych, co zapewnia niezawodność i kontrolę przepływu. Wykorzystuje mechanizm nawiązania połączenia three way handshake i zerwania go - bit RST w segmencie, timeout. 

Protokół bezpołączeniowy (np. UDP) nie wymaga ustanawiania połączenia, co pozwala na szybszą transmisję, ale bez gwarancji dostarczenia danych.

=== Niezawodność
Protokół TCP zapewnia niezawodność transmisji danych poprzez mechanizmy takie jak
- potwierdzenia odbioru (ACK),
- retransmisje utraconych segmentów,
- kontrola błędów za pomocą sum kontrolnych (checksum).
- numeracja sekwencyjna segmentów umożliwia odbiorcy prawidłowe złożenie danych w odpowiedniej kolejności.

=== Multipleksacja i demultipleksacja
Proces łączenia danych z różnych aplikacji lub procesów w jeden strumień danych do przesłania przez sieć. Demultipleksacja to odwrotny proces, w którym odbiorca rozdziela odebrane dane na odpowiednie aplikacje lub procesy na podstawie numerów portów źródłowych i docelowych zawartych w nagłówkach protokołów transportowych.

=== Segmentacja
Proces dzielenia dużych bloków danych na mniejsze jednostki zwane segmentami, które mogą być łatwiej przesyłane przez sieć. Protokół TCP dokonuje segmentacji danych aplikacji na segmenty o odpowiedniej wielkości, dostosowanej do maksymalnej jednostki transmisyjnej (MTU) sieci. Segmenty te są następnie przesyłane przez sieć i ponownie składane przez odbiorcę w oryginalną formę.

=== Kontrola przepływu
Mechanizm zarządzania szybkością transmisji danych między nadawcą a odbiorcą, aby zapobiec przeciążeniu odbiorcy. Protokół TCP wykorzystuje okno przesuwne (sliding window) do dynamicznego dostosowywania ilości danych wysyłanych bez potwierdzenia, co pozwala na wykorzystanie dostępnej przepustowości sieci.

Mechanizmy zarządzania prędkością transmiji tak by dopasować ją do możliwości odb stron:
- stop-and-wait - nadawca wysyła jeden segment i czeka na potwierdzenie odbioru przed wysłaniem kolejnego,
- sliding window istnieją dwa warianty:
  - Go-Back-N - nadawca może wysłać wiele segmentów bez oczekiwania na potwierdzenie, ale w przypadku utraty segmentu musi ponownie wysłać wszystkie segmenty od utraconego wzwyż,
  - Selective Repeat - nadawca może wysłać wiele segmentów i odbiorca potwierdza odbiór poszczególnych segmentów, co pozwala na ponowne wysłanie tylko utraconych segmentów.

=== Kontrola przeciążenia
Mechanizm zapobiegający przeciążeniu sieci poprzez regulację szybkości transmisji danych w odpowiedzi na warunki sieciowe. Protokół TCP wykorzystuje algorytmy takie jak slow start, congestion avoidance, fast retransmit i fast recovery, aby dynamicznie dostosowywać szybkość wysyłania danych w zależności od poziomu przeciążenia sieci.

=== Multi-homing
Technika polegająca na podłączeniu komputera, serwera lub całej sieci do internetu za pomocą więcej niż jednego dostawcy usług internetowych (ISP) lub połączenia. Protokóły transportowe, takie jak SCTP (Stream Control Transmission Protocol), wspierają multi-homing, co pozwala na zwiększenie niezawodności i dostępności połączeń poprzez automaty

=== Protokół SCTP
*SCTP (Stream Control Transmission Protocol)* to protokół warstwy transportowej zorientowany na połączenia, używany do przesyłania wielu strumieni danych między dwoma punktami końcowymi. Łączy cechy TCP (niezawodność, zorientowanie na połączenia) i UDP (transfer zorientowany na wiadomości), co czyni go idealnym dla aplikacji takich jak telefonia przez Internet i sygnalizacja w sieciach mobilnych.

Eliminuje Head-of-Line Blocking (HOLB). W przypadku awarii jednego z połączeń, SCTP może automatycznie przełączyć ruch na inne dostępne połączenie bez przerywania sesji komunikacyjnej.

=== Protokół QUIC
*QUIC (Quick UDP Internet Connections)* to protokół transportowy opracowany przez Google, który działa na bazie UDP i jest zaprojektowany do szybkiego i bezpie
cznego przesyłania danych w internecie. QUIC integruje funkcje takie jak szyfrowanie, kontrola przepływu i wielościeżkowość, co pozwala na redukcję opóźnień i poprawę wydajności w porównaniu do tradycyjnych protokołów transportowych, takich jak TCP.

*0-RTT(Zero Round Trip Time)* - W tradycyjnym stosie (TCP + TLS) potrzeba kilku "rund" (Round Trips) komunikacji, zanim zacznie się właściwy transfer danych.
- QUIC łączy nawiązywanie połączenia transportowego i szyfrowania w jeden proces.
- Jeśli klient już wcześniej łączył się z serwerem, może wysłać dane już w pierwszym pakiecie (0-RTT), co drastycznie przyspiesza ładowanie stron.

*Eliminacja Head-of-Line Blocking (HOLB)* - QUIC pozwala na niezależne przesyłanie wielu strumieni danych w ramach jednego połączenia, co zapobiega blokowaniu się całego połączenia w przypadku utraty pojedynczego pakietu.

*Connection Migration* - QUIC wspiera migrację połączeń, co pozwala na utrzymanie aktywnego połączenia nawet przy zmianie adresu IP, na przykład podczas przełączania się między sieciami Wi-Fi i komórkowymi.

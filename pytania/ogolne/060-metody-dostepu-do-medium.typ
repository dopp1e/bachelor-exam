#import "@preview/gentle-clues:1.2.0": *
#import "../../res/question.typ": question

#show: question.with(
  q: "Metody dostępu do medium transmisyjnego w lokalnych sieciach komputerowych."
)

Wyróżniamy dwa rodzaje mediów transmisyjnych: 
- przewodowe - skrętka (Ethernet), światłowód, kabel koncentryczny,
- bezprzewodowe - Wi-Fi (fale radiowe), Bluetooth, podczerwień.

W sieciach LAN najczęściej wykorzystywane to skrętka oraz Wi-Fi.

=== Tryby transmisji

Tryby transmisji danych definiują kierunek przepływu informacji oraz zdolność kanału do jednoczesnego nadawania i odbierania sygnałów. Tryby te to:
- simpleks - jednokierunkowy kanał komunikacyjny (np. radio FM),
- dupleks - zdolność do przesyłania w obu kierunkach, dzieli się na:
    - *half-dupleks - urządzenie w danej chwilii może albo nadawać, albo odbierać (np. Wi-Fi, koncentrator, hub)*,
    - full-dupleks - dwukierunkowa transmisja, urządzenia mogą jednocześnie nadawać i odbierać (np. switch).

=== Metody dostępu do medium transmisyjnego

Ponieważ w mediach współdzielonych (jak Wi-Fi czy stare sieci Ethernet) wiele urządzeń korzysta z jednego kanału, konieczne są metody zarządzania ruchem, aby uniknąć kolizji.

Dzieli się je na:
- *metody rywalizacji* - niezbędne w trybie half-dupleks do unikania kolizji (np. ALOHA, CSMA/CA, CSMA/CD),
- *metody bezkolizyjne (sterowane)* - stacje nadają wtedy, otrzymają na to wyraźne pozwolenie lub specjalny "żeton" (np. token ring, token bus, polling),
- *metody kanałowe (podziałowe)* - dzielą medium na niezależne części np. po częstotliwości (FDMA) lub czas (TDMA).

Obecnie w sieciach LAN wykorzystuje się CSMA/CD w starszych przewodowych sieciach Ethernet oraz CSMA/CA w sieciach Wi-Fi. W standardzie Wi-Fi 6 lub wyżej wykorzystywane jest OFDMA.

Token Bus, Polling oraz TDMA wykorzystywane są w niektórych sieciach przemysłowych.

=== Metody dostępu rywalizacyjnego

Metody dostępu rywalizacyjnego charakteryzują się tym że urządzenia podłaczone do sieci konkurują o dostęp do medium. Kolizje są rzeczą spodziewaną, dlatego kładzie się nacisk na to, jak reagować na nie.

==== Aloha

#info[Praktycznie niestosowane]

Jest to najprostszy protokół, który swoją nazwę zawdzięcza temu że został oryginalnie zaprojektowany dla Uniwersytetu Hawajskiego. Nie jest za bardzo efektywny, ponieważ większość czasu sieć jest zablokowana przez kolizje. 

Kroki działania:
1. Natychmiast przesyłaj.
2. Poczekaj na potwierdzenie odbiorcy (ACK).
3. Jeśli brak potwierrdzenia, poczekaj losowy czas i przesyłaj ponownie.

==== S-ALOHA

#info[Praktycznie nie stosowane]

Ulepszona ALOHA o określone przedziały czasowe (slots).

Kroki działania:
1. Synchronizacja: Urządzenia synchronizują swoje zegary z ustalonymi slotami czasowymi.
2. Przesyłanie w slocie: Urządzenie może przesyłać dane tylko na początku najbliższego wolnego slotu.
3. Potwierdzenie ACK: Odbiorca potwierdza poprawne odebranie danych.
4. Ponowna transmisja: W przypadku braku ACK urządzenie losowo wybiera kolejny slot do transmisji.

==== CSMA/CD

#info[CSMA/CD praktycznie nie występuje współcześnie, ponieważ mamy full-dupleks.]

*CSMA/CD (Carrier Sense Multiple Access with Collision Detection)* - metoda stosowana w sieciach Ethernet. Urządzenia nasłuchują medium, aby upewnić się że jest wolne.

Kroki działania:
1. Nasłuchiwanie medium *(Carrier Sense)* - urządzenie upewnia się, że medium jest wolne.
2. Rozpoczęcie transmisji.
3. Wykrywanie kolizji *(Collision Detection)* - urządzenie wykrywa kolizje, kiedy zaczynają otrzymywać transmisje kiedy nadają (w przypadku skrętki poprzez mierzenie napięcia elektrycznego na przewodzie).
4. Reakcja na kolizję - po wykryciu kolizji urządzenie wysyła sygnał zakłócający informując, że zaszła kolizja.
5. Wstrzymanie transmisji - wszystkie urządzenia przerywają transmisję.
6. Oczekiwanie (Backoff) - urządzenie czeka losowy czas (który wzrasta wraz z liczbą kolizji), przed ponowną próbą transmisji.

#info[
  *Minimalna długość ramki (64 bajty)* wynika z konieczności wykrycia kolizji (Slot Time). Nadawca musi nadawać ramkę na tyle długo, aby sygnał zdążył dotrzeć do najdalszego punktu w sieci, a w przypadku kolizji - sygnał o niej (JAM) zdążył wrócić do nadawcy, zanim ten zakończy transmisję. Gdyby ramka była krótsza niż czas obiegu sygnału w obie strony, nadawca zakończyłby wysyłanie, myśląc, że wszystko się udałow, podczas gdy jego dane uległyby zniszczeniu gdzieś w kablu.
]


==== CSMA/CA

*CSMA/CA (Carrier Sense Multiple Access with Colission Avoidance)* - wykorzystywana metoda w sieciach bezprzewodowych (Wi-Fi). Urządzenia również nasłuchują medium ale zamiast wykrywać kolizję, starają się ich unikać, wprowadzając dodatkowe procedury rezerwacji medium przed wysyłaniem danych. Wtedy wówczas jeżeli uda się urządzeniu zarezerwować medium jest ono na wyłączność.

Kroki działania:
1. Nasłuchiwanie medium - urządzenie nasłuchuje czy inne nadają.
2. Rezerwacja medium - wysłanie sygnału żądania transmisji (Request to Sent, RTS), informując inne urządzenia o zamiarze nadania wiadomości:
    #{
    set enum(numbering: "a.")
    [
      + brak kolizji RTS - medium jest zarezerwowane i przechodzi do punktu 3,
      + dwa urządzenia mogą jednocześnie otrzymać RTS, wtedy następuje kolizja i urządzenie czeka losowy czas żeby znowu wysłać sygnał RTS.
    ]
    }
3. Odpowiedź CTS (Clear To Send) - odbiorca potwierdza możliwość transmisji.
    #{
    set enum(numbering: "a.")
    [
      + brak kolizji CTS - krok 4
      + jeżeli dwa urządzenia wysłały RTS do różnych odbiorców, mogą otrzymac kolidujące CTS z dwóch źródeł. W takim wypadku nadawca nie otrzyma CTS i założy że doszło do kolizji.
    ]
    }
4. Przesyłanie danych - urządzenie wysyła dane, mając gwarancję na wyłączność medium.
5. Potwierdzenie - odbiorca wysyła ACK.

=== Metody dostępu bezkolizyjnego

Metody te eliminują ryzyko kolizji, ponieważ dostęp do medium jest kontrolowany w sposób planowy i uporządkowany.
- *Token ring* - topologia pierścienia (komputery podłączone ze sobą w pierścień). W tej metodzie, po całej sieci krąży specjalny token. Jeśli urządzenie posiada token, to oznacza, że może nadawać wiadomości. Po transmisji przekazuje token dalej. Wada: możliwość utracenia tokenu.
- *Token Bus* - protokół dla sieci o topologii magistralowej, działa jak token ring, tylko, że urządzenia są połączone w magistralę a token jest przykazywany niezależnie od topologii fizycznej.
- *Polling* - działa na zasadzie centralnego kontrolera, który pyta każde urządzenie czy chce przesyłać dane. Nadaje tym urządzeniom dostęp do medium.

=== Metody współdzielonego medium (kanałowe)

W metodach kanałowych medium transmisyjne jest dzielone między urządzeniami. Każde urządzenie ma swój kanał dzięki czemu mogą one nadawać jednocześnie bezkolizyjnie. Podział tego medium może być według czasu dostępu do medium, częstotliwości nadawania.
- *FDMA (Frequency Division Multiple Access)* - to metoda w której medium jest podzielone na różne pasma częstotliwości. Każde urządzenie nadaje transmisje na swoim paśmie i może to robić jednocześnie z innymi urządzeniami.
- *TDMA (Time Division Multiple Access)* - to metoda w której medium jest podzielone na przedziały czasowe (sloty). Każde urządzenie ma przypisany swój slot w którym może przesyłać dane. Sloty są przydzielane sekwencyjnie.
- *CDMA (Code Division Multiple Access)* - to metoda w której urządzenia korzystają z tego samego pasma częstotliwości ale każde z nich używa unikalnego kodu do przesyłania danych. Dzięki temu jest możliwe rozróżnienie transmisji nawet jeśli odbywają się one jednocześnie.
- *OFDMA (Orthogonal Frequency Division Multiple access)* - zaawansowana metoda podziału medium na częstotliwości w którym pasmo jest dzielone na wiele kanałów a te z kolei na podkanały przydzielane dynamicznie

=== Możliwe dopytania

- Kuchta drążył o minimalną długość ramki w CSMA/CD. (Kuchta)
- Dlaczego nie stosujemy ramek bardzo dużych w sieciach np. 1Gb (Kuchta)
- Która z metod dostępu jest wykorzystywana najczęściej? (Gumiński)
- Co może się najgorszego wydarzyć przy Token Passing? (Bowisz) (odp: Zgubienie tokenu.)
- Jak CSMA ma się w dzisiejszych czasach, czy w światłowodach występują kolizje? (Dziubich) (odp: Jest pełen dupleks, więc nie.)
- Czy światłowody mogą być w sieciach lokalnych? (Dziubich) (odp: Tak)
- Czego użyjemy w Wi-Fi (Manus) (odp: CSMA/CA)
- Dlaczego w Wi-Fi nie użyjemy CSMA/CD? (Manus)
- Na jakiej zasadzie wykrywane są kolizje w CSMA/CD? (Matuszek) (odp: Poziom napięcia na kablu.)
- Kto w TDMA przydziela sloty czasowe? (Matuszek)
- Dla jakich sieci rozwiązania z tokenem mogą być lepsze od CSMA? (Szwoch) (odp: Dla sieci z dużą ilością urządzeń.)
- Powiedzmy, że jest w siecie 20 urządzeń i statystycznie mogą występować kolizje. Każde urządzenie nada swoją wiadomość, ale jakie to ma konsekwencje dla 1 urządzenia, który nie będzie w sieci tokenowej? (Szwoch) (odp: Szwoch źle zadał pytanie, chodziło o to, że w CSMA jedno urządzenie przez długi czas może nie móc wysłać swojej wiadomości.)
- Ma Pan 100 czujników na księżycu, w jaki sposób najlepiej połączyć by konflikty nie występowały? (Pikies) (odp: Ustawić ręcznie pasma.)
- Co ogranicza zasięg w TDMA? (Matuszek) (odp: Czas propagacji informacji. Im dalej jesteś tym większe musi być okno na czas propagacji.)

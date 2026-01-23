#import "@preview/gentle-clues:1.2.0": *
#import "../../res/question.typ": question

#show: question.with(
  q: "Porównanie protokołów dostępu do medium transmisyjnego w lokalnych sieciach komputerowych."
)

Protokoły dostępu możemy podzielić na trzy główne kategorie:
- *rywalizacji* - niezbędne w trybie half-dupleks do unikania kolizji (np. ALOHA, CSMA/CA, CSMA/CD),
- *bezkolizyjne (sterowane)* - stacje nadają wtedy, otrzymają na to wyraźne pozwolenie lub specjalny "żeton" (np. token ring, token bus, polling),
- *kanałowe (podziałowe)* - dzielą medium na niezależne części np. po częstotliwości (FDMA) lub czas (TDMA).

W ramach sieci lokalnych (LAN) aktualnie najczęściej wykorzystywane są protokoły CSMA/CD (Ethernet) oraz CSMA/CA (Wi-Fi).

=== CSMA/CD

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


=== CSMA/CA

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

=== Token Ring

O ile token ring nie jest już praktycznie stosowany, warto znać jego zasadę działania jako przykład protokołu bezkolizyjnego.

Kroki działania:
1. Specjalna ramka zwana "żetonem" krąży w sieci w ustalonym porządku między wszystkimi stacjami.
2. Stacja, która chce nadać dane, czeka na nadejście żetonu.
3. Gdy stacja otrzyma żeton, zmienia go na ramkę danych i wysyła do docelowej stacji.
4. Po odebraniu danych, docelowa stacja wysyła z powrotem żeton do sieci.
5. Inne stacje mogą teraz przechwycić żeton i nadawać swoje dane.

Mimo że protokół ten eliminuje kolizje i w małych sieciach osiąga prędkości porównywalne lub wyższe niż np. Ethernet (zgodnie z wykładem profesora Nowickiego), to przez kilka problemów nie jest stosowany:
+ *Problemy z odbieraniem danych* - jeśli stacja odbierająca jest zbyt zajęta, nie funkcjonuje w danym momencie, lub jeśli po drodze doszło do korupcji danych, stacja odbierająca nie zaakceptuje danych i żeton nie zostanie zwrócony do sieci, co powoduje zatrzymanie całej komunikacji.
+ *Problemy z tokenem* - jeśli stacja przesyła zbyt dużo danych, przez co monopolizuje żeton, inne stacje mogą nigdy nie dostać szansy na nadanie swoich danych. Dodatkowo, jeśli żeton zostanie utracony (np. przez awarię stacji), cała sieć przestaje działać, dopóki żeton nie zostanie ponownie wygenerowany.
#import "../../res/question.typ": question

#show: question.with(
  q: "Infrastruktura klucza publicznego - architektura oraz sposoby wykorzystania."
)

=== Kryptografia symetryczna

Kryptografia symetryczna to metoda szyfrowania wiadomości między nadawcą i odbiorcą, która polega na używaniu jednego klucza który jest odpowiedzialny zarówno za szyfrowanie wiadomości jak i jego deszyfrowanie.
Kryptografia symetryczna jest stosowana ze względu na jej wydajność, jednakże punktem problematycznym jest dzielenie się kluczem.
Jeśli ten klucz zostanie naruszony to poufność komunikacji również zostaje naruszona.

=== Kryptografia asymetryczna

Jest to rodzaj kryptografii w której szyfrowanie komunikacji odbywa się przy użyciu dwóch kluczy - publicznego i prywatnego.
Klucz publiczny nosi tą nazwę ze względu na to, że jest on dostępny dla osób postronnych.
Natomiast klucz prywatny posiada właściciel klucza prywatnego który rozdaje ten klucz publiczny.

TODO: opisanie działania matematycznego kluczy?

Dzięki właściwościom matematycznym kluczy możliwe jest stosowanie jednego z kluczy w zestawie (prywatny + publiczny) w celu zaszyfrowania pewnej wiadomości tak, aby tylko drugi klucz mógł ową wiadomość odszyfrować.
Może to też posłużyć za poświadczenie autorstwa (zakładając, że tylko jedna osoba ma dostęp do klucza prywatnego, to fakt że da się odszyfrować wiadomość konkretnie jej kluczem prywatnym stanowi dowód bycia osobą szyfrującą, tj. posiada dostęp do klucza prywatnego).

=== Public Key Infrastructure (PKI)

*Infrastruktura klucza publicznego* to system oparty na kryptografii asymetrycznej służący do zarządzania kluczami publicznymi i certyfikatami cyfrowymi:
- Zapewnia bezpieczne szyfrowanie i weryfikacje tożsamości w komunikacji elektronicznej,
- Umożliwia poufność, uwierzytelnianie i integralność danych.

Najważniejszym elementem PKI jest Certyfikat, który potwierdza że dany klucz publiczny należy do konkretnej osoby i że został podpisany przez urząd certyfikacji oraz czy jest wciąż aktulany. 

Głównym celem PKI jest zapewnienie zaufania w środowisku cyfrowym poprzez:
1. *Szyfrowanie*: Umożliwienie bezpiecznej wymiany danych między stronami,
2. *Podpisy cyfrowe*: Potwierdzenie autentyczności i integralności dokumentów,
3. *Uwierzytelnianie*: Weryfikacja tożsamości użytkowników i urządzeń w sieci,
4. *Zarządzanie certyfikatami*: Tworzenie, dystrybucja, weryfikacja i unieważnianie certyfikatów.

=== Architektura PKI

/ Klucz publiczny: Klucz kryptograficzny który jest stosowany do szyfrowania wiadomości oraz do weryfikowania podpisów cyfrowych. Klucz publiczny jest udostępniany każdemu kto jej potrzebuje bo jest *publico*
/ Klucz prywatny: Klucz kryptograficzny który posiada właściciel pary kluczy publicznego i prywatnego, który służy do odszyfrowywania wiadomości oraz do tworzenia podpisu elektronicznego. Klucz prywatny jest utrzymywany w tajemnicy przez właściciela. 
/ Certyfikat cyfrowy: Obszerny dokument który zawiera w sobie klucz publiczny, informacje o właścicielu certyfikatu, urzędzie certyfikacji który go wydał oraz datę ważności tego certyfikatu. Jest on dostępny publicznie w repozytoriach. 
/ Podpis cyfrowy: jest to odpowiednik podpisywania dokumentów w rzeczywistości. Jest tworzony przy użyciu klucza prywatnego i służy do potwierdzenia autentyczności, integralności i pochodzenia dokumentu lub danych. Osoba mająca klucz publiczny może zweryfikować ten podpis. 
/ Urząd certyfikacji (Certificate Authority, CA): jest to zaufana organizacja urzędowa, która jest odpowiedzialna za wydawanie, weryfikację oraz anulowanie certyfikatów. Zarządza certyfikatami
/ Urząd rejestracji (Registration Authority, RA): jest to pośrednik pomiędzy użytkownikiem który ubiega się o certyfikat a urzędem certyfikacji. Odpowiada za uwierzytelnienie osoby ubiegającej się o certyfikat przed jego wydaniem.
/ Listy odwołanych certyfikatów (Certificate Revocation List, CLR): Jest to lista certyfikatów które zostały unieważnione przed upływem ich terminu ważności. Po ich upływie nie ma sensu wpisywać na tą listę bo z góry przedawnione certyfikaty są nieważne.
/ Repozytorium Certyfikatów: Publiczna baza danych w której są przechowywane certyfikaty oraz listy CLR. Za pomocą tego repozytorium użytkownik może pobrać certyfikat i użyć zawartego w nim klucza publicznego do szyfrowania wiadomości czy tam weryfikowania podpisów.
/ Protokół OCSP: Online Certificate Status Protocol to mechanizm pozwalający na bieżąco sprawdzać status ważności certyfikatu bez konieczności pobierania listy CLR. Ogólnie to OCSP dostarcza bardziej aktualne informacje i działa w czasie rzeczywistym.
/ Hierarchia zaufania: PKI może być zorganizowana w hierarchię zaufania, która jest drzewem którego węzłami są urzędy certyfikacji. Najwyższy węzeł podpisuje inne urzędy itd. Jeżeli chcemy sprawdzić czy możemy ufać jakiemuś CA to idziemy po tym drzewie w górę aż znajdziemy jakieś zaufane CA.
  / Główne CA (Root CA): najwyższy poziom zaufania w hierarchi. Charakteryzuje się tym że jest podpisane samo przez siebie. Komputer albo przeglądarka utrzymuje listy zaufanych urzędów certyfikacji, przez co każde CA poniżej w hierarchi wtedy jest też zaufane.
  / Podrzędne CA (Intermediate CA): wydają certyfikaty w imieniu Root CA, rozkładając obciążenie i ryzyko. Zasadniczo to jeżeli chcemy się dowiedzieć czy możemy mu zaufać to wspinamy się w górę (do urzędu który podpisał ten certyfikat) i jeżeli dojdziemy do zaufanego urzędu certyfikacji to ten CA też jest zaufany. W przeciwnym razie nie ufamy temu CA. W skrócie ufamy CA jeżeli:
    - Łańcuch jest kompletny i nieprzerwany,
    - Certyfikaty w łańcuchu nie zostały unieważnione,
    - Łańcuch prowadzi do znanego i zaufanego CA.

=== Kroki działania PKI

+ *Utworzenie pary kluczy*:
  - Użytkownik (prywatna osoba, firma) generuje parę kluczy, prywatny i publiczny,
  - Użytkownik zatrzymuje klucz prywatny, a klucz publiczny jest wykorzystany do stworzenia certyfikatu.
+ *Zgłoszenie się do RA*:
  - Użytkownik przesyła żądanie wygenerowania certyfikatu (CSR Certificate Signing Request) do Registration Autority RA,
  - RA weryfikuje tożsamość użytkownika, sprawdzając dokumenty, dane kontaktowe i wgl. Jeżeli wszystko przejdzie to zgłoszenie jest przekierowane do CA.
+ *Wydanie certyfikatu cyfrowego przez CA*:
  - Po pozytywnej weryfikacji RA, Certificate Authority CA wystawia certyfikat cyfrowy który łączy klucz publiczny użytkownika z jego tożsamością,
  - Certyfikat ten zawiera klucz publiczny, dane właściciela, dane urzędu wystawiającego oraz datę ważności. Może zawierać wiele innych różnych danych, np. listę rzeczy które można z tym certyfikatem robić.
+ *Dystrybucja certyfikatu cyfrowego*:
  - Certyfikat jest umieszczany w publicznych repozytoriach, gdzie każdy zainteresowany może go pobrać,
  - Dzięki temu inni użytkownicy mogą korzystać z klucza publicznego do szyfrowania wiadomości lub weryfikacji podpisów cyfrowych.
+ *Bezpieczna komunikacja*:
  - Nadawca wysyłając odbiorcy wiadomość najpierw szyfruje go za pomocą klucza publicznego,
  - Odbiorca deszyfrowuje wiadomość swoim prywatnym kluczem,
  - Dodatkowo odbiorca może zweryfikować że dokument pochodzi od nadawcy i że nikt go nie naruszył za pomocą podpisu i klucza publicznego nadawcy dokumentu.
+ *Sprawdzanie ważności certyfikatu*:
  - Przy każdej operacji wymagającej zaufania (np połączenia HTTPS) certyfikat jest sprawdzany pod kątem ważności:
      - CLR: czyli czy nie znajduje się na liście certyfikatów anulowanych,
      - OCSP: protokołu który pozwala na szybkie sprawdzenie statusu certyfikatu.
+ *Zarządzanie cyklem życia certyfikatów*:
  - Certyfikaty mają określony czas ważności (np jeden rok) i po jego upływie trzeba ubiegać się o nowy,
  - Jeżeli certyfikat zostanie skompromitowany lub po prostu niepotrzebny, użytkownik zgłasza to CA który wówczas ten certyfikat anuluje.

=== Powiązane

*Sprawdzenie certyfikatu w trakcie nawiązywania połączenia*

Weryfikacja certyfikatów w trakcie nawiązywania bezpiecznego połączenia (np. HTTPS) odbywa się poprzez sprawdzenie ścieżki certyfikatów. Polega to na weryfikacji, czy dany certyfikat jest zaufany na podstawie tzw. *łańcucha certyfikatów (certificate chain)*.

*Łańcuch certyfikatów (certificate chain)* 

- Każdy certyfikat cyfrowy (np. dla strony internetowej) jest podpisany przez wyższy poziom certyfikatu, zwany certyfikatem pośrednim (intermediate CA).
- Certyfikaty pośrednie są z kolei podpisywane przez główny certyfikat *root-CA* (Certificate Authority), który jest self-signed (podpisuje sam siebie).
- Komputer lub przeglądarka przechowuje listę *zaufanych certyfikatów root-CA*. Jeśli certyfikat root-CA znajduje się w tej liście, to wszystkie certyfikaty poniżej w łańcuchu są automatycznie uznawane za zaufane, o ile:
    1. Łańcuch jest kompletny i nieprzerwany.
    2. Certyfikaty w łańcuchu nie zostały unieważnione.

*Jak to działa?*

- Po połączeniu się np. ze stroną internetową przeglądarka pobiera certyfikat serwera (SSL/TLS) i wszystkie certyfikaty pośrednie, które serwer udostępnia.
- Przeglądarka sprawdza, czy:
    - Certyfikat serwera jest podpisany przez jeden z certyfikatów pośrednich.
    - Certyfikaty pośrednie prowadzą do znanego certyfikatu root-CA (znajdującego się w zaufanym magazynie certyfikatów przeglądarki/systemu).
- Decyzja o zaufaniu:
    - Jeśli łańcuch kończy się certyfikatem root-CA, który jest znany i zaufany, połączenie zostaje zaakceptowane.
    - Jeśli w łańcuchu brakuje któregoś certyfikatu lub root-CA nie znajduje się w liście zaufanych, połączenie jest oznaczane jako niezaufane.

*Działanie podpisu cyfrowego*

*Proces podpisywania:*

1. *Tworzenie skrótu (hasha)*:
    - Z dokumentu generowany jest *skrócony odcisk (hash)* za pomocą funkcji skrótu (np. SHA-256).
    - Skrót to unikalny ciąg znaków reprezentujący dokument (nawet mała zmiana w dokumencie zmieni skrót).
2. *Szyfrowanie skrótu*:
    - Skrót jest szyfrowany za pomocą *klucza prywatnego* nadawcy, tworząc podpis cyfrowy.
    - Szyfrowany skrót jest dołączany do dokumentu.

*Proces weryfikacji:*

1. Odbiorca otrzymuje dokument z podpisem cyfrowym.
2. Odbiorca:
    - Generuje nowy skrót z otrzymanego dokumentu (za pomocą tej samej funkcji skrótu),
    - Odszyfrowuje podpis (oryginalny skrót) za pomocą *klucza publicznego* nadawcy.
3. Porównuje oba skróty:
    - Jeśli są identyczne, dokument jest autentyczny i niezmieniony,
    - Jeśli różnią się, dokument został zmodyfikowany lub podpis jest nieprawidłowy.

*Dlaczego niektóre certyfikaty są droższe niż inne?*

/ Podstawowa przyczyna: Głównym powodem, dla którego niektóre certyfikaty są droższe niż inne, jest stopień weryfikacji i zaufania, jakie oferują.
/ Rodzaje weryfikacji: Certyfikaty, które wymagają bardziej szczegółowej weryfikacji tożsamości i innych informacji, są zazwyczaj droższe. Przykłady obejmują certyfikaty Extended Validation (EV), które wymagają dokładniejszego procesu weryfikacji.
/ Poziom Zaufania: Droższe certyfikaty często zapewniają wyższy poziom zaufania, co jest kluczowe dla organizacji prowadzących transakcje lub działalność wymagającą wysokiego stopnia bezpieczeństwa i wiarygodności.
/ Dodatkowe funkcje: Niektóre certyfikaty mogą oferować dodatkowe funkcje, takie jak lepsze wsparcie, ubezpieczenie, a take rozszerzoną kompatybilność z różnymi przeglądarkami i systemami

*Czy można nie korzystać z płatnych certyfikatów, np. w swojej organizacji?*

/ Możliwość użycia darmowych certyfikatów: Istnieje możliwość korzystania z darmowych certyfikatów, szczególnie w przypadku wewnętrznych potrzeb organizacji lub dla projektów, które nie wymagają zaawansowanego poziomu weryfikacji i zaufania.
/ Przykłady darmowych certyfikatów: Darmowe certyfikaty, takie jak oferowane przez Let's Encrypt, mogą być odpowiednie dla wielu zastosowań, w tym do zabezpieczenia wewnętrznych serwerów lub aplikacji.
/ Ograniczenia: Darmowe certyfikaty mogą mieć pewne ograniczenia, takie jak krótszy okres ważności, czy brak niektórych funkcji oferowanych przez płatne certyfikaty.
/ Zastosowanie wewnętrzne vs. zewnętrzne: Dla zastosowań zewnętrznych, gdzie istnieje potrzeba budowania szerokiego zaufania klientów lub użytkowników, zaleca się rozważenie płatnych certyfikatów ze względu na ich wyższy poziom weryfikacji i zaufania.

=== Możliwe dopytania

- Czy certyfikaty są płatne, dlaczego niektóre certyfikaty są droższe niż inne? (Manus)
Skąd sie biorą zaufane urzędy certyfikacji na świezo kupionym komputerze? (Tytus Pikies) (odp: Są dołączane razem z systemem operacyjnym i użytkowanym oprogramowaniem, np. przeglądarką.)
W jaki sposób przechowuje się podpis elektroniczny? (Daciuk) (TODO?)
Ile jest root CA na świecie? (Gumiński) (odp: Trudno stwierdzić pewnie kilkadziesiąt, może niskie kilkaset. Mozilla na dzień 07.01.2026 dodaje w zestawie z przeglądarką 181 certyfikatów. @CAIncludedCertificates)
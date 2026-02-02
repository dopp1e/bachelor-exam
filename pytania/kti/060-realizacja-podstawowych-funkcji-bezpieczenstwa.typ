#import "../../res/question.typ": question

#show: question.with(
  q: "Realizacja podstawowych funkcji bezpieczeństwa dla płaszczyzny sygnalizacji i transmisji danych w usługach multimedialnych.",
)


System telekomunikacyjny bazujący na IP jest co najwyżej tak bezpieczny jak sieć IP pod nim. Klasyczne rozwiązania telekomunikacyjne były dużo prostsze do zabezpieczenia, bo nie były wpięte w Internet.

=== Podstawowe funkcje bezpieczeństwa
- *integralność danych* - zapewnienie, że dane nie zostały zmienione lub uszkodzone podczas transmisji, użycie jakiegoś mechanizmu kontroli integralności (np. sumy kontrolne, hashe kryptograficzne).
- *poufność danych* - zapewnienie, że dane są dostępne tylko dla uprawnionych użytkowników, użycie szyfrowania (np. AES, TLS).
- *autentyczność* - zapewnienie, że tożsamość użytkownika lub urządzenia jest prawidłowa, użycie mechanizmów uwierzytelniania (np. hasła, certyfikaty cyfrowe).
- *niezaprzeczalność* - integralność + autentyczność, zapewnienie, że podmiot nie może wyprzeć się wykonania określonej czynności. Gwarantuje, że nadawca nie może zaprzeczyć, że wysłał wiadomość, a odbiorca nie może zaprzeczyć, że ją otrzymał. Użycie podpisów cyfrowych (np. RSA, DSA).

=== Płaszczyzna sygnalizacji
Płaszczyzna sygnalizacji w usługach multimedialnych opiera się na protokołach takich jak *SIP (Session Initiation Protocol)* i *H.323* (na wykładzie był głównie SIP, więc na nim się skupimy). Aby zapewnić bezpieczeństwo w SIP stosuje się *SIPS (SIP Secure)*, który wykorzystuje protokół *TLS (Transport Layer Security)*. SIPS zapewnia:
- Wiadomości sygnalizacyjne są przesyłane tunelem TLS zestawionym z użyciem np. PKI przebiega to w następujących krokach:
  - Potwierdzenie toższamości serwera SIP za pomocą certyfikatu cyfrowego.
  - Zestawienie sesji TLS (negocjacja algorytmów szyfrowania, wymiana kluczy).
  - Szyfrowanie wiadomości SIP w ramach sesji TLS (poufność).
  - TLS wykorzystuje mechanizmy kontroli integralności (np. *HMAC - Hash based Message Authentication Code*) (integralności danych).
  - Uwierzytelnianie użytkowników SIP za pomocą mechanizmów takich jak Digest Authentication lub certyfikaty cyfrowe (autentyczność).
- Klient wysyłający wiadomość sygnalizacyjną tworzy tunel tylko z pierwszym serwerem SIP, nie z drugim ani końcowym odbiorcą.
- Między każdą parą serwerów SIP może być zestawiony oddzielny tunel TLS. Natomiast każdy serwer na trasie musi być w stanie odczytać wiadomości oraz je dowolnie modyfikować. Jest to główna różnica w stosunku do HTTPS, gdzie tylko końcowy serwer może odczytać wiadomość. Dlatego SIPS nie zapewnia pełnej poufności end-to-end tylko hop-by-hop. Z tego powodu używanie SIPS ma tylko sens jeśli serwery będą odpowiedzialnie tunelować ruch i nie będą próbowały podsłuchiwać wiadomości.

=== Płaszczyzna transmisji danych
Obejmuje faktyczne przesyłanie danych multimedialnych, takich jak audio, wideo czy tekst. Na wykładzie omawialiśmy tylko *RTP* (Real-time Transport Protocol) i jego rozszerzenie *SRTP (Secure RTP)*, które dodaje funkcje bezpieczeństwa do RTP. SRTP zapewnia:
- szyfrowanie *AES-CM 128* (poufność).
- użycie *HMAC-SHA1* (integralność danych, autentyczność) może działać w następujący sposób:
  - W hash wiadomości zamieszczany jest klucz symetryczny:
    - Klucz symetryczny jest mieszany z dwoma stałymi wartościami dopełniającymi: ipad (inner padding) oraz opad (outer padding) za pomocą operacji XOR. Dopiero te wyniki są łączone z wiadomością i poddawane haszowaniu.
    - Weryfikacja: Jeśli odbiorca (posiadający ten sam klucz) wygeneruje identyczny kod HMAC, potwierdza integralności (wynik SHA-1 nie zgadzałby się), autentyczność (tylko posiadacz klucza symetrycznego mógłby wygenerować poprawny wynik)
  - Zamiast HMAC można użyć podpisu cyfrowego (np. RSA, DSA) do zapewnienia integralności i niezaprzeczalności, lecz jest to wolniejsze, a wydajność jest kluczowa w transmisji multimedialnej w czasie rzeczywistym.
- osobny kanał służący wymianie kluczy ze względu na dużą ilość przesyłanych wiadomości w audio/wideo istnieje potrzeba częstej wymiany kluczy szyfrowania (nowe klucze są tworzone na podstawie master key stworzonego na początku).
- nie zapewnia niezaprzeczalności

Istnieje jeszcze możliwość użycia *ZRTP (Z Real-time Transport Protocol)*, który zapewnia szyfrowanie end-to-end. Działa to w następujący sposób:
- Wykorzystuje protokół *Diffie-Hellman* do bezpiecznej wymiany kluczy między dwoma końcowymi punktami komunikacji bez potrzeby użycia zaufanego trzeciego serwera.
- Klucz jest następnie używany do zabezpieczenia transmisji SRTP (generowane klucze asymetryczne są tymczasowe generowanie i wymieniane dla każdej sesji komunikacyjnej, co zapewnia odporność na ataki MiTM).
- Może być wykorzystany z dowolnym protokołem sygnalizacyjnym (np. SIP, H.323).
- Niezależny od warstwy sygnalizacji, ponieważ cała wymiana klucza oraz negocjacje zachodzą w strumieniu RTP.

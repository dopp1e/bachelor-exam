#import "../../res/question.typ": question

#show: question.with(
  q: "Zasady budowy interfejsów użytkownika systemów informatycznych."
)

Interfejs użytkownika to warstwa systemu informatycznego, która pośredniczy między zasobami sprzętowymi, czy samym oprogramowaniem, a użytkownikiem.
Jego głównym celem jest dostarczenie wszystkich funkcjonalności tak, aby użytkownik mógł z nich korzystać intuicyjnie i bez problemów.

=== Podstawowe zasady

+ *Intuicyjność:*  Interfejs powinien być łatwy w obsłudze bez konieczności szkolenia.
  Można stosować konwencje istniejące już w innych interfejsach (np. stosować ikonę śmietnika dla czynności usuwania plików).
+ *Spójność:* Wszystkie elementy interfejsu powinny wyglądać i działać w podobny sposób.
  Należy np. używać kolorów pasujących do siebie, takiej samej czcionki wszędzie i pasujących ikon.
  Ułożenie elementów powinno podążać za ustalonym schematem - jeśli w różnych miejscach przycisk "Anuluj" jest po lewej stronie, to nie powinien być po prawej w innym miejscu.
  #figure(
    image("../../obrazki/graphic-design.webp", width: 60%)
  )
+ *Minimalizm:* Zapewnienie, że interfejs dostarcza wyłącznie istotne informacje i użytkownik nie czuje się przytłoczony ilością informacji na ekranie.
+ *Dostępność:* Projektowany tak, aby mogło z niego korzystać największa grupa ludzi, wliczając to ludzi z ograniczeniami, np. wzroku, słuchu czy zdolności motorycznych.
  Przykładowo zapewnienie możliwości zwiększenia kontrastu.
  #figure(
    image("../../obrazki/wysoki-kontrast.webp", width: 40%)
  )
+ *Informacja zwrotna:* System powinien informować użytkownika o statusie wykonywania zadań, a użytkownik powinien wiedzieć co się w danym momencie dzieje z systemem.
  Niepożądanym jest wzbudzenie poczucia zawieszenia się systemu u użytkownika.
  W tym celu można stosować np. prompty informacyjne, czy paski postępu operacji
+ *Elastyczność i personalizacja:* Zazwyczaj nie jest priorytetem, ale dobrze jest zapewnić użytkownikowi możliwość dostosowania interfejsu do własnych potrzeb.
  Może też być elementem dostępności.

=== Heurystyki Jakoba Nielsena

Jest to zbiór 10 zasad projektowania interfejsów które mają na celu poprawę użyteczności systemów informacyjnych.
Są to tak jakby metryki które są stosowane do oceny istniejącego już interfejsu aczkolwiek znając je można zawczasu projektować tak interfejs aby pomyślnie przeszedł przez testy heurystyki. 

1. *Widoczność stanu systemu:* Użytkownik powinien na bieżąco być informowany o stanie systemu (paski ładowania, animacje, komunikaty).
2. *Zgodność systemu ze światem rzeczywistym:*  Interfejs powinien korzystać terminologii i symboli znanych użytkownikowi z codziennego życia. (np. koszyk na zakupy w sklepie internetowym).
3. *Kontrola i swoboda użytkownika:* Powinno się zapewnić użytkownikowi możliwość wycofania się z jakiejś akcji (np. cofnij albo anuluj kiedy ma już coś kupić bo adres dostawy się nie zgadza), zwłaszcza jeśli jest to akcja nieodwracalna.
4. *Spójność i standard:* Estetyka i działanie elementów interfejsu powinny być zgrane w jakimś standardzie, czyli zasada 2 z poprzedniego zestawu.
5. *Zapobieganie błędom:* Interfejs powinien być zaprojektowany tak aby minimalizować możliwość popełnienia błędów przez użytkownika (np. potwierdzenie przed usunięciem pliku).
6. *Rozpoznawanie zamiast przypominania:* Interfejs powinien ułatwiać rozpoznawanie dostępnych opcji zamiast zmuszać użytkownika do pamiętania szczegółowych informacji (np. wybieranie opcji zamiast wpisywania ID).
7. *Elastyczność i efektywność:* System powinien umożliwiać zaawansowanym użytkownikom możliwość przyspieszenia pracy (np skróty klawiaturowe) oraz dostosowania interfejsu do własnych potrzeb (np. zmiana układu paneli w IDE).
8. *Estetyka i minimalizm:* Unikanie zbędnych informacji, dostarczanie wyłącznie tych, które są w danej chwili potrzebne żeby nie przytłoczyć użytkownika.
9. *Pomoc w rozwiązywaniu problemów:* System powinien jasno komunikować błędy i sugerować sposoby naprawy (np. komunikat "Brak połączenia z internetem. Sprawdź swoje ustawienia sieciowe.").
10. *Dokumentacja i pomoc:* Interfejs powinien zapewnić łatwy dostęp do dokumentacji czy samouczków.

== Możliwe dopytania

- Wymień zasady interfejów konsolowych CLI. (Dziubich)
- Kazał wymienić 10 heurystyk Nielsena a potem dokładnie jedną opisać. (Manus)
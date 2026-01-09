#import "../../res/question.typ": question

#show: question.with(
  q: "Cechy charakterystyczne rozwiązań typu Time Series Database i ich zastosowania w systemach monitorowania sieci."
)

TSDB to kategoria baz danych zoptymalizowana pod kątem przechowywania i analizy danych szeregów czasowych. TSDB umożliwia przechowywanie nielimitowanych ilości danych historycznych i oferuje zawansowane funkcje analityczne oraz agregacje.
- Przechowuje dane z sygnaturami czasowymi w sposób równomierny (z dowolnymi interwałami czasowymi między danymi)
- Jest skalowalna i wspiera zawansowane zapytania takie jak analizy trendów przewidywanie i porównania okresów.

=== Cechy charakterystyczne
- *Struktura danych oparta na czasie* - przechowywane dane zapisywane są jako serie punktów danych, gdzie każdy punkt ma przypisaną sygnaturę czasową.
- *Wysoka wydajność zapisu* - są zoptymalizowane do szybkiego zapisywania dużych ilości danych najczęściej stosują model append-only w celu jak najszybszego zapisu.
- *Kompresja danych* - często wykorzystują techniki kompresji danych w celu zmniejszenia wymagań dotyczących przestrzeni dyskowej.
- *Agregacje i funkcje analityczne* - oferują wbudowane funkcje do agregacji danych (downsampling – np. zamiana danych co 1 sekunda na średnie z 1 minuty),(np. średnie, sumy, min/max) oraz analizy trendów.
- *Integracja z narzędziami monitorującymi* - są często integrowane z narzędziami do monitorowania i wizualizacji danych, takimi jak Grafana czy Prometheus.
- *Skalowalność* - są zaprojektowane do obsługi dużych ilości danych i mogą być skalowane poziomo poprzez dodawanie kolejnych węzłów do klastra (to nie do wszystkich TSDB).
- *Polityka retencji danych* - umożliwiają definiowanie polityk retencji danych, co pozwala na automatyczne usuwanie starszych danych po określonym czasie lub ich agregacje.
- *Usuwanie duplikatów* - W przypadku pojawienia się tych samych danych z tymi samymi znacznikami czasowymi, TSDB często oferują mechanizmy do wykrywania i usuwania duplikatów, co pomaga w utrzymaniu integralności danych.

=== Zastosowania
Jako główne zastosowanie to raczej chodzi o możliwość agregacji danych i zapominania z czasem. Są to bazy danych używane do przechowywania danych z monitoringu sieci, aplikacji, infrastruktury IT, IoT (Internet of Things) które generują bardzo duże ilości danych w krótkim czasie, a ten mechanizm pozwala na efektywne zarządzanie tymi danymi. Reszta zastosowań pasuje również do innych baz danych.
- *Monitorowanie wydajności sieci* - dzięki przechowywaniu metryk takich jak przepustowość, opóźnienia, straty pakietów możemy szybko wykryć i zdiagnozować problemy z siecią.
- *Analiza trendów i planowanie wydajności* - analiza historycznych danych pozwala na identyfikację wzorców i trendów, co pomaga w planowaniu zasobów i optymalizacji wydajności sieci.
- *Tworzenie alarmnów i ostrzeżeń* - na podstawie zdefiniowanych progów i wzorców można generować alarmy w przypadku wykrycia anomalii lub przekroczenia określonych wartości.
- *Wizualizacja stanu sieci* - integracja z narzędziami do wizualizacji danych (np. Grafana) umożliwia tworzenie dashboardów prezentujących aktualny stan i historię wydajności sieci.
- *Raportowanie i audyt* - przechowywanie danych historycznych umożliwia tworzenie raportów dotyczących wydajności sieci oraz spełniania wymagań SLA (Service Level Agreement).

=== TSDB vs RRD (Round Robin Database)
- *Elastyczność użycia* - TSDB są bardziej elastyczne w przechowywaniu danych o różnych interwałach czasowych i umożliwiają łatwe dodawanie nowych serii danych, podczas gdy RRD mają stałą strukturę i wymagają z góry zdefiniowanych interwałów.
- *Wydajność i Skalowalność*:
  - RRD jest systemem plikowym. Każda metryka to zazwyczaj osobny plik .rrd. Przy tysiącach urządzeń i milionach metryk, operacje wejścia/wyjścia (I/O) na systemie plików stają się wąskim gardłem. RRD bardzo trudno skalować horyzontalnie (na wiele serwerów).
  - TSDB są projektowane jako systemy rozproszone. Mogą obsługiwać miliony punktów danych na sekundę i rozkładać obciążenie na klaster serwerów.
- *Utrata precyzji*:
  - RRD z założenia przechowuje dane w sposób zagregowany. Po pewnym czasie dane o wysokiej rozdzielczości (np. co 1 sekunda) są nadpisywane przez średnie (np. co 1 godzina). Raz utraconych detali nie da się odzyskać.
  - TSDB pozwalają na przechowywanie surowych danych (raw data) tak długo, jak pozwala na to miejsce na dysku. Możesz sprawdzić dokładnie, co działo się o godzinie 14:05:02 sprzed miesiąca, jeśli Twoja polityka retencji na to pozwala (agregacja jest zależna tylko od polityk można je zmieniać dostosowywać).
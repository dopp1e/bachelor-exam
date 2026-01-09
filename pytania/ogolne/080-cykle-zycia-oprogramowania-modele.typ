#import "../../res/question.typ": question

#show: question.with(
  q: "Cykle życia oprogramowania (modele wytwarzania oprogramowania)."
)

/ Model wytwarzania oprogramowania: Koncepcja, schemat opisujący organizację procesu wytwarzania systemu który zawiera podział na etapy i kryteria przechodzenia między nimi. Model nie wchodzi w szczegóły związane z narzędziami, technikami czy sposobami realizacji pracy w procesie. Jest to istotne aby nie mylić modelu wytwarzania od metodyki wytwarzania ponieważ są to dwa różne pojęcia. Do modeli zaliczają się np waterfall, v-model, modele iteracyjne, itd.

/ Metodyka wytwarzania oprogramowania: Konkretna metoda która jest zbiorem szczegółowych zasad, narzędzi i praktyk stosowanych w konkretnym procesie tworzenia oprogramowania. Metodyka może bazować na jednym lub więcej modelach wytwarzania, ale definiuje konkretne sposoby realizacji tych etapów. Do metodyk zaliczamy np. Scrum, Kanban, Extreme programming.

=== Modele nieformalne

*Cowboy Coding*

Jest to model, w którym programiści mają całkowitą autonomię w kwestii podejmowania decyzji co do technicznych aspektów jak wykorzystywane narzędzia, algorytmy, języki i styl programowania.
W tym modelu nie ma żadnego ustrukturyzowanego procesu, żadnej prowadzonej dokumentacji i raczej nie jest nastawiony do pracy w zespole, czy z interesariuszami.
Jest to styl charakterystyczny na poziomie hobbistycznym czy studenckim, jak tworzenie prestashopa na dockerze.
Jest to bardziej programistyczny żarcik, mem, niż faktyczny model. 

Zalety:
- szybkie tworzenie prototypów,
- pełna autonomia programistów. 

Wady:
- *brak koordynacji* pozwalającej na współpracę w zespole czy z interesariuszami,
- *brak zapewnienia jakości projektu i kodu* bez uwzględnienia testowania kodu,
- *niska skalowalność* - dla małych projektów (np. gier tworzonych jako hobby) może zupełnie wystarczyć, natomiast dla wielkich projektów już nie.

=== Modele tradycyjne (sekwencyjne)

*Model kaskadowy (klasyczny, Waterfall)*

Jest to sekwencyjny model wytwarzania oprogramowania, w którym proces jest podzielony na fazy, gdzie warunkiem przejścia do następnej jest całkowite zakończenie poprzedniej.
W przypadku wykrycia błędu należącego do konkretnej fazy należy do niej wrócić i zrobić wszystkie kolejne po kolei.
W każdym etapie tematem zainteresowania jest cały wytwarzany system. 

Etapy modelu kaskadowego:
1. *Planowanie:* ustalenie celu przedsięwzięcia, analiza biznesowa i studium wykonalności,
2. *Analiza wymagań:* zebranie i zrozumienie potrzeb i oczekiwań użytkowników końcowych,
3. *Projektowanie:* Określenie struktury technicznej i architektonicznej systemu biorąc pod uwagę wymagania,
4. *Implementacja:* przekładanie projektu i specyfikacji na kod,
5. *Testowanie i akceptacja:* Weryfikacja i walidacja czy oprogramowanie działa zgodnie z wymaganiami i nie posiada błędów,
6. *Wdrażanie:* Przeniesienie oprogramowania z środowiska testowego do produkcyjnego,
7. *Utrzymanie:* Zapewnienie ciągłej pracy i poprawności oprogramowania po jego wdrożeniu.

#figure(
  image("../../obrazki/waterfall-model.webp", width: 60%)
)

*Zalety:*
- Łatwy do zrozumienia,
- Obejmuje wszystkie obszary inżynierii oprogramowania i wprowadza systematykę,
- Pozwala na zdefiniowanie etapów pracy,
- Pozwala na dekompozycję pracy dla różnych ról (projektant, programista tester) oraz rozłożenie ich zaangażowania w czasie,
- Narzuca dobre praktyki - dobre zrozumienie przed implementacją.

*Wady:*
- Uchwycenie całego problemu i wszystkich wymagań przed projektowaniem jest niemożliwe. Interesariusze często zmieniają zdanie co chcą lub my źle zrozumieliśmy co interesariusz chce. Wymagania mogą się też po prostu zmieniać,
- Działające oprogramowanie powstaje bardzo późno - dopiero na końcu można cokolwiek pokazać interesariuszom (brak komunikacji z interesariuszami podczas wytwarzania),
- Ogromny narzut pracy jeżeli zostanie wykryty błąd - reguła 1:10 według której koszt naprawy rośnie dziesięciokrotnie z kazdym etapem wytwarzania (np. jeśli błąd implementacji zostanie wykryty w planowaniu to koszt naprawy będzie 1000 razy droższy niż kontynuacja pracy w etapie planowania).

*Model V*

Model V jest odmianą modelu kaskadowego, gdzie testowanie jest planowane równolegle z każdą fazą wytwarzanie, co pomaga zapewnić zgodność z wymaganiami na każdym etapie.
Dodatkowo zględem modelu kaskadowego w modelu V, wymaganiem przed przejściem do kolejnej fazy jest zaplanowanie testów.
Po zakończeniu implementacji, następuje faza testowania, wykonywana od szczegółu do ogółu, gdzie każdy etap testowania odpowiada fazie wytwarzania.
Jeżeli zostanie wykryty błąd na jakimś etapie testowania, to wracamy do etapu wytwarzania, do którego ten etap testowania był przypisany.

#figure(
  image("../../obrazki/v-model.webp", width: 60%)
)

*Zalety:*
- Wszystkie zalety kaskadowego,
- Ukierunkowany na wysoką jakość wytwarzanego produktu (na każdy etap wytwarzania jest specjalny zbiór testów zapewniający zgodność z oczekiwanym produktem),
- Obniża ryzyko popełnienia dużego błędu.

*Wady:*
- Przejmuje większość wad modelu kaskadowego,
- Znaczne narzuty pracy, czasu i kosztu poświęcane na jakosć i testy.
  - Jeżeli gdzieś zostanie wykryty błąd to trzeba też naprawić testy!

=== Modele iteracyjne

Modele iteracyjne charakteryzują się tym że zamiast jednego przebiegu procesu wytwarzania programu jak w modelu kaskadowym / V, wykonywanych jest kilka iteracji całego przebiegu.
W ramach każdego przebiegu (iteracji) powstaje jakaś tymczasowa (nieostateczna) wersja produktu.
W tych modelach nie zachodzi powrót do wcześniejszych etapów - problemy są naprawiane w kolejnych wersjach produktu.

Umożliwia to:
- Głębsze zrozumienie potrzeb klienta w trakcie rozwijania produktu przez zespół deweloperski,
- Lepsze sprzężenie zwrotne od użytkowników i innych intersariuszy (po prostu feedback od użytkowników),
- Dostosowanie się do potrzeb (również tych zmieniających się w trakcie),
- Poprawianie defektów w kolejnej iteracji.

Ze względu na charakter kolejnych iteracji wyróżniamy:
- dodanie kolejnej porcji funkcjonalności - *model przyrostowy*,
- wizualizacja wymagań i ich lepsze zrozumienie - *model prototypowy*,
- zaadresowanie największego ryzyka - *model spiralny*.

*Model przyrostowy*

Model przyrostowy dzieli proces wytwarzania oprogramowania na mniejsze fragmenty, które są rozwijane i dostarczane stopniowo.
Każdy przyrost dodaje kolejną funkcjonalność aż do uzyskania pełnego sytemu.
Na koniec każdej iteracji przedstawia się nową funkcjonalność interesariuszowi, co daje możliwość lepszego kontaktu i aktualizację wymagań od klienta.
W porównaniu do modelu kaskadowego można powiedzieć że w każdej iteracji tematem zainteresowania jest pewien wyznaczony fragment systemu.

#figure(
  grid(
    columns: 2,
    align: horizon,
    image("../../obrazki/przyrost-1.webp", width: 100%),
    image("../../obrazki/przyrost-2.webp", width: 100%)
  )
)

*Zalety:*
- Stabilizacja wymagań na poziomie realizacji danego przyrostu. Nie ma konieczności pełnej specyfikacji całego systemu,
- Namacalny produkt powstaje znacznie szybciej,
- Większe zaangażowanie interesariuszy w proces.

*Wady:*
- Przydatny jedynie do produktów gdzie można wydzielić podsystemy (zbiory funkcjonalności),
- Długotrwałość dojścia do rozwiązania docelowego,
- Przy analizie przyrostu może się okazać że określony zakres jest niewystarczający.

*Model prototypowy*

Model prototypowy polega na szybkim tworzeniu wstępnej wersji oprogramowania, która jest następnie oceniana przez użytkowników.
Na podstawie ich opinii prototyp jest modyfikowany i rozwijany w kierunku końcowego produktu.

Podstawowym celem prototypowania jest identyfikacja wymagań poprzez budowę kolejnych przybliżeń systemu.
Poza prototypowaniem wymagań możliwe jest również prototypowanie konstrukcji.

#figure(
  image("../../obrazki/model-prototypowy.webp", width: 60%)
)

Rodzaje prototypowania:
- Prototypy "do wyrzucenia" - prototyp przygotowywany z myślą o identyfikacji wymagań a nie budowie docelowego produktu:
    - Model "papierowy" - rysunki interfejsów systemu,
    - Model "symulowany" - analityk odgrywa rolę systemu,
    - Model "programowy" - oprogramowanie w celu demonstracji (interfejs i uproszczona funkcjonalność).
- Model "ewolucyjny" - częściowo wykonany system docelowy.

*Zalety:*
- Wspomaganie identyfikacji wymagań,
- Zwiększenie udziału interesariuszy w procesie wytwarzania,
- Lepsza walidacja systemu, interesariusz może odnieść się do prototypu,
- Możliwość oceny i doboru alternatywnych rozwiązań.

*Wady:*
- Budowa i wprowadzanie zmian do prototypu pochłania czas i koszty,
- Projektant może "przyzwyczaić się" do rozwiązań z prototypu i użyć ich w docelowym systemie, a mogą one nie spełniać wymagań,
- Klient widzi działający prototyp i nie rozumie dlaczego wymaga dalszej pracy.

*Model spiralny*

#figure(
  image("../../obrazki/model-spiralny.webp", width: 60%)
)

Model iteracyjny uwzględniający rownież zarządzanie ryzykiem.
Proces rozwija się w formie spirali, w której każda pętla obejmuje planowanie, analizę ryzyka, wytwarzanie i ocenę intersariuszy.
Ten model jest najbardziej przydatny dla przedsięwzięć obarczonych dużym ryzykiem, gdzie konieczna jest ocena stanu, zagrożeń i dostosowanie na tej podstawie dalszych działań.

Zalety:
- jawne wskazanie ryzyka i jego analizy,
- mocne ukierunkowanie na zmiany — kolejna iteracja może obejmować ich wprowadzenie albo wręcz być temu poświęcona,
- szybsza detekcja i rozwiązywanie problemów.

Wady:
- model trudny do zrozumienia/wyjaśnienia,
- duży koszt zarządzania ryzykiem,
- długi czas dojścia do rozwiązania docelowego.

*Model ponownej inżynierii oprogramowania (reverse engineering)*

Model wytwarzania dla sytuacji, gdzie istnieje już jakiś system, który ma zostać zastąpiony nowym.
Dla starego systemu może nie być dokumentacji (którą trzeba wówczas odtworzyć na podstawie kodu i działania), a nawet może nie być kodu źródłowego (konieczna dekompilacja)

#figure(
  image("../../obrazki/model-ponowny.webp", width: 80%)
)
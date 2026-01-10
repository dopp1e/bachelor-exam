#import "../../res/question.typ": question

#show: question.with(
  q: "Podział i przykłady algorytmów uczenia maszynowego.",
)

=== Uczenie maszynowe

Uczenie maszynowe (_Machine Learning_, ML) to obszar sztucznej inteligencji poświęcony algorytmom zdolnym do samodzielnego “uczenia się”, czyli poprawiania jakości działania poprzez doświadczenie.
Algorytmy te zdobywają doświadczenie poprzez karmienie danymi (często w ogromnych ilościach), co pozwala im na optymalizację swoich właściwości, zwiększając dokładność podejmowanych decyzji czy predykcji (educated guess).

=== Podział Algorytmów ML

*Podział ze względu na udział wiedzy zewnętrznej w procesie trenowania:*
- Uczenie nadzorowane,
- Uczenie nienadzorowane,
- Uczenie półnadzorowane,
- Uczenie ze wzmocnieniem.

*Podział ze względu na możliwość uczenia się w czasie rzeczywistym:*
- Uczenie przyrostowe,
- Uczenie wsadowe.

*Podział ze względu na sposób pracy:*
- Uczenie z przykładów,
- Uczenie z modelów.

=== Podział ze względu na udział wiedzy zewnętrznej w procesie trenowania

Podział ten odnosi się do charakteru danych na podstawie których algorytm tworzy swój model uczący.
To na jakich danych uczy się model (co mu dostarczamy) pozwala nam rozwiązać różne problemy, np. klasyfikacyjne czy regresyjne.

*Uczenie nadzorowane*

W tych modelach algorytm uczący się dostaje dane do nauczenia się w taki sposób że są one “oznakowane” w takim sensie że dla każdego wejścia znana jest odpowiedź (tak zwana etykieta).
Model stara się nauczyć jaka jest relacja między danymi wejściowymi a wyjściowymi, dzięki czemu może stawiać predykcje jeżeli da mu się jakiś nowy przykład.

#figure(
  image("../../obrazki/ml-etykietowanie-maili.webp", width: 80%),
)

Modele z uczeniem nadzorowanym są wykorzystywane do rozwiązanie problemów należących do dwóch kategorii:
- Regresja - przewidywanie wartości ciągłych (np. cena domu, temperatura),
- Klasyfikacja - przypisywanie danych do określonych kategorii (np. rozpoznawanie obrazów, filtrowanie spamu).

Algorytmy rozwiązujące problem regresji:
- *Regresja liniowa* - Model próbuje dopasować funkcję liniową w ten sposób żeby odległość między linią a danymi łącznie była jak najmniejsza (był jak najmniejszy błąd). Sposobem osiągnięcia czegoś takiego jest np. metoda najmniejszych kwadratów.
  #figure(
    image("../../obrazki/ml-regresja-liniowa.webp", width: 70%),
  )
- *Regresja wielomianowa* - Podobna do regresji liniowej, ale dopasowuje wielomian do danych zamiast linii prostej. Pozwala to na modelowanie bardziej złożonych zależności.
  #figure(
    image("../../obrazki/ml-regresja-wielomianowa.webp", width: 70%),
  )
- *Drzewo regresyjne* - Dzieli dane na mniejsze grupy (węzły) w sposób hierarchiczny, stosując reguły decyzyjne. Na końcu drzewa, w liściach obliczane są wartości prognozowane. Drzewa regresyjne przewidują wartość ciągłą na podstawie przynależności do odpowiednich gałęzi drzewa.
  #figure(
    image("../../obrazki/ml-drzewo-regresyjne.webp", width: 70%),
  )
- *Sieci neuronowe* - Model korzystający z neuronów połączonych ze sobą, bazująca na budowie mózgów oraz zasadzie "_neurons that fire together, wire together_" @HebbianTheory2025. W wersji klasycznej (sieci konwolucyjnej, _Convolutional Neural Network_, CNN), sieci te składają się z warstwy wejściowej, warstwy wyjściowej oraz warstw "ukrytych". Model ten uczy się na danych poprzez właśnie dobieranie odpowiednich wag w funkcjach aktywacji neuronów. Sieci neuronowe mogą służyć zarówno do problemów regresji jak i klasyfikacji. Przykład: rozpoznanie zapisanej liczby @MNISTDatabase2025.
// ^ ten opis może można lepiej sformułować

Algorytmy rozwiązujące problem klasyfikacji:
- *Drzewa decyzyjne* - Analogiczne do drzew regresyjnych, ale zamiast przewidywać wartość ciągłą, przypisują dane do określonych klas na podstawie zestawu reguł decyzyjnych.
- *Metoda k-najbliższych sąsiadów (KNN - K Nearest Neighbours)* - Klasyfikuje dane na podstawie podobieństwa do najbliższych k sąsiadów w przestrzeni cech.
  #figure(
    image("../../obrazki/ml-k-sasiadow.webp", width: 70%),
  )
- *Maszyny wektorów nośnych (SVM Support Vector Machine)* - Polega na znalezieniu linii (w dwuwymiarowej przestrzeni) lub płaszczyzny (w trójwymiarowej przestrzeni), która najlepiej oddziela kategorie (np. spam i nie spam).
  #figure(
    image("../../obrazki/ml-svm.webp", width: 70%),
  )
- *Naiwny klasyfikator Bayesa* - Wykorzystuje twierdzenie Bayesa i zakłada niezależność cech do przypisywania kategorii (dlatego “naiwny”). Może np. obliczyć prawdopodobieństwo że email należy do spamu na podstawie słów w nim.
- *Las losowy* - Algorytm, który tworzy wiele drzew decyzyjnych, z których każde drzewo jest trenowane na losowej próbce danych. Klasyfikacja jest dokonywana na podstawie głosowania wyników z poszczególnych drzew.
- *Sieci neuronowe* - Analogiczne do tych używanych w regresji, ale skonfigurowane do klasyfikacji. Mogą mieć różne architektury, takie jak sieci konwolucyjne (CNN) dla obrazów czy rekurencyjne sieci neuronowe (RNN) dla danych sekwencyjnych.

*Uczenie nienadzorowane*

Model otrzymuje dane w postaci nieoznakowanej, bez etykiet.
Modele uczące się na tych danych zasadniczo nie wiedzą co klasyfikują, ale są w stanie rozpoznać wzorce lub relacje w danych.

*Analiza skupień*

Analiza skupień (Clustering) - Celem jest podział danych na grupy (skupienia), gdzie dane w tej samej grupie są bardziej podobne do siebie niż do danych z innych grup.

Algorytmy analizy skupień:
- *Metoda k-średnich (k-means)* - Dzieli dane na k grup, minimalizując odległości między danymi (np. w postaci punktów), a środkiem ich grupy (centroidami). Początkowe położenie centroidów jest losowe a ich liczba k jest podawana na wejście algorytmu. Proces jest iteracyjny - centroidy są aktualizowane aż grupy staną się stabilne.
  #figure(
    image("../../obrazki/ml-k-means.webp", width: 70%),
  )
- *Hierarchiczna analiza skupień* - Tworzy hierarchię grup zaczynając od pojedynczych punktów i łączy je w większe skupienia aż powstanie jedna grupa. Można analizować różne poziomy hierarchii.
  #figure(
    image("../../obrazki/ml-hierarhiczne-skupienie.webp", width: 50%),
  )
- *DBSCAN (Density Based Spacial Clustering of Applications with Noise)* - Grupuje punkty na podstawie ich zagęszczenia w przestrzeni - punkty w gęsto zaludnionych obszarach są grupowane, a punkty w rzadko zaludnionych są oznaczane jako szum.
  #figure(
    [#image("../../obrazki/ml-dbscan-1.webp", width: 70%)
      #image("../../obrazki/ml-dbscan-2.webp", width: 70%)],
  )

*Wykrywanie anomalii i nowości*

Celem jest identyfikacja rzadkich lub nietypowych danych, które różnią się od większości:
- *Jednoklasowa maszyna wektorów nośnych (One-Class SVM)* - Uczy się co jest “normalne” na podstawie jednego zestawu danych, a następnie wykrywa dane odstające jako anomalie. Model buduje granice wokół normalnych danych.
  #figure(
    image("../../obrazki/ml-one-class-svm.webp", width: 70%),
  )

*Wizualizacja i redukcja wymiarowości*

Celem jest uproszczenie danych o wysokiej liczbie cech (wymiarów) zachowując jak najwięcej detali ich struktury.
Badamy które wymiary przynoszą najmniej informacji i staramy się je zlikwidować.
Może być używane do przygotowania danych dla innych algorytmów lub wizualizacji.

Algorytmy redukcji wymiarowości:
- *Analiza głównych składowych (PCA - Principal Component Analysis)* - Redukuje liczbę wymiarów identyfikując te kierunki (główne składowe, _principal components_), które mają największe znaczenie dla zmienności danych. Dane są przekształcane w nową przestrzeń współrzędnych.
  #figure(
    image("../../obrazki/ml-pca.webp", width: 70%),
  )

*Uczenie półnadzorowane*

W uczeniu półnadzorowanym wykorzystywane są zarówno dane oznaczone etykietami, jak i nieoznaczone.
Dane oznaczone stanowią zazwyczaj niewielką część zbioru, a nieoznaczone dane pomagają w poprawie jakości modelu.
Pozwala to na redukcję kosztów oznaczania danych przy jednoczesnym wykorzystaniu dużych ilości dostępnych danych nieoznaczonych.

Przykładowy algorytm:
- *Self-training (Samotrenowanie)* - Algorytm najpierw trenuje klasyfikator na oznaczonych danych. Następnie wykorzystuje ten klasyfikator, aby przypisać etykiety najbardziej pewnym przykładom z nieoznaczonych danych i trenuje się ponownie. Przykładowo klasyfikowanie zdjęć produktów gdzie część zdjęć jest oznaczona (np. "koszula") a reszta wymaga przypisania etykiet.
  #figure(
    image("../../obrazki/ml-selftraining.webp", width: 50%),
  )

*Uczenie przez wzmacnianie*

Agent uczy się podejmować decyzje w środowisku (wirtualnym lub rzeczywistym) poprzez wykonywanie akcji i obserwowanie ich skutków - otrzymując nagrody za poprawne działania i kary za błędne.
Celem agenta jest maksymalizacjia długoterminowej sumy nagród poprzez naukę strategii.

Podstawowe pojęcia w Reinforcement Learning (RL):
1. *Agent* - Decydent który podejmuje akcje (np. robot, program grający w grę),
2. *Środowisko* - Otoczenie w którym działa agent,
3. *Bufor* - Magazyn danych przechowujący informacje zebrane przez agenta w trakcie uczenia,
4. *Akcja* - Czynnosć którą agent może wykonać.

*Jak działa reinforcement learning?*
1. Agent zaczyna od braku wiedzy i eksploruje środowisko.
2. Wykonując akcje, agent otrzymuje nagrody i aktualizuje swoją politykę.
3. Algorytmy RL wykorzystują te informacje by poprawiać decyzje agenta.

*Podział ze względu na możliwość uczenia się w czasie rzeczywistym*

Algorytmy można również podzielić biorąc pod uwagę kiedy zachodzi proces uczenia tych modeli.

*Uczenie przyrostowe*

System trenowany jest na bieżąco poprzez dostarczanie danych po jego jakby nauczeniu. Może w czasie działania douczać się.

Dla tych algorytmów możemy ustawić współczynnik uczenia który ustawia szybkość dostosowania się do nowych danych

*Uczenie wsadowe*

Model jest trenowany na pełnym zbiorze danych jednocześnie, nie istnieje możliwość douczenia się modelu “w ruchu”. Żeby wytrenować znowu model należy go zatrzymać i nauczyć na nowym zbiorze danych.

=== Uczenie głębokie

Uczenie głębokie (_Deep Learning_, DL) to poddziedzina uczenia maszynowego, która koncentruje się na wykorzystaniu wielowarstwowych sieci neuronowych do modelowania i rozwiązywania złożonych problemów. Przewagą uczenia głębokiego nad tradycyjnym uczeniem maszynowym jest jego zdolność do automatycznego wydobywania cech z surowych danych, co eliminuje potrzebę ręcznej inżynierii cech (_Feature Engineering_). Przy obecnie dostępnych dużych zbiorach danych i mocy obliczeniowej, uczenie głębokie stało się kluczowym narzędziem w dziedzinach takich jak widzenie komputerowe (_Computer Vision_, CV) czy przetwarzanie języka naturalnego (_Natural Language Processing_, NLP).

#figure(
  image("../../obrazki/ml-ai-ml-dl.webp", width: 70%),
)

Do współcześnie najpopularniejszych architektur sieci neuronowych wykorzystywanych w uczeniu głębokim należą:

- *Transformatory (_Transformers_)* - Architektura oparta na mechanizmie atencji/uwagi (_Attention Mechanism_), która zrewolucjonizowała przetwarzanie języka naturalnego. Modele takie jak BERT czy GPT są oparte na transformatorach i osiągają znakomite wyniki w zadaniach. Mechanizm atencji pozwala na wykrywanie zależności między różnymi częściami danych wejściowych, co jest kluczowe w zrozumieniu kontekstu w sekwencjach tekstowych, są też nierzadko używane w innych dziedzinach takich jak widzenie komputerowe.

- *Sieci splotowe/konwolucyjne (_Convolutional Neural Networks_, CNN)* - Specjalizują się w przetwarzaniu danych o strukturze siatki, takich jak obrazy. Wykorzystują warstwy konwolucyjne do automatycznego wykrywania cech wizualnych, co czyni je idealnymi do zadań związanych z widzeniem komputerowym, takich jak rozpoznawanie obrazów czy analiza wideo. Co do zasady działania to polegają na stosowaniu filtrów (jąder konwolucyjnych), działających na zasadzie operacji splotu takiej jak te w grafice komputerowej. Używają jąder do ekstrakcji cech z obrazów poprzez przesuwanie ich po obrazie i tworzenie map cech.

Mniej popularne, ale nadal istotne architektury to:

- *Modele dyfuzyjne (_Diffusion Models_)* - Modele generatywne, które uczą się tworzyć dane poprzez stopniowe usuwanie szumu z losowego wejścia. Są one wykorzystywane do generowania obrazów, dźwięków i innych danych, oferując alternatywę dla GANów.

- *Sieci rekurencyjne (_Recurrent Neural Networks_, RNN)* - Przeznaczone do przetwarzania sekwencyjnych danych, takich jak tekst czy dane czasowe. RNN mają zdolność do zapamiętywania informacji z poprzednich kroków w sekwencji, co pozwala im na modelowanie zależności czasowych. Jednak klasyczne RNN mają problemy z długoterminowymi zależnościami, co zostało częściowo rozwiązane przez architektury takie jak LSTM (Long Short-Term Memory) i GRU (Gated Recurrent Unit). Obecnie często są zastępowane przez transformatory.

- *Sieci generatywne przeciwstawne (_Generative Adversarial Networks_, GANs)* - Składają się z dwóch sieci neuronowych: generatora i dyskryminatora, które rywalizują ze sobą. Generator tworzy nowe dane (np. obrazy), podczas gdy dyskryminator ocenia ich autentyczność. GANs są wykorzystywane do generowania realistycznych obrazów, wideo oraz innych danych.

- *Autoenkodery (_Autoencoders_)* - Sieci neuronowe używane do uczenia się efektywnych reprezentacji danych (kodów) w sposób nienadzorowany. Składają się z dwóch części: enkodera, który kompresuje dane wejściowe do niższej wymiarowości, oraz dekodera, który rekonstruuje dane z tej skompresowanej reprezentacji. Autoenkodery są wykorzystywane do redukcji wymiarowości, usuwania szumów oraz generowania nowych danych.


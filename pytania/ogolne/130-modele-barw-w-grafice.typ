#import "../../res/question.typ": question

#show: question.with(
  q: "Modele barw w grafice komputerowej."
)

=== Modele barw

Modele barw w grafice komputerowej to sposoby matematycznego opisu koloru, który jest stosowany do ich reprezentacji, analizy, modyfikacji i wyświetlania na różnych urządzeniach.
Różne modele zą stosowane do różnych rzeczy, w zależności od potrzeb. Modele barw możemy podzielić ze względu na:

==== Przeznaczenie

Podział biorący pod uwagę przeznaczenie modelu tzn. czy służy on do teoretycznego opisu kolorów i teorii barw,
czy do faktycznego użycia modelu w celu wyświetlania barw np. na monitorze. 

- *Modele teoretyczne* - są to modele ukierunkowane w celu analizy naukowej kolorów. Modele czysto matematyczne,
  które są opracowane w celu zrozumienia jak postrzegane jest światło, kolor i percepcja barw przez ludzkie oko i mózg.
  Ich fundamentem są badania psychofizyczne oraz zasady optyki. Modele oznaczone jako "CIE" są tworem Międzynarodowej Komisji Oświetleniowej
  (fr. Commission Internationale de l’Eclairage). Umożliwiają one:
  - wyrażenie dowolnej barwy w formie numerycznej,
  - obiektywny pomiar i porównywanie barw,
  - konwersję pomiędzy modelami i kalibrację urządzeń.

  *Przykłady*: CIE XYZ, CIE LUV, CIE LAB

- *Modele techniczne* - są to modele stosowane w praktyce które zostały stworzone z myślą o konkretnych urządzeniach i ich specyfikacji.
  Ich celem jest przetwarzanie, reprezentacja i wyświetlanie barw na różnych urządzeniach. Nie mają możliwości generowania wszystkich możliwych barw.

  *Przykłady*: RGB, CMY, CMYK, HSL, HSV

==== Sposób mieszania barw

Ten podział polega na tym w jaki fizyczny sposób są ze sobą mieszane barwy. Ten sam sposób mieszania może
występować zarówno w modelach teoretycznych jak i technicznych.

- *Modele addytywne* - modele, w których uzyskanie barwy polega na zjawisku syntezy addytywnej,
  czyli mieszaniu się barw poprzez sumowanie wiązek światła widzialnego różnych długości.
  Wraz z wzrostem intensywności barw, mieszany kolor dąży do białego.

  *Przykłady*: RGB, CIE XYZ
  
  *Zastosowanie*: Wyświetlacze (monitory, smartfony, telewizory), projektory

- *Modele subtraktywne* - modele, w których uzyskanie barwy polega na zjawisku syntezy subtraktywnej,
  czyli mieszaniu się barw poprzez odejmowania wiązek światła widzialnego różnych długości.
  Wraz z wzrostem intensywności barw, mieszany kolor dąży do czarnego. 

  *Przykłady*: CMY, CMYK
  
  *Zastosowania*: Druk, malarstwo, fotografia tradycyjna

#figure(
  image("../../res/color-mixing.png", width: 80%),
  caption: [
    Addytywne miszanie barw RGB (Red, Green, Blue) i subtraktywne mieszanie CMY (Cyan, Magenta, Yellow)
  ],
)

=== Modele Teoretyczne

==== CIE XYZ

==== CIE LUV

==== CIE LAB


=== Modele Techniczne

==== RGB

==== CMY i CMYK

==== HSV i HSL

==== YUV i YIQ
TODO: Czy to jest potrzebne?

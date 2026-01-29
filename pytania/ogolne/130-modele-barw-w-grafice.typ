#import "../../res/question.typ": question

#show: question.with(
  q: "Modele barw w grafice komputerowej.",
)

=== Modele barw

Modele barw w grafice komputerowej to sposoby matematycznego opisu koloru, który jest stosowany do ich reprezentacji, analizy, modyfikacji i wyświetlania na różnych urządzeniach.
Różne modele zą stosowane do różnych rzeczy, w zależności od potrzeb. Modele barw możemy podzielić ze względu na na przeznaczenie i sposób mieszania barw.

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

- *Modele subtraktywne* - modele, w których uzyskanie barwy polega na zjawisku syntezy subtraktywnej,
  czyli mieszaniu się barw poprzez odejmowania wiązek światła widzialnego różnych długości.
  Wraz z wzrostem intensywności barw, mieszany kolor dąży do czarnego.

  *Przykłady*: CMY, CMYK

#figure(
  image("../../res/color-mixing.png", width: 80%),
  caption: [
    Addytywne miszanie barw RGB (Red, Green, Blue) i subtraktywne mieszanie CMY (Cyan, Magenta, Yellow)
  ],
)

=== Modele Teoretyczne

==== CIE XYZ

Jest to podstawowy, matematyczny model opisu barw, który jest fundamentem dla innych modeli.
CIE XYZ jest specjalną paletą barw skonstruowaną przede wszystkim pod kątem postrzegania barw przez ludzkie oko (fotoreceptory).
Za pomocą tego modelu można wygenerować wszystkie kolory postrzegane przez człowieka.
W oku znajdują się trzy rodzaje światłoczułych receptorów (czopków) które są wrażliwe na kolory czerwony, zielony i niebieski.
Pozostałe barwy otrzymuje się w wyniku ich mieszania.
Przydatnym zastosowaniem przestrzeni barw CIE XYZ jest to, że mieszanka dwóch kolorów w pewnych proporcjach leży na prostej między tymi dwoma kolorami.

#figure(
  image("../../res/cie-xyz.png", width: 40%),
  caption: [
    Model CIE XYZ
  ],
)

*Zastosowanie*: Stosowany w kalibracji urządzeń i konwersji między różnymi modelami barw w grafice komputerowej

==== CIE LUV

CIE LUV stanowi matematyczną transformację przestrzeni CIE XYZ. Ma on na celu zlinearyzowanie percepcji różnic kolorów przez oko ludzkie.

#figure(
  image("../../res/cie-luv.png", width: 35%),
  caption: [
    Model CIE LUV
  ],
)

*Zastosowanie*: Projektowanie wyświetlaczy LED i OLED gdzie trzeba się skupić na percepcji barw; czyli zastosowanie głównie dla monitorów, ekranów

==== CIE LAB

CIE LAB stanowi matematyczną transformację przestrzeni CIE XYZ. Transformację tę wprowadzono jako wynik badań nad spostrzeganiem przez oko ludzkie różnicy między barwami.
Zatem CIE LAB miała być w założeniu równomierną przestrzenią barw, natomiast jest ona jedynie w przybliżeniu równomierną percepcyjnie przestrzenią barw.

*Zastosowanie*: Popularny w druku, grafice i porównaniach kolorów gdzie systemu muszą precyzyjnie określać różnice między kolorami; analiza jakości farb, tekstyliów czy żywnośc;
czyli zastosowanie głównie dla fizycznych obiektów

=== Modele Techniczne

==== RGB

RGB to model addytywny w którym kolory uzyskuje się poprzez addytywne mieszanie ze sobą wiązek światła podstawowych kolorów (RGB). Wzrost intensywności barw prowadzi do uzyskania koloru białego.
RGB zazwyczaj określa się za pomocą RGB24, czyli zapisu trzech liczb 8-bitowych (2^24=16,777,216 kolorów).
Kolor w modelu RGB opisuje się poprzez wskazanie, jaka część każdego z kolorów: czerwonego, zielonego i niebieskiego jest zawarta. Kolor wyraża się jako
trójkę RGB (r, g, b), której każdy składnik może zmieniać się od zera do określonej wartości maksymalnej. Jeśli wszystkie składniki mają wartość
zero, wynikiem jest czerń; jeśli wszystkie mają wartość maksymalną, wynikiem jest najjaśniejsza biel, jaką można przedstawić.
Wartość RGB można przedstawić liczbami zmiennoprzecinkowymi, dziesiętnie, procentowo lub jako liczbę szesnastkową.

*Zastosowanie*: Używany w urządzeniach emitujących światło, jak monitory, telewizory i projektory; powszechny w grafice komputerowej i fotografii

==== CMY i CMYK

CMY i CMYK to modele subtraktywne, czyli farba nadrukowana pochłaniając część promieniowania świetlnego odbija jedynie fragment widma postrzegany jako kolor.
CMY rozwija się jako Cyan, Magenta, Yellow. Model CMY jest stosowany w tańszych drukarkach,
ponieważ żeby uzyskać kolor czarny należy użyć kombinacji wszystkich kolorów, przez co więcej tuszu się zużywa i czerń nie jest idealnie czarna.
W modelu CMYK jest dodatkowy kanał o nazwie Key (K), oznaczajacy kolor czarny, który jest wykorzystywany,
aby nie mieszać droższych barwników kolorowych i po prostu używać koloru czarnego do reprezentacji czerni.

*Zastosowanie*: Druk, tonery, poligrafia

==== HSV/HSB i HSL

HSV i HSB to to samo. Poszczególne składowe to:

H - Hue (z ang. odcień, barwa), o wartościach z przedziału: od 0 do 359 stopni.

S - Saturation (nasycenie koloru), z przedziału 0..1 albo 0..100%.

V/B - Value/Brightness (moc światła białego), z przedziału 0..1 albo 0..100%.

#figure(
  image("../../res/hsv-cylinder.png", width: 50%),
  caption: [
    Cylinder reprezentujący model HSV/HSB
  ],
)

W HSL poszczególne składowe można opisać jako:

H - Hue (z ang. odcień, barwa), o wartościach z przedziału: od 0 do 359 stopni.

S - Saturation (nasycenie koloru), z przedziału 0..1 albo 0..100%.

L - Lightness, (średnie światło białe), z przedziału 0..1 albo 0..100%.

#figure(
  image("../../res/hsl-cylinder.png", width: 50%),
  caption: [
    Cylinder reprezentujący model HSL
  ],
)

HSV/HSB i HSL przedstawia się za pomocą walca, gdzie V/B lub L to wysokość, S to promień, a H to kąt wokół osi pionowej.

*Zastosowanie*: Próbniki kolorów w programach graficznych, programach do edycji fotografii, najczęściej przedstawione jako suwaki trzech wartości

==== YUV i YIQ

Są to modele które powstały na potrzeby systemów telewizyjnych szczególnie w kontekście przesyłania obrazu.
Oddzielają one informację o kolorze od jasności która jest dla nas ważniejsza ponieważ nosi więcej informacji o obrazie.
Ludzkie oko jest bardziej czułe na jasność (światło) niż na kolory.

YUV składa się z:

Y - jasność,

U - składowa chrominancji dla różnic niebieskiego,

V - składowa chrominancji dla różnic czerwieni.

U i V to razem chrominancja.

Jest to model stosowany jako standard europejski PAL i był kompatybilny zarówno z telewizorami z kolorem, jak i czarnobiałymi (odbierały tylko kanał Y).
YIQ jest odobny do YUV ale stosowany jako standard amerykański NTSC.

*Zastosowanie*: Telewizja analogowa

=== Możliwe dopytania

- Dlaczego graficy nie lubią RGB? (Boiński: Boiński chciał żeby się skupić na technicznych modelach) (odp: bo ciężko uzyskać barwę na podstawie składowych RGB i łatwiej jest używać np. HSV)
- W jakim modelu można przedstawić metaliczny? (Manus) (odp: metal to nie kolor, a faktura/wykończenie)
- Czy RGB może odzwierciedlić wszystkie możliwe kolory? (Janczewski: według niego nie, bo metalicznego się nie da) (odp: to samo co wyżej o metalu + RGB nie przedstawia wszystkich możliwych kolorów, patrz sRGB - jest to podzbiór kolorów)
- Czemu istnieje zarówno CMY i CMYK? (?) (odp: pomieszanie barw CMY daje bardziej siny zamiast czarnego + czarny barwnik jest tańszy)

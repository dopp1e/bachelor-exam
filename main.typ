#import "res/format.typ": project

// #figure(
//   image("images/nazwa_obrazka.jpg", width: 80%), // <-- szerokość do potencjalnej zmiany
//   caption: [
//     Opis obrazka
//   ],
// )

#let target = sys.inputs.at("target", default: "")

#let flavor = "Wydanie " + (if target != "" { upper(target) } else { "Domyślne" })

#show: project.with(
  title: "Egzamin Inżynierski",
  supertitle: flavor,
  branch: "Informatyka PG",
  academic-year: "2025/2026",
  polish: true,
  footer-text: "",
  subject: "Egzamin Inżynierski",
  version: "v0.0.0"
)

#show heading.where(level: 4): set heading(numbering: none)

= Pytania kierunkowe

#include "pytania/ogolne/000-zlozonosc-czasowa-i-pamieciowa.typ"

#include "pytania/ogolne/010-podstawowe-struktury-danych-i-algorytmow.typ"

#include "pytania/ogolne/020-nowoczesne-platformy-programowania-obiektowego.typ"

#include "pytania/ogolne/030-podac-roznice-w-implementacji.typ"

#include "pytania/ogolne/040-klasy-jezykow-programowania-na.typ"

#include "pytania/ogolne/050-porownanie-sieci-lan-i.typ"

#include "pytania/ogolne/060-metody-dostepu-do-medium.typ"

#include "pytania/ogolne/070-infrastruktura-klucza-publicznego-architektura.typ"

#include "pytania/ogolne/080-cykle-zycia-oprogramowania-modele.typ"

#include "pytania/ogolne/090-zasady-modelowania-dla-konstrukcji.typ"

#include "pytania/ogolne/100-opis-wybranej-metodyki-wytwarzania.typ"

#include "pytania/ogolne/110-rola-i-algorytmy-mechanizmu.typ"

#include "pytania/ogolne/120-pojecie-systemu-wbudowanego-jego.typ"

#include "pytania/ogolne/130-modele-barw-w-grafice.typ"

#include "pytania/ogolne/140-zasady-budowy-interfejsow-uzytkownika.typ"

#include "pytania/ogolne/150-poziomy-testowania-w-cyklu.typ"

#include "pytania/ogolne/160-rodzaje-operacji-na-plikach.typ"

#include "pytania/ogolne/170-podzial-i-przyklady-algorytmow.typ"

#include "pytania/ogolne/180-zasady-wspolpracy-aplikacji-rozproszonych.typ"

#include "pytania/ogolne/190-przetwarzanie-sekwencyjne-wspolbiezne-i.typ"

#include "pytania/ogolne/200-czym-jest-potok-przetwarzania.typ"

#if (target == "kaims"){
  include "profil-kaims.typ"
} else if (target == "kti"){
  include "profil-kti.typ"
} else if (target == "kask"){
  include "profil-kask.typ"
} else if (target == "ksg"){
  include "profil-ksg.typ"
} else if (target == "kisi"){
  include "profil-kisi.typ"
} else if (target == "kio"){
  include "profil-kio.typ"
} else {
  include "profil-kaims.typ"
  include "profil-kti.typ"
  include "profil-kask.typ"
  include "profil-ksg.typ"
  include "profil-kisi.typ"
  include "profil-kio.typ"
}

#bibliography("res/bibliography.bib")
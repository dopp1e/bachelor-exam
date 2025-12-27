#import "res/format.typ": project

#show: project.with(
  title: "Egzamin Inżynierski",
  branch: "Informatyka PG",
  academic-year: "2025/2026",
  polish: true,
  footer-text: "",
  subject: "Egzamin Inżynierski",
  version: "0.0.0"
)

#let target = sys.inputs.at("target", default: "")

= Pytania kierunkowe

#include "pytania/main/000-zlozonosc-czasowa-i-pamieciowa.typ"

#include "pytania/main/010-podstawowe-struktury-danych-i-algorytmow.typ"

#include "pytania/main/020-nowoczesne-platformy-programowania-obiektowego.typ"

#include "pytania/main/030-podac-roznice-w-implementacji.typ"

#include "pytania/main/040-klasy-jezykow-programowania-na.typ"

#include "pytania/main/050-porownanie-sieci-lan-i.typ"

#include "pytania/main/060-metody-dostepu-do-medium.typ"

#include "pytania/main/070-infrastruktura-klucza-publicznego-architektura.typ"

#include "pytania/main/080-cykle-zycia-oprogramowania-modele.typ"

#include "pytania/main/090-zasady-modelowania-dla-konstrukcji.typ"

#include "pytania/main/100-opis-wybranej-metodyki-wytwarzania.typ"

#include "pytania/main/110-rola-i-algorytmy-mechanizmu.typ"

#include "pytania/main/120-pojecie-systemu-wbudowanego-jego.typ"

#include "pytania/main/130-modele-barw-w-grafice.typ"

#include "pytania/main/140-zasady-budowy-interfejsow-uzytkownika.typ"

#include "pytania/main/150-poziomy-testowania-w-cyklu.typ"

#include "pytania/main/160-rodzaje-operacji-na-plikach.typ"

#include "pytania/main/170-podzial-i-przyklady-algorytmow.typ"

#include "pytania/main/180-zasady-wspolpracy-aplikacji-rozproszonych.typ"

#include "pytania/main/190-przetwarzanie-sekwencyjne-wspolbiezne-i.typ"

#include "pytania/main/200-czym-jest-potok-przetwarzania.typ"

#if (target == "kaims"){
  include "profil-kaims.typ"
} else if (target == "kti"){
  include "profil-kti.typ"
} else {
  include "profil-kaims.typ"
  include "profil-kti.typ"
}

#bibliography("res/bibliography.bib")
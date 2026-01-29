#import "../../res/question.typ": question

#show: question.with(
  q: "Pojęcie systemu wbudowanego, jego cechy oraz obszary zastosowań.",
)

System wbudowany to komputer (urządzenie z CPU, pamięcią i I/O) zaprojektowany do wykonywania ściśle określonego zadania, który jest zazwyczaj częścią większego systemu.
Są zaprojektowane w celu wykonywania ściśle określonych funkcji biorąc pod uwagę ograniczone zasoby sprzętowe (np. zasilanie bateryjne, ilość pamięci RAM, moc obliczeniowa CPU), które są realizowane przy wykorzystaniu zoptymalizowanego sprzętu i dedykowanego oprogramowania.

W kontekście oprogramowania, systemy te m.in. korzystają z dedykowanych systemów operacyjnych które uwzględniają warunki w których będą właśnie pracować.
Najważniejszym aspektem w systemach wbudowanych jest ich *niezawodność* i *przewidywalność*.

Wiele systemów wbudowanych (lecz nie wszystkie) projektowanych jest z myślą o odpowiedzi w czasie rzeczywistym.
Ze względu na wymóg tych ram czasowych możemy podzielić czas rzeczywisty na:
- *Twardy czas rzeczywisty* - każde, nawet minimalne, opóźnienie jest niedopuszczalne ze względu np bezpieczeństwa,
- *Miękki czas rzeczywisty* - minimalne opóźnienia są dopuszczalne, ale kosztem jakości usługi np. wyświetlania obrazu na ekranie,
- *Brak czasu rzeczywistego* - system nie posiada wymagań czasowych.

Systemy operacyjne możemy również podzielić biorąc pod uwagę potrzebę energetyczną:
- *Zasilane baterią* - Minimalizacja zużycia energii jest kluczowa aby wydłużyć czas pracy na baterii,
- *Stałej mocy* - Ich zadaniem jest maksymalizacja wydajności przy danej mocy,
- *Systemy high-density* - Systemy wysokiej wydajności obliczeniowej i systemy wieloprocesorowe.
  Ich zadaniem jest maksymalizacja wydajności energetycznej (np. liczba operacji na jednostkę mocy zużytej).

=== Obszary zastosowań systemów wbudowanych

Systemy wbudowane są szeroko wykorzystywane w wielu obszarach.

#block(breakable: false)[
  #{
    set text(hyphenate: false, size: 9pt)
    set par(justify: false)
    table(
      columns: (auto, 1fr),
      align: (col, row) => (
        if col == 0 { center + horizon } else { left + top }
      ),
      stroke: (x, y) => (
        bottom: 0.5pt + gray.lighten(50%),
        top: if y == 0 { 1pt + black } else { 0pt },
      ),
      fill: (col, row) => (
        if row == 0 { rgb("E0E0E0") } // Darker header
        else if calc.even(row) { rgb("F5F5F5") } // Zebra striping
        else { white }
      ),

      table.header([*Obszar*], [*Przykłady zastosowań*]),

      [Urządzenia gospodarstwa domowego], [Pralki, lodówki, mikrofalówki, systemy alarmowe, termostaty inteligentne],

      [Urządzenia telekomunikacyjne], [Routery, modemy, telefony komórkowe, urządzenia IoT],

      [Przemysł], [Sterowniki PLC, roboty przemysłowe, taśmy montażowe],

      [Zastosowania wojskowe],
      [Systemy radarowe, systemy nawigacyjne, systemy naprowadzania, drony, systemy komunikacji taktycznej],

      [Systemy alarmowe \ i urządzenia monitoringu],
      [Kamery IP, czujniki dymu, czujniki ruchu, systemy kontroli dostępu, systemy alarmowe w firmach],

      [Urządzenia pomiarowe],
      [Analizatory chemiczne, systemy telemetryczne w rolnictwie (np. czujniki wilgotności gleby)],

      [Systemy finansowe], [Bankomaty, terminale płatnicze],

      [Aparatura medyczna],
      [Respiratory, monitory pacjentów, pompy infuzyjne, urządzenia do obrazowania medycznego (np. przenośne USG)],

      [Motoryzacja],
      [Systemy nawigacji GPS, systemy kontroli silnika w pojazdach, systemy infotainment w samochodach, systemy automatycznego prowadzenia pojazdów],
    )
  }
]

=== Możliwe dopytania

- Czy układ odcinający zasilanie w ładowarce laptopa to system wbudowany? Jakie są obecnie trendy w systemach wbudowanych? (Boiński)
- Czym jest Watchdog? (Manus)
- Czy systemy wbudowane w przypadku błędu powinny się "wywalić" i zresetować? (Manus)
- Czy system wbudowany musi być czasu rzeczywistego? (Szwoch)
- Dlaczego nie programujemy embedded w np. Javie? (Gierłowski)
- Jak się sprawdza błędy w systemach wbudowanych? (Manus)

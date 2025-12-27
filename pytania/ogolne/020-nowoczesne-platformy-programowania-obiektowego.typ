#import "../../res/question.typ": question

#show: question.with(
  q: "Nowoczesne platformy programowania obiektowego."
)

_Nie byłem pewien co tu można dać, więc poleciałem wokół języków, jestem otwarty na sugestie._

Główne platformy:
- JVM (Java Virtual Machine):
  - Języki - Java, Kotlin, Scala;
  - "Write once, run anywhere" dzięki kompilacji do uniwersalnie implementowanego kodu bajtowego;
  - Silne typowanie.
- .NET / CLR (Common Language Runtime):
  - Języki - C\#, F\#, VB.NET;
  - ???
- Python Runtime:
  - Język - Python;
  - Skryptowy, dynamicznie typowany, interpretowany.
- JavaScript / Node.js:
  - Języki - JavaScript, TypeScript;
  - ???

Cechy wspólne:
- Zarządzanie pamięcią - automatyczne (przez garbage collection), a nie ręczne;
- Wielowątkowość - różnie implementowana w zależności od platformy, ale cechami wspólnymi jest async / await, coroutines, virtual threads;
- Narzędzia - IDE, debugger, profiler;
- Menedżer pakietów - Maven, NuGet, pip, npm.

Warto zaznaczyć że nwoczesne platformy są multi-paradygmatowe - najmniej stosuje się do tego Java, ale pozostałe wymienione pozwalają na pewien wymiar programowania funkcyjnego, a nie stricte na OOP (nowe wersje Javy chyba w sumie też).
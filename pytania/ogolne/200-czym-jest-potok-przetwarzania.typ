#import "../../res/question.typ": question

#show: question.with(
  q: "Czym jest potok przetwarzania żądania w frameworkach internetowych?"
)

=== Potok przetwarzania żądania

Potok przetwarzania żądania to sekwencja funkcji, etapów czy zdarzeń zachodzących w ramach odebrania jakiegoś żądania od klienta.
W potokach przetwarzanie żądania najczęściej jest wykorzystywany wzorzec projektowy o nazwie _Chain of Responsibility_.
W tym wzorcu projektowym wszystkie rzeczy, które mają być zrobione z żądaniem, zamiast w jednym dużym fragmencie kodu, wydzielane są do osobnych, odpowiedzialnych wyłącznie za tą jedną rzecz komponentów lub modułów.
Kolejność uruchamiania tych handlerów jest ustalana przez dewelopera.
Zależnie od frameworka, takowy handler może nosić również nazwę filtra, interceptora czy middleware.
W ramach tego rozdziału będą one nazywane właśnie filtrami.

To potok przetwarzania żądania umożliwia nam na jego uporządkowanie i podzielenie na kroki, które są obsługiwane przez te filtry.

W sekwencji tych filtrów każdy z nich może w dowolnym momencie przerwać jego przetwarzanie. Każdy taki filtr może być odpowiedzialny za dowolną rzecz, np.:
- sprawdzenie, czy użytkownik od którego przyszło żądanie jest uwierzytelniony (znajduje się w bazie danych),
- walidację danych wejściowych (np. sprawdzenie czy parametry nie są pustym stringiem),
- obsługę sesji i ciasteczek,
- tworzenia logów w systemie (np. incoming `HttpRequest` i dane żądania);
- ochrona systemu przed #link("https://pl.wikipedia.org/wiki/Cross-site_request_forgery")[CSRF].

W Javie takie filtry działają na zasadzie, że przekazanie sterowania do kolejnego filtra (którego kolejność można ustawić w annotacji) polega na wywołaniu metody `doFilter(request, response)`.

```java
public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) {
	// do something before the rest of the application
    chain.doFilter(request, response); // invoke the rest of the application
    // do something after the rest of the application
}
```

Wtedy wykonuje się kolejny filtr i tak dalej.
Kiedy ostatni filtr zakończy pracę nad żądaniem, przekierowywany jest do odpowiedniego routera, endpointa.
Po zakończeniu pracy systemu to żądanie znowu przechodzi przez te filtry w odwrotnej kolejności dzięki czemu można wykonać również logikę po zakończeniu jego przetwarzania.

#figure(
  image("../../obrazki/filter-chain.webp", width: 60%)
)

W springu jako część potoku są również wykorzystywane interceptory - są one wykonywane bezpośrednio przed wykonaniem logiki, przed obsługą żądania kontrolera oraz po jego wykonaniu.

Główna różnica jest taka, że interceptor jest dedykowany dla konkretnych punktów w aplikacji, a filtry przerabiają globalnie każde przychodzące żądanie.

=== (Przykładowe) etapy przetwarzania żądania w frameworkach internetowych

+ *Otrzymanie żądania przez serwer:*
    - klient (np. przeglądarka) wysyła żądanie HTTP do serwera,
    - serwer odbiera żądanie i przekazuje je do frameworka webowego (np. Spring).
+ *Middleware (opcjonalne przetwarzanie):*
    - komponenty, które przetwarzają żądanie przed lub po głównym kontrolerze,
    - w springu to właśnie te filtry lub interceptory (nie używałem ich jeszcze).
+ *Routing (trasowanie):*
    - framework analizuje URL żądanie i przekierowuje go do odpowiedniego kontrolera, endpointa,
    - W springu to np. `@RequestMapping` i `@GetMapping` itp.
+ *Przetwarzanie żądania przez kontroler:*
    - kontroler to logika aplikacji odpowiedzialna za obsługę żądań (`@RestController`),
    - przetwarza je z użyciem logiki biznesowej, zrealizowanej w serwisach (`@Service`),
    - serwisy mogą korzystać z repozytoriów umożliwiających dostęp do bazy danych.
+ *Generowanie odpowiedzi:*
    - wynik działania obsługi żądania jest przekształcany na odpowiedź HTML, który może nosić różne informacje. Nawet jeżeli nie zwraca jakiejś treści to może np zwrócić status że żądanie obsłużono pomyślnie.
+ *Middleware po wykonaniu obsługi żądania:*
    - po wykonaniu żądania, przechodzi ono spowrotem przez te wszystkie filtry,
    - pozwala to nam na dodatkowe działania po przetworzeniu żądania.
+ *Wysyłanie odpowiedzi do klienta:*
    - po zakończeniu przetwarzania odpowiedź jest zwracana do serwera HTTP, a następnie przesyłana do klienta.


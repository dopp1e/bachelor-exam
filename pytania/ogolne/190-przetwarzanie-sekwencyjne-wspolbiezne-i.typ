#import "../../res/question.typ": question

#show: question.with(
  q: "Przetwarzanie sekwencyjne, współbieżne i równoległe."
)

Te rodzaje przetwarzań opisują sposób rozwiązywania pewnej liczby zadań, gdzie:
- *Sekwencyjne*: zadania przetwarzane są po kolei, od początku do końca, przez jednego "workera";
- *Współbieżne*: zadania są przetwarzane przez jednego "workera", lecz jest on w stanie przetwarzać małe części zadań "nie po kolei". Nie musi on skończyć jednego zadania przed rozpoczęciem kolejnego. Umożliwia to pewne priorytetyzowanie zadań (np. przypisanie każdemu pewnej części czasu procesora).
- *Równoległe*: zazwyczaj oznacza to większą liczbę "workerów" pracujących nad rozwiązywaniem zadań z puli. Nie wyklucza to możliwości współbieżności "workerów".

TODO(?): być może można to jakoś zgrabniej ująć
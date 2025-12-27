#import "../../res/question.typ": question

#show: question.with(
  q: "Architektury Modelu Odniesienia OSI oraz TCP/IP; podobieństwa i różnice."
)

#figure(
  image("../../images/iso-osi-tcp-ip.png", width: 40%), // <-- szerokość do potencjalnej zmiany
  caption: [
    Zestawienie modeli ISO/OSI oraz TCP/IP. @ModelISOOSIOraz
  ],
)

Oba modele pozwalają na logiczne podzielenie procesowania informacji w sieci przy użyciu systemu warstwowego. W obu systemach każda warstwa ma konkretne zastosowanie, co pozwala na łatwiejsze zidentyfikowanie potencjalnego problemu.

Największą różnicą między modelami jest połączenie warstw *fizycznej* i *łącza danych* (ISO/OSI) w warstwie *dostępu do sieci* (TCP/IP) oraz warstw *aplikacji*, *prezentacji*, i *sesji* (ISO/OSI) w wartswie *aplikacji* (TCP/IP). Model TCP/IP jest często uznawany za "praktyczniejszy", ze względu na mniej restrykcyjne opisanie warstw - na przykład w zależności od pisanej aplikacji, warstwy sesji lub prezentacji mogą być zbędne lub w pewien sposób gwarantowane przez używany framework - w tym przypadku opisywanie tych warstw w ramach różnorakich napraw może być zbędne.

Potencjalne TODO: przykład dla warstwy dostępu do sieci.

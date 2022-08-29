# UlmerBuch
UlmerBuch Beispiele

In diesem Github Repository findest Du alle Beispiele aus dem Buch. Die Beispiele werden als R-package geliefert, so dass sie moeglichst einfach installiert werden koennen. Dazu benoetigst du eine Moeglichst neue R/Rstudio installation. Ein Installationsanleitung findest Du hier [auf Englisch](https://rstudio-education.github.io/hopr/starting.html). Nach der installation musst du Rstudio starten und den folgenden Befehl in der Console eingeben:

```install.packages("UlmerBuch")```

Fuer die Installation benoetigst Du eine Internetverbindung. Nach erfolgreicher Installation einfach

```library("UlmerBuch")```

eingeben. Zum Ausprobieren ob das Package erfolgreich installiert wurde am besten einfach ein Beispiel mittels des Befehls:

bespiel(bsp="4.1") #ruft das Beispiel 4.1 auf.

Nach Ausfuerung des obigen Befehls, sollte sich ein weitere Code-Fenster oeffnen. In diesem Code-Fenster ist der kommentierte Beispiel-Code der es erlaubt die einzelnen Beispiele nach zu rechnen. Am einfachsten ist es den gesamten Code zu markieren (mittels Maus oder Strg-A) und dann via Strg-R auszufuehren. Oft ist es moeglich und lehrreich den Code nur schrittweise auszufuehren und die Zwischenschritte zu ueberpruefen, oder an den beschriebenen Stellen im Code Werte von Parametern zu veraendern und somit die Code fuer seine eignenen Fragestellungen zu verwenden. Im Folgenden beschreiben wir, das an Beispiel 4.1, welches die Anzahl der notwendigen Erfassungen fuer die Wahrscheinlichkeit einer nichtvorhandenen Art berechnet.


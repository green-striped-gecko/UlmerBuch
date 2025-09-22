# UlmerBuch Beispiele


Status: [![Checks](https://github.com/green-striped-gecko/UlmerBuch/actions/workflows/check.yml/badge.svg)](https://github.com/green-striped-gecko/UlmerBuch/actions/workflows/check.yml)



In diesem Github Repository findest Du alle Beispiele aus dem Buch. Die Beispiele werden als R-Paket geliefert, so dass sie möglichst einfach installiert werden können. Dazu benötigst Du eine möglichst aktuelle R/Rstudio Installation. Ein Installationsanleitung findest Du [hier - in Englisch](https://rstudio-education.github.io/hopr/starting.html). Nach der Installation, starte Rstudio und gib den folgenden Befehl in der Console ein:

`install.packages("devtools") #falls das devtools Paket noch nicht installiert ist`
`devtools::install_github("green-striped-gecko/UlmerBuch")`


Für die Installation benötigst Du eine Internetverbindung. Nach erfolgreicher Installation einfach

`library("UlmerBuch")`

eingeben. Für alle zukünftigen Sitzungen ist es nicht mehr erforderlich, die Installation des Pakets (via install.packages) durchzuführen. Es genügt, am Anfang einer neuen Sitzung einfach den Befehl `library("Ulmerbuch")` einzugeben. Zum Ausprobieren, ob das Paket erfolgreich installiert wurde, am besten einfach ein Beispiel mittels des Befehls:

`bespiel(bsp=4.1)`

aufrufen.

Nach Ausführung des obigen Befehls sollte sich ein weiteres Code-Fenster öffnen. In diesem Code-Fenster ist der kommentierte Beispiel-Code, der es erlaubt, die einzelnen Beispiele nachzurechnen. Zur besseren Darstellung ist es empfehlenswert, auf den "Visual"-Button zu klicken. Oft ist es möglich und lehrreich, den Code nur schrittweise auszuführen und die Zwischenschritte zu überprüfen, oder an den beschriebenen Stellen im Code Werte von Parametern zu verändern und somit den Code für eignene Fragestellungen zu verwenden [STRG-SHIFT-ENTER um einen ganzen Code block auszuführen]. Um den Einstieg zu erleichtern, haben wir ein Video erstellt, welches die Vorgehensweise anhand von Beispiel 4.1 erläutert.

Das Paket UlmerBuch enthält alle Daten und Beispiele und kennt die folgenden Funktionen:

- `beispiel(bsp=4.1, type="rmd")` - Beispiel 4.1 als rmd (type="pdf" oeffnet ein pdf des Beispiels)
- `liste.beipspiele()` - Liste aller Beispiele
- `beispiel.pfad()` - Pfad zu den Beispieldaten setzen. Falls kein Pfad angegeben wird, wird der interne Pfad genutzt, welcher die Daten enthält.
- `beispiel.daten(pfad="C:/bernd/Ulmerbuchdate", unzip=TRUE)` - Beispieldaten herunterladen, falls Kopien benoetigt werden.

Viel Spaß und Erfolg beim Ausprobieren der Beispiele. Falls Ihr einen Fehler entdeckt habt, schreibt bitte eine Email an: [xyz\@ulmerbuch.de](xyz@ulmerbuch.de) oder kontaktiert die Autoren direkt. Wir freuen uns auch über Anregungen und Verbesserungsvorschläge. 

Klaus, Annegret und Bernd

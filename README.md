# UlmerBuch Beispiele


Status: [![Checks](https://github.com/green-striped-gecko/UlmerBuch/actions/workflows/check.yml/badge.svg)](https://github.com/green-striped-gecko/UlmerBuch/actions/workflows/check.yml)



In diesem Github Repository findest Du alle Beispiele aus dem Buch. Die Beispiele werden als R-Paket geliefert, so dass sie moeglichst einfach installiert werden koennen. Dazu benoetigst Du eine moeglichst aktuelle R/Rstudio Installation. Ein Installationsanleitung findest Du [hier - in Englisch](https://rstudio-education.github.io/hopr/starting.html). Nach der Installation, starte Rstudio und gib den folgenden Befehl in der Console ein:

`install.packages("devtools") #falls das devtools Paket noch nicht installiert ist`
`devtools::install_github("green-striped-gecko/UlmerBuch")`


Fuer die Installation benoetigst Du eine Internetverbindung. Nach erfolgreicher Installation einfach

`library("UlmerBuch")`

eingeben. Fuer alle zukuenftigen Sitzungen ist es nicht mehr erforderlich die Installation des Pakets (via install.packages) durchzufuehren. Es genuegt am Anfang einer neuen Sitzung einfach den Befehl `library("Ulmerbuch")` einzugeben. Zum Ausprobieren, ob das Paket erfolgreich installiert wurde, am besten einfach ein Beispiel mittels des Befehls:

`bespiel(bsp=4.1)`

aufrufen.

Nach Ausfuerung des obigen Befehls, sollte sich ein weiteres Code-Fenster oeffnen. In diesem Code-Fenster ist der kommentierte Beispiel-Code der es erlaubt die einzelnen Beispiele nachzurechnen. Zur besseren Darstellung ist es empfehlenswert auf den "Visual" button zu klicken. Oft ist es moeglich und lehrreich, den Code nur schrittweise auszufuehren und die Zwischenschritte zu ueberpruefen, oder an den beschriebenen Stellen im Code Werte von Parametern zu veraendern und somit den Code fuer seine eignenen Fragestellungen zu verwenden [STRG-SHIFT-ENTER um einen ganzen Code block auszufuehren]. Um den Einstieg zu erleichtern, haben wir ein Video erstellt, welches die Vorgehensweise anhand von Beispiel 4.1 erlaeutert.

Das Paket UlmerBuch enthaelt alle Daten und Beispiele und kennt die folgenden Funktionen:

- `beispiel(bsp=4.1, type="rmd")` - Beispiel 4.1 als rmd (type="pdf" oeffnet ein pdf des Beispiels)
- `liste.beipspiele()` - Liste aller Beispiele
- 'beispiel.pfad()' - Pfad zu den Beispieldaten setzen. Falls kein Pfad angegeben wird, wird der interne Pfad genutzt, welcher die Daten enthält.
- `beispiel.daten(pfad="C:/bernd/Ulmerbuchdate", unzip=TRUE) - Beispieldaten herunterladen, falls Kopien benoetigt werden.

Viel Spass und Erfolg beim Ausprobieren der Beispiele. Falls Ihr einen Fehler entdeckt habt bitte eine Email an: [xyz\@ulmerbuch.de](xyz@ulmerbuch.de) schicken oder die Autoren direkt kontaktieren. Wir freuen uns auch ueber Anregungen und Verbesserungsvorschlaege. 

Klaus, Annegret und Bernd

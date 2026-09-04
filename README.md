# UlmerBuch – Beispiele zum Buch

In diesem GitHub-Repository findest du alle Beispiele aus dem Buch. Die Beispiele werden als R-Paket bereitgestellt, sodass sie möglichst einfach installiert und ausprobiert werden können.

## Installation

Du benötigst eine möglichst aktuelle Version von **R** und **RStudio**. Eine deutschsprachige Installationsanleitung findest du [hier](docs/Installation_R_RStudio_DE.pdf).

Nach der Installation öffnest du RStudio und gibst die folgenden Befehle in die **Konsole** ein:

``` r
# Nur notwendig, falls das Paket "devtools" noch nicht installiert ist:
install.packages("devtools")

# UlmerBuch installieren:
devtools::install_github("green-striped-gecko/UlmerBuch")
```

Für die Installation benötigst du eine Internetverbindung.

Nach erfolgreicher Installation kannst du das Paket mit

``` r
library("UlmerBuch")
```

laden.

Die Installation muss nur **einmal** durchgeführt werden. Bei allen zukünftigen R-Sitzungen genügt es, das Paket am Anfang mit

``` r
library("UlmerBuch")
```

zu laden.

## Ein erstes Beispiel

Um zu überprüfen, ob alles funktioniert, kannst du zum Beispiel Beispiel 4.1 öffnen:

``` r
beispiel(bsp = "4.1")
```

Danach sollte sich in RStudio ein weiteres Code-Fenster mit dem kommentierten Beispielcode öffnen. Dieser Code ermöglicht es, die im Buch beschriebenen Berechnungen selbst nachzuvollziehen.

Zur übersichtlicheren Darstellung empfehlen wir, in RStudio den **Visual**-Editor zu verwenden.

Besonders hilfreich ist es, den Code zunächst schrittweise auszuführen und die einzelnen Zwischenergebnisse zu überprüfen. An den entsprechend gekennzeichneten Stellen können auch Parameter verändert werden, um zu untersuchen, wie sich diese Änderungen auf die Ergebnisse auswirken oder um den Code für eigene Fragestellungen anzupassen.

Mit **STRG + SHIFT + ENTER** kann der aktuelle Codeblock vollständig ausgeführt werden.

Um den Einstieg zu erleichtern, haben wir außerdem ein Video erstellt, in dem die Vorgehensweise anhand von Beispiel 4.1 erläutert wird. [[Video: Beispiel 4.1 in RStudio]](https://green-striped-gecko.github.io/UlmerBuch/Beispiel4.1inRStudio.html)

## Funktionen des Pakets

Das Paket **UlmerBuch** enthält alle Beispieldaten und Beispielcodes. Die wichtigsten Funktionen sind:

-   `beispiel(bsp = "4.1", type = "rmd")`\
    Öffnet Beispiel 4.1 als R-Markdown-Datei. Mit `type = "pdf"` kann – sofern für das Beispiel vorhanden – die PDF-Version geöffnet werden.

-   `liste.beispiele(links=FALSE)`\
    Zeigt eine Tabelle aller Beispiele und der Formate, in denen sie vorliegen.

-   `liste.beispiele(links = TRUE)`\
    Zeigt eine **interaktive** Tabelle der Beispiele mit anklickbaren Links zu den vorhandenen PDF- bzw. Excel-Dateien.

-   `beispiel.pfad()`\
    Setzt das aktuelle Arbeitsverzeichnis auf den Ordner mit den im Paket enthaltenen Beispieldaten.

-   `beispiel.daten(pfad = "C:/mein/ordner", unzip = TRUE)`\
    Lädt eine Kopie aller Beispieldaten in einen frei wählbaren Ordner herunter. Dazu einfach `"C:/mein/ordner"` durch den gewünschten Pfad ersetzen.

Zum Beispiel:

``` r
beispiel.daten(
  pfad = "C:/UlmerBuchDaten",
  unzip = TRUE
)
```

## Fehler und Verbesserungsvorschläge

Viel Spaß und Erfolg beim Ausprobieren der Beispiele!

Falls ihr einen Fehler entdeckt, schreibt bitte eine E-Mail an [ulmerbuch\@yellowgecko.de](mailto:ulmerbuch@yellowgecko.de) oder kontaktiert die Autorinnen und Autoren direkt.

Wir freuen uns auch über Anregungen und Verbesserungsvorschläge.

**Klaus, Annegret und Bernd**

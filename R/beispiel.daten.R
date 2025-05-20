#' Funktion zum herunterladen der Beispieldaten
#' 
#' Die Funktion laedt die Beispieldaten aus dem Buch herunter. Die Daten werden in dem angegebenene Ordner gespeichert. Wenn das Paket installiert wurde, sind die Daten auch im Ordner 'extdata' zu finden in dem R Packet Ulmerbuch gespeichert..
#' @param pfad Pfad zu dem Ordner in dem die Daten gespeichert werden sollen. Sollte der Ordner nicht existieren, wird er erstellt. Wenn kein Pfad angegeben wird, werden die Daten in einem temporären Ordner gespeichert.
#' @param unzip Wenn TRUE, werden die Daten entpackt. Standard ist TRUE.
#' @export
#' @importFrom utils download.file unzip

beispiel.daten <- function(pfad=tempdir(), unzip=TRUE) {
		if (!dir.exists(pfad)) 
			{
			cat("Der angegebene Pfad existiert nicht. Es wird ein Ordner erstellt.\n")
			dir.create(pfad, showWarnings = FALSE, recursive = TRUE)
		}
	
	#lade die files herunter
	xx <- download.file(url = "https://github.com/green-striped-gecko/UlmerBuch/raw/refs/heads/main/inst/extdata/beispieldaten.zip", destfile = file.path(pfad, "beispieldaten.zip"))
	
	if (xx==0 & unzip) {unzip(file.path(pfad, "beispieldaten.zip"), exdir = pfad)
	cat("Die Beispieldaten wurden heruntergladen und entpackt. Sie befinden sich im Ordner:\n", pfad,"\n")}
	
if (xx==0 & !unzip) {unzip(file.path(pfad, "beispieldaten.zip"), exdir = pfad)
		cat("Die Beispieldaten wurden heruntergeladen. Sie befinden sich als zip Datei im Ordner:\n", pfad,"\n")}
	return(invisible(pfad))
	
}

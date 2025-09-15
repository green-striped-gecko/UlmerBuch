#' Funktion zum Setzen des Pfades von Beispiel Daten
#' 
#' Diese Funktion hilft beim Laden der Beispiel Daten. Wenn das Paket "Ulmerbuch" installiert wurde befinden sich alle Beispiel Daten im Ordner "extdata". Diese Funktion setzt den Pfad zu den Beispiel Daten. Manchmal ist es auch wuenschenswert seine eigenen Daten zu verwenden dann ist eine Anpassung des Pfades notwendig. Wenn die Funktion ohne Parameter aufgerufen wird, wird der Pfad zu den Beispiel Daten gesetzt in 'extdata' gesetzt. Wenn eine Pfad angegeben wird, wird der Pfad zu diesem Ordner gesetzt. Die Namen der Files muessen dann im Beipsiel Code entsprechend der persoenlichen Daten angepasst werden.
#' @param pfad entweder NULL oder ein Pfad zu einem Ordner. Wenn NULL wird der Pfad zu den Beispiel Daten des Pakets gesetzt. Wenn ein Pfad angegeben wird, wird der Pfad zu diesem Ordner gesetzt.  
#' @export
#' 
#' 
beispiel.pfad <- function(pfad=NULL) { 
	if (is.null(pfad)) {
		pfad <- system.file('extdata', package = "UlmerBuch")
		setwd(pfad)
		
	} else {
		if (!dir.exists(pfad)) stop("Der angegebene Pfad existiert nicht. Bitte auf Tippfehler ueberpruefen") else setwd(pfad) 
		
	}
	cat("Der Pfad zu den Beispiel Daten wurde gesetzt auf:\n", pfad, "\n")
	invisible(pfad)
}

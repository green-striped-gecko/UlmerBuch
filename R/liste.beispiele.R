#' Funktion zum Auflisten aller Beispiele
#' 
#' Gibt eine Lister aller vorhandener Beispiele des Ulmerbuchs aus. 
#' Einige Beispiele sind als pdf und in rmd (code der direkt ausgefuehrt werden kann) 
#' format vorhankden.
#' @export
#' @examples 
#' liste.beispiele()

liste.beispiele <- function()
{
	bsps.path <- system.file('extdata', package = "UlmerBuch")
	cat("Es sind Beispiele zu folgenden Kapiteln vorhanden:\n\n")
	dir(bsps.path, pattern = c("rmd","pdf"))
	#could add some info (e.g. heading)
}

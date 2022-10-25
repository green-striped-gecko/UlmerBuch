#' Funktion zum Auflisten aller Beispiele
#' 
#' Gibt eine Lister aller vorhandener Beispiele des Ulmerbuchs aus
#' @export
#' @examples 
#' liste.beispiele()

liste.beispiele <- function()
{
	bsps.path <- system.file('extdata', package = "UlmerBuch")
	cat("Es sind Beispiele zu folgenden Kapiteln vorhanden:\n\n")
	dir(bsps.path, pattern = "rmd")
	#could add some info (e.g. heading)
}

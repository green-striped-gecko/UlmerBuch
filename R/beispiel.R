#' Funktion zum Oeffnen von Beispiel code
#' 
#' Die Funktion oeffnet den Beispiel Code als ein Rstudio file. Das Code file kannst du beliebig veraendern und Deinen Beduerfnissen anpassen. Bitte am besten das veraenderte Beispiel unter neuen Namen und an anderer Stelle abspeichern.
#' @param bsp Beispiel Nummber aus dem Buch. Bitte in Anfuehrungezeichen angeben. Zum Beispiel wird Beispiel 4.1 mittles `bsp="4.1"` aufgerufen. 
#' @export


beispiel <- function(bsp=NULL) { 
	
	if (is.null(bsp))
	usethis::edit_file("README.md") else 
		{
		fn <- system.file('extdata',paste("bsp_", bsp,".rmd", sep=""), package = "UlmerBuch")
		if (file.exists(fn)) usethis::edit_file(fn) else 
			stop("Fuer dieses Beispiel ist kein Code Beispiel vorhanden. Bitte Ueberpruefen Sie auch ob sich Tippfehler im Beispielnamen eingeschlichen haben.")
		}
		
		}

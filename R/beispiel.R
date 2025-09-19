#' Funktion zum Oeffnen von Beispiel code
#' 
#' Die Funktion oeffnet den Beispiel Code als ein Rstudio file. Das Code file kannst du beliebig veraendern und Deinen Beduerfnissen anpassen. Bitte am besten das veraenderte Beispiel unter neuen Namen und an anderer Stelle abspeichern.
#' @param bsp Beispiel Nummber aus dem Buch. Zum Beispiel wird Beispiel 4.1 mittles `bsp=4.1` aufgerufen.  
#' @param type Typ des Beispiel Codes. Entweder "rmd" oder "pdf". Standard ist "rmd".
#' @export
#' @importFrom usethis edit_file


beispiel <- function(bsp=NULL, type="rmd") { 
	
	if (is.null(bsp))
	usethis::edit_file("README.md") else 
		{
		### check if beispiel is there
		path <- system.file('extdata', package = "UlmerBuch")
		examples <- list.files(path)
		matched_files <- grep(paste0("^bsp_",bsp,"+_"), examples, value = TRUE)
		
		#check if rmd
		if (type=="rmd")		check <-  grepl("\\.rmd$", matched_files, ignore.case = TRUE)
		if (type=="pdf") 	check <-  grepl("\\.pdf$", matched_files, ignore.case = TRUE)
		
		found <- matched_files[check]
		
		if (length(found) == 0) {
			stop("Das Beispiel ist nicht vorhanden. Bitte Ueberpruefen Sie auch, ob sich ein Tippfehler eingeschlichen hat.\n Verfuegbare Beispiele koennen mittels\nliste.beispiele()\naufgelistet werden.") }
      else {
		if (type=="rmd") {
		fn <- system.file('extdata',found, package = "UlmerBuch")
		if (file.exists(fn)) usethis::edit_file(fn) } else if (type=="pdf") {
			fn <- system.file('extdata',found, package = "UlmerBuch")
			system(paste0('open "', fn, '"'))
			
		}	else 
			stop("Fuer dieses Beispiel ist kein Code Beispiel vorhanden. Bitte Ueberpruefen Sie auch, ob sich Tippfehler im Beispielnamen eingeschlichen haben.")
		}
		}
		}

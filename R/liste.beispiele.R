#' Funktion zum Auflisten aller Beispiele
#' 
#' Gibt eine Lister aller vorhandener Beispiele des Ulmerbuchs aus. 
#' Einige Beispiele sind als pdf und in rmd (code der direkt ausgefuehrt werden kann) 
#' format vorhankden.
#' @export
#' @importFrom stringr str_extract
#' @importFrom dplyr full_join arrange '%>%'
#' 
#' @examples 
#' 
#' liste.beispiele()

liste.beispiele <- function()
{
	bsps.path <- system.file('extdata', package = "UlmerBuch")
	cat("Es sind Beispiele zu folgenden Kapiteln vorhanden:\n\n")
	all_files <- dir(bsps.path, pattern = "\\.(rmd|pdf)$")

	# List all Rmd and PDF files
	
	
	# Extract bsp, name (base), and type
	file_info <- data.frame(
		bsp = str_extract(all_files, "[0-9.]+"),
		name = str_remove(str_remove(all_files, "^bsp_[0-9.]+_"), "\\.[^.]+$"),
		type = tools::file_ext(all_files),
		stringsAsFactors = FALSE
	)
	
	# Create presence table
	presence_table <- file_info %>%
		mutate(type = toupper(type)) %>%
		distinct() %>%
		pivot_wider(names_from = type, values_from = type, values_fn = length, values_fill = 0) %>%
		mutate(
			Rmd = ifelse(!is.na(RMD) & RMD > 0, "Yes", "No"),
			PDF = ifelse(!is.na(PDF) & PDF > 0, "Yes", "No")
		) %>%
		select(bsp, name, Rmd, PDF) %>%
		arrange(as.numeric(str_extract(bsp, "[0-9.]+")))
	
	# Print table
	print(data.frame(presence_table))
	
}




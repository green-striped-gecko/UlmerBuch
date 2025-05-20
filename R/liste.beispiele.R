#' Funktion zum Auflisten aller Beispiele
#' 
#' Gibt eine Lister aller vorhandener Beispiele des Ulmerbuchs aus. 
#' Einige Beispiele sind als pdf und in rmd (code der direkt ausgefuehrt werden kann) 
#' format vorhankden.
#' @export
#' @importFrom stringr str_extract str_remove 
#' @importFrom dplyr full_join arrange '%>%' mutate distinct select 
#' @importFrom tidyr pivot_wider
#' @importFrom knitr kable
#' 
#' @examples 
#' 
#' liste.beispiele()

liste.beispiele <- function()
{
	type <- pdf <- rmd <- bsp <- name  <- RMD <- PDF <- NULL
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
			rmd = ifelse(!is.na(RMD) & RMD > 0, "Yes", "No"),
			pdf = ifelse(!is.na(PDF) & PDF > 0, "Yes", "No")
		) %>%
		select(bsp, name, rmd, pdf) %>%
		arrange(as.numeric(str_extract(bsp, "[0-9.]+")))
	
	# Print table
	print(kable(data.frame(presence_table)))
	
}




#' Funktion zum Auflisten aller Beispiele
#' 
#' Gibt eine Lister aller vorhandener Beispiele des Ulmerbuchs aus. 
#' Einige Beispiele sind als pdf und in rmd (code der direkt ausgefuehrt werden kann) 
#' format vorhankden.
#' @param links Logischer Wert, ob Links zu den pdf-Dateien mit ausgegeben werden sollen. Default ist FALSE.
#' @export
#' @importFrom stringr str_extract str_remove 
#' @importFrom dplyr full_join arrange '%>%' mutate distinct select 
#' @importFrom tidyr pivot_wider
#' @importFrom knitr kable
#' 
#' @examples 
#' 
#' liste.beispiele()

liste.beispiele <- function(links=FALSE)
{
	type <- pdf <- rmd <- bsp <- name  <- RMD <- PDF <- NULL
	bsps.path <- system.file('extdata', package = "UlmerBuch")
	cat("Es sind Beispiele zu folgenden Kapiteln vorhanden:\n\n")
	all_files <- dir(bsps.path, pattern = "^bsp_.*\\.(rmd|pdf|xlsx)$", ignore.case = TRUE)

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
			rmd = ifelse(!is.na(RMD) & RMD > 0, "Ja", "Nein"),
			pdf = ifelse(!is.na(PDF) & PDF > 0, "Ja", "Nein"),
			excel = ifelse(!is.na(XLSX) & XLSX > 0, "Ja", "Nein")
		) %>%
		select(bsp, name, rmd, pdf, excel) %>%
		arrange(numeric_version(str_extract(bsp, "[0-9]+(\\.[0-9]+)*")))
	
	
	link <- "https://raw.githubusercontent.com/green-striped-gecko/UlmerBuch/refs/heads/main/inst/extdata/"
	
	if (links) {
	  presence_table <- presence_table %>%
	    mutate(
	      link = case_when(
	        pdf == "Ja" ~ paste0("<a href='", link, "bsp_", bsp, "_", name, ".pdf'>[pdf]</a>"),
	        excel == "Ja" ~ paste0("<a href='", link, "bsp_", bsp, "_", name, ".xlsx'>[excel]</a>"),
	        TRUE ~ ""
	      )
	    )
	}
	
	# Print table
	  print(kable(data.frame(presence_table), escape = FALSE))
	
}




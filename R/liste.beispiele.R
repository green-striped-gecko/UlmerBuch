#' Liste aller Beispiele
#'
#' Gibt eine Übersicht über alle im Paket vorhandenen Beispiele aus.
#' Optional werden anklickbare Links zu PDF- und Excel-Dateien angezeigt.
#'
#' @param links Logischer Wert. Falls TRUE, wird eine interaktive Tabelle
#'   mit anklickbaren Links zu PDF- und Excel-Dateien angezeigt.
#'   Standard ist TRUE.
#'
#' @return Eine Tabelle mit den vorhandenen Beispielen und Dateiformaten.
#'
#' @export
#'
#' @examples
#' liste.beispiele()
#' liste.beispiele(links = TRUE)
#'
liste.beispiele <- function(links = TRUE)
{
	type <- pdf <- rmd <- excel <- bsp <- name <- RMD <- PDF <- XLSX <- NULL
	.sort <- link_pdf <- link_excel <- Dateien <- NULL
	
	bsps.path <- system.file("extdata", package = "UlmerBuch")
	
	cat("Es sind Beispiele zu folgenden Kapiteln vorhanden:\n\n")
	
	# Alle Beispiel-Dateien suchen
	all_files <- dir(
		bsps.path,
		pattern = "^bsp_.*\\.(rmd|pdf|xlsx)$",
		ignore.case = TRUE
	)
	
	# Informationen aus den Dateinamen extrahieren
	file_info <- data.frame(
		bsp = stringr::str_extract(all_files, "[0-9.]+"),
		name = stringr::str_remove(
			stringr::str_remove(
				all_files,
				"^bsp_[0-9.]+_"
			),
			"\\.[^.]+$"
		),
		type = tools::file_ext(all_files),
		stringsAsFactors = FALSE
	)
	
	# Tabelle erstellen, die anzeigt,
	# welche Dateiformate vorhanden sind
	presence_table <- file_info |>
		dplyr::mutate(
			type = toupper(type)
		) |>
		dplyr::distinct() |>
		tidyr::pivot_wider(
			names_from = type,
			values_from = type,
			values_fn = length,
			values_fill = 0
		)
	
	# Falls ein Dateityp überhaupt nicht vorkommt,
	# entsprechende Spalte ergänzen
	if (!"RMD" %in% names(presence_table)) {
		presence_table$RMD <- 0
	}
	
	if (!"PDF" %in% names(presence_table)) {
		presence_table$PDF <- 0
	}
	
	if (!"XLSX" %in% names(presence_table)) {
		presence_table$XLSX <- 0
	}
	
	# Ja/Nein-Spalten erzeugen
	presence_table <- presence_table |>
		dplyr::mutate(
			rmd   = ifelse(RMD > 0, "Ja", "Nein"),
			pdf   = ifelse(PDF > 0, "Ja", "Nein"),
			excel = ifelse(XLSX > 0, "Ja", "Nein")
		) |>
		dplyr::select(
			bsp,
			name,
			rmd,
			pdf,
			excel
		)
	
	# Beispiele korrekt numerisch sortieren
	# z.B. 4.1, 4.2, 4.10
	sort_version <- function(x) {
		vapply(
			x,
			function(z) {
				parts <- as.numeric(strsplit(z, "\\.")[[1]])
				
				if (length(parts) == 1) {
					parts <- c(parts, 0, 0)
				}
				
				if (length(parts) == 2) {
					parts <- c(parts, 0)
				}
				
				parts[1] * 1000000 +
					parts[2] * 1000 +
					parts[3]
			},
			numeric(1)
		)
	}
	
	presence_table <- presence_table |>
		dplyr::mutate(
			.sort = sort_version(bsp)
		) |>
		dplyr::arrange(.sort) |>
		dplyr::select(-.sort)
	
	# Basis-URL der Beispieldateien auf GitHub
	base_link <- paste0(
		"https://raw.githubusercontent.com/",
		"green-striped-gecko/UlmerBuch/",
		"refs/heads/main/inst/extdata/"
	)
	
	# ------------------------------------------------------------
	# Interaktive Tabelle mit Links
	# ------------------------------------------------------------
	
	if (links) {
		
		presence_table <- presence_table |>
			dplyr::mutate(
				
				link_pdf = ifelse(
					pdf == "Ja",
					paste0(
						"<a href='",
						base_link,
						"bsp_", bsp, "_", name, ".pdf",
						"' target='_blank'>PDF</a>"
					),
					""
				),
				
				link_excel = ifelse(
					excel == "Ja",
					paste0(
						"<a href='",
						base_link,
						"bsp_", bsp, "_", name, ".xlsx",
						"' target='_blank'>Excel</a>"
					),
					""
				),
				
				Dateien = ifelse(
					link_pdf != "" & link_excel != "",
					paste0(link_pdf, " | ", link_excel),
					paste0(link_pdf, link_excel)
				)
			) |>
			dplyr::select(
				Beispiel = bsp,
				Beschreibung = name,
				Rmd = rmd,
				PDF = pdf,
				Excel = excel,
				Dateien
			)
		
		return(
			DT::datatable(
				presence_table,
				escape = FALSE,
				rownames = FALSE,
				
				options = list(
					paging = FALSE,
					searching = TRUE,
					info = FALSE,
					autoWidth = TRUE
				),
				
				filter = "none"
			)
		)
	}
	
	# ------------------------------------------------------------
	# Normale Tabelle ohne Links
	# ------------------------------------------------------------
	
	presence_table <- presence_table |>
		dplyr::rename(
			Beispiel = bsp,
			Beschreibung = name,
			Rmd = rmd,
			PDF = pdf,
			Excel = excel
		)
	
	knitr::kable(
		presence_table,
		row.names = FALSE
	)
}

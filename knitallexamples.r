# Load the required package
library(rmarkdown)
library(UlmerBuch)
UlmerBuch::beispiel.pfad()
# Get a list of all .Rmd files in the current folder
rmd_files <- list.files(pattern = "\\.rmd$", full.names = TRUE)

# Loop through each file and knit it
for (file in rmd_files) {
	tryCatch({
		message("Rendering: ", file)
		render(file)
	}, error = function(e) {
		message("Failed to render ", file, ": ", e$message)
	})
}

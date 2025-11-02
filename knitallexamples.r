# Load the required package
library(rmarkdown)
library(UlmerBuch)
UlmerBuch::beispiel.pfad()
# Get a list of all .Rmd files in the current folder
rmd_files <- list.files(pattern = "\\.rmd$", full.names = TRUE)
res <- rep("??", length(rmd_files))
# Loop through each file and knit it
i <- 1
for (file in rmd_files) {
	tryCatch({
		message("Rendering: ", file)
		render(file)
		res[i] <- "yes"
	}, error = function(e) {
		message("Failed to render ", file, ": ", e$message)
		res[i] <<- "no"
	})
	i <- i+1
}
message("All files processed.")

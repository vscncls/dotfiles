function rmd
	Rscript -e "rmarkdown::render('"$argv"', clean=TRUE, output_format='pdf_document')"
	Rscript -e "rmarkdown::render('"$argv"', clean=TRUE)"
end

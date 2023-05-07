default: document
	Rscript -e "devtools::check()"

document: sass
	Rscript -e "devtools::document()"

sass:
	Rscript dev/sass.R

run: sass
	Rscript test.R

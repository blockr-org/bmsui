default: document
	Rscript -e "devtools::check()"

document: sass
	Rscript -e "devtools::document()"

sass: rollup
	Rscript dev/sass.R

install:
	Rscript -e "devtools::install()"

rollup:
	rollup -c

run: sass rollup
	Rscript app.R

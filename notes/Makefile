PDFLATEX_CMD=pdflatex -interaction=nonstopmode

all: es-stability.pdf cg-energy.pdf

%.latex: %.tex
	cp $< $(basename $<).latex
	sed -i 's/%%HASH%%/\\lfoot[]{$(shell sha256sum $< | sed 's/^\(.\{20\}\).*/\1/')}/' $(basename $<).latex

%.pdf: %.latex ../rsinnet.sty
	$(PDFLATEX_CMD) $<
	$(PDFLATEX_CMD) $<

.PHONY: all clean

clean:
	rm -f *.aux *.log *.latex *.pdf

PDFLATEX_CMD=pdflatex -interaction=nonstopmode

all: es-stability.pdf cg-energy.pdf high-eps-stability.pdf

# Dependencies go here so they appear in the hash
%.latex: %.tex ../rsinnet.sty
	@echo cat $^
	cp $< $(basename $<).latex
	sed -i 's/%%HASH%%/\\lfoot[]{$(shell cat $^ | sha256sum | sed 's/^\(.\{20\}\).*/\1/')}/' $(basename $<).latex

%.pdf: %.latex
	$(PDFLATEX_CMD) $<
	$(PDFLATEX_CMD) $<

.PHONY: all clean

clean:
	rm -f *.aux *.log *.latex *.pdf

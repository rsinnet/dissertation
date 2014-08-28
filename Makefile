PROJNAME=dissertation
LATEX_CMD=latex -interaction=nonstopmode

all: $(PROJNAME).pdf cg-energy es-stability

cg-energy: notes/cg-energy.pdf

es-stability: notes/es-stability.pdf

notes/%.latex: notes/%.tex
	cp $< $(basename $<).latex
	sed -i 's/%%HASH%%/\\lfoot[]{$(shell $(basename $<).latex | sed 's/^\(.\{20\}\).*/\1/')}/' $(basename $<).latex

notes/%.pdf: notes/%.latex rsinnet.sty
	pdflatex -output-directory=notes $<
	pdflatex -output-directory=notes $<

outline: outline.pdf

outline.pdf: outline.rst
	rst2pdf outline.rst

$(PROJNAME).pdf: $(PROJNAME).ps
	ps2pdf $<

$(PROJNAME).ps: $(PROJNAME).dvi
	dvips $<

$(PROJNAME).dvi: $(PROJNAME).tex abstract.tex acknowledgements.tex \
appendices.tex appendix1.tex appendix2.tex bibliography.tex dedication.tex \
lists.tex nomenclature.tex titlepage.tex tamuconfig.sty rsinnet.sty \
references.bib sections/*.tex
	$(LATEX_CMD) $(PROJNAME).tex
	bibtex $(PROJNAME).aux
	$(LATEX_CMD) $(PROJNAME).tex
	$(LATEX_CMD) $(PROJNAME).tex

.PHONY: clean all outline

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out \
	*.aux sections/*.aux outline.pdf \
	notes/cg-energy.log notes/cg-energy.aux notes/cg-energy.pdf \
	notes/es-stability.log notes/es-stability.aux notes/es-stability.pdf

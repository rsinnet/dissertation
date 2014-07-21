PROJNAME=dissertation
LATEX_CMD=latex -interaction=nonstopmode

all: $(PROJNAME).pdf outline.pdf

outline: outline.pdf

outline.pdf: outline.rst
	rst2pdf outline.rst

$(PROJNAME).pdf: $(PROJNAME).ps
	ps2pdf $(PROJNAME).ps

$(PROJNAME).ps: $(PROJNAME).dvi
	dvips $(PROJNAME)

$(PROJNAME).dvi: $(PROJNAME).tex abstract.tex acknowledgements.tex \
appendices.tex appendix1.tex appendix2.tex bibliography.tex dedication.tex \
lists.tex nomenclature.tex titlepage.tex tamuconfig.sty rsinnet.sty \
references.bib sections/*.tex
#	$(LATEX_CMD) $(PROJNAME)
#	bibtex $(PROJNAME)
	$(LATEX_CMD) $(PROJNAME)
	$(LATEX_CMD) $(PROJNAME)

.PHONY: clean all outline

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out \
	*.aux sections/*.aux outline.pdf

PROJNAME=dissertation
LATEX_CMD=latex -interaction=nonstopmode

all: $(PROJNAME).pdf

$(PROJNAME).pdf: $(PROJNAME).ps
	ps2pdf $(PROJNAME).ps

$(PROJNAME).ps: $(PROJNAME).dvi
	dvips $(PROJNAME)

$(PROJNAME).dvi: $(PROJNAME).tex abstract.tex acknowledgements.tex \
appendices.tex appendix1.tex appendix2.tex bibliography.tex dedication.tex \
lists.tex nomenclature.tex titlepage.tex tamuconfig.sty rsinnet.sty \
references.bib sections/introduction.tex sections/literature.tex \
sections/modeling.tex sections/human_inspired_control.tex sections/sysid.tex \
sections/implementation.tex sections/conclusion.tex
	$(LATEX_CMD) $(PROJNAME)
	bibtex $(PROJNAME)
	$(LATEX_CMD) $(PROJNAME)
	$(LATEX_CMD) $(PROJNAME)

.PHONY: clean

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out \
	titlepage.aux acknowledgements.aux \
	abstract.aux dedication.aux bibliography.aux lists.aux \
	nomenclature.aux sections/*.aux

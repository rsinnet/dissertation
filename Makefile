PROJNAME = dissertation

all: $(PROJNAME).pdf

$(PROJNAME).pdf: $(PROJNAME).ps
	ps2pdf $(PROJNAME).ps

$(PROJNAME).ps: $(PROJNAME).dvi
	dvips $(PROJNAME)

$(PROJNAME).dvi: $(PROJNAME).tex
	latex $(PROJNAME)
	bibtex $(PROJNAME)
	latex $(PROJNAME)
	latex $(PROJNAME)

.PHONY: clean

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg titlepage.aux acknowledgements.aux \
	abstract.aux dedication.aux bibliography.aux lists.aux \
	nomenclature.aux section1.aux section2.aux section3.aux

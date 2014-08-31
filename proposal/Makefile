PROJNAME=proposal
LATEX_CMD=latex -interaction=nonstopmode

$(PROJNAME).pdf: $(PROJNAME).ps
	ps2pdf $< $(PROJNAME).pdf

$(PROJNAME).ps: $(PROJNAME).dvi
	dvips -o $(PROJNAME).ps $<

$(PROJNAME).dvi: $(PROJNAME).aux
	$(LATEX_CMD) $(PROJNAME).tex
	$(LATEX_CMD) $(PROJNAME).tex

$(PROJNAME).aux: $(PROJNAME).tex body.tex ../rsinnet.sty ../tamuconfig.sty ../references.bib
	$(LATEX_CMD) $(PROJNAME).tex
	bibtex $(PROJNAME).aux

.PHONY: clean all proposal

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out
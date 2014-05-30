PROJNAME=prelim_def
LATEX_CMD=latex -interaction=nonstopmode

all: $(PROJNAME).pdf

$(PROJNAME).pdf: $(PROJNAME).ps
	ps2pdf $(PROJNAME).ps

$(PROJNAME).ps: $(PROJNAME).dvi
	dvips $(PROJNAME)

$(PROJNAME).dvi: $(PROJNAME).tex
	$(LATEX_CMD) $(PROJNAME)
	$(LATEX_CMD) $(PROJNAME)

.PHONY: all clean

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out $(PROJNAME).nav $(PROJNAME).snm \

PROJNAME=prelim_def
LATEX_CMD=pdflatex --shell-escape -interaction=nonstopmode

all: $(PROJNAME).pdf

$(PROJNAME).pdf: $(PROJNAME).tex figures/*.pdf figures/*.eps $(PROJNAME).sty
	$(LATEX_CMD) $(PROJNAME)
	$(LATEX_CMD) $(PROJNAME)

.PHONY: all clean

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out $(PROJNAME).nav \
	$(PROJNAME).snm figures/*-eps-converted-to.pdf

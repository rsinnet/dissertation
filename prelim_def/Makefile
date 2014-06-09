PROJNAME=prelim_def
LATEX_CMD=pdflatex --shell-escape -interaction=nonstopmode

EPS_TEX := $(wildcard figures/*.eps_tex)
EPS_LATEX := $(subst .eps_tex,.eps_latex,$(EPS_TEX))

all: $(PROJNAME).pdf

$(PROJNAME).pdf: $(PROJNAME).tex figures/*.pdf figures/*.eps $(EPS_LATEX) $(PROJNAME).sty
	$(LATEX_CMD) $(PROJNAME)
	$(LATEX_CMD) $(PROJNAME)

figures/%.eps_latex: figures/%.eps_tex figures/%.eps
	./do_latex_subs.py $(basename $(notdir $<))


clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out $(PROJNAME).nav \
	$(PROJNAME).snm figures/*-eps-converted-to.pdf figures/*.eps_latex

.PHONY: all clean

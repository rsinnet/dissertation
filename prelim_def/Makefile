PROJNAME=prelim_def
LATEX_CMD=pdflatex --shell-escape -interaction=nonstopmode

EPS_TEX := $(wildcard figures/*.eps_tex)
EPS_LATEX := $(subst .eps_tex,.eps_latex,$(EPS_TEX))

EVARS :=

all: all-files $(PROJNAME).pdf

all-files: sec-1 sec-2 sec-3 sec-4 sec-5 sec-6

sec-1:
	$(eval EVARS += "PRELIMSECA=1")

sec-2:
	$(eval EVARS += "PRELIMSECB=1")

sec-3:
	$(eval EVARS += "PRELIMSECC=1")

sec-4:
	$(eval EVARS += "PRELIMSECD=1")

sec-5:
	$(eval EVARS += "PRELIMSECE=1")

sec-6:
	$(eval EVARS += "PRELIMSECF=1")

1:	sec-1 $(PROJNAME).pdf

2:	sec-2 $(PROJNAME).pdf

3:	sec-3 $(PROJNAME).pdf

4:	sec-4 $(PROJNAME).pdf

5:	sec-5 $(PROJNAME).pdf

6:	sec-6 $(PROJNAME).pdf

$(PROJNAME).pdf: $(PROJNAME).tex sections/*.tex figures/*.pdf figures/*.eps $(EPS_LATEX) $(PROJNAME).sty
	$(subst $\",,$(EVARS)) $(LATEX_CMD) $(PROJNAME)
	$(subst $\",,$(EVARS)) $(LATEX_CMD) $(PROJNAME)
	echo $(EVARS) $(LATEX_CMD) $(PROJNAME)

figures/%.eps_latex: figures/%.eps_tex figures/%.eps do_latex_subs.py latex_subs.json
	./do_latex_subs.py $(basename $(notdir $<))

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out $(PROJNAME).nav \
	$(PROJNAME).snm figures/*-eps-converted-to.pdf figures/*.eps_latex

.PHONY: all clean all-files 1 2 3 4 5 6 sec-1 sec-2 sec-3 sec-4 sec-5 sec-6

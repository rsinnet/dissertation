PROJNAME=final_def
LATEX_CMD=pdflatex --shell-escape -interaction=nonstopmode

FIGS_DIR := ../figs

EPS_TEX := $(wildcard $(FIGS_DIR)/*.eps_tex)
EPS_LATEX := $(subst .eps_tex,.eps_latex,$(EPS_TEX))


EVARS :=

whoa: 3 $(PROJNAME).pdf

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

1:	sec-1

2:	sec-2

3:	sec-3

4:	sec-4

5:	sec-5

6:	sec-6

$(PROJNAME).pdf: $(PROJNAME).tex sections/*.tex $(FIGS_DIR)/*.eps $(EPS_LATEX) $(PROJNAME).sty
	$(subst $\",,$(EVARS)) $(LATEX_CMD) $(PROJNAME)
	$(subst $\",,$(EVARS)) $(LATEX_CMD) $(PROJNAME)
	echo $(EVARS) $(LATEX_CMD) $(PROJNAME)

../figs/%.eps_latex: $(FIGS_DIR)/%.eps_tex $(FIGS_DIR)/%.eps $(FIGS_DIR)/do_latex_subs.py $(FIGS_DIR)/latex_subs.json
	$(MAKE) -C $(FIGS_DIR)/ $(notdir $@)

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out $(PROJNAME).nav \
	$(PROJNAME).snm $(FIGS_DIR)/*-eps-converted-to.pdf $(FIGS_DIR)/*.eps_latex

.PHONY: all clean all-files 1 2 3 4 5 6 sec-1 sec-2 sec-3 sec-4 sec-5 sec-6

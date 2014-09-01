PROJNAME=proposal
LATEX_CMD=latex -interaction=nonstopmode

EPS_ALL := $(wildcard ../figs/*.eps)
EPS_TEX := $(wildcard ../figs/*.eps_tex)

EPS_LATEX := $(subst .eps_tex,.eps_latex,$(EPS_TEX))
EPS_NO_LATEX := $(filter-out $(subst .eps_tex,.eps,$(EPS_TEX)), $(EPS_ALL))

$(PROJNAME).pdf: $(PROJNAME).ps
	ps2pdf $< $(PROJNAME).pdf

$(PROJNAME).ps: $(PROJNAME).dvi
	dvips -o $(PROJNAME).ps $<

$(PROJNAME).dvi: $(PROJNAME).aux 
	$(LATEX_CMD) $(PROJNAME).tex
	$(LATEX_CMD) $(PROJNAME).tex

$(PROJNAME).bbl: $(PROJNAME).aux ../references.bib
	bibtex $(PROJNAME).aux

$(PROJNAME).aux: *.tex ../rsinnet.sty ../tamuconfig.sty $(EPS_LATEX) $(EPS_NO_LATEX)
	$(LATEX_CMD) $(PROJNAME).tex

../figs/%.eps_latex: ../figs/%.eps_tex ../figs/%.eps ../figs/do_latex_subs.py ../figs/latex_subs.json
	$(MAKE) -C ../ figs/$(notdir $@)

.PHONY: clean

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl *.aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out
	$(MAKE) -C ../figs/ clean

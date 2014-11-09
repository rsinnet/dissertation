PROJNAME=dissertation
LATEX_CMD=latex -interaction=nonstopmode

EPS_ALL := $(wildcard figs/*.eps)
EPS_TEX := $(wildcard figs/*.eps_tex)

EPS_LATEX := $(subst .eps_tex,.eps_latex,$(EPS_TEX))
EPS_NO_LATEX := $(filter-out $(subst .eps_tex,.eps,$(EPS_TEX)), $(EPS_ALL))

dissertation: $(PROJNAME).pdf

all: dissertation cg-energy es-stability proposal prelim-def final-def

proposal:
	$(MAKE) -C proposal all

prelim-def:
	$(MAKE) -C prelim_def all

final-def:
	$(MAKE) -C final_def all

cg-energy:
	$(MAKE) -C notes/ cg-energy.pdf

es-stability:
	$(MAKE) -C notes/ es-stability.pdf

$(PROJNAME).pdf: $(PROJNAME).ps
	ps2pdf $<

$(PROJNAME).ps: $(PROJNAME).dvi
	dvips $<

$(PROJNAME).dvi: $(PROJNAME).aux
	$(LATEX_CMD) $(basename $<)
	$(LATEX_CMD) $(basename $<)

$(PROJNAME).aux: $(PROJNAME).tex abstract.tex acknowledgements.tex \
appendices.tex appendix1.tex appendix2.tex bibliography.tex dedication.tex \
lists.tex nomenclature.tex titlepage.tex tamuconfig.sty rsinnet.sty \
sections/*.tex inc/*.tex myrefs.bib $(EPS_LATEX) $(EPS_NO_LATEX)
	$(LATEX_CMD) $<
	bibtex $(basename $<)

myrefs.bib: refs.bib format_bibtex_months
	./format_bibtex_months refs.bib myrefs.bib

figs/%.eps_latex: figs/%.eps_tex figs/%.eps figs/do_latex_subs.py figs/latex_subs.json
	$(MAKE) -C figs/ $(notdir $@)

.PHONY: clean all outline cg-energy es-stability proposal prelim-def final-def dissertation

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out \
	*.aux sections/*.aux outline.pdf
	$(MAKE) -C proposal/ clean
	$(MAKE) -C figs/ clean
	$(MAKE) -C notes/ clean

PROJNAME=dissertation
LATEX_CMD=latex -interaction=nonstopmode

EPS_ALL := $(wildcard ../figs/*.eps)
EPS_TEX := $(wildcard ../figs/*.eps_tex)

EPS_LATEX := $(subst .eps_tex,.eps_latex,$(EPS_TEX))
EPS_NO_LATEX := $(filter-out $(subst .eps_tex,.eps,$(EPS_TEX)), $(EPS_ALL))

all: $(PROJNAME).pdf cg-energy es-stability high-eps-stability proposal

proposal:
	$(MAKE) -C proposal

cg-energy:
	$(MAKE) -C notes/ cg-energy.pdf

high-eps-stability:
	$(MAKE) -C notes/ high-eps-stability.pdf

outline: outline.pdf

outline.pdf: outline.rst
	rst2pdf outline.rst

$(PROJNAME).pdf: $(PROJNAME).ps
	ps2pdf $<

$(PROJNAME).ps: $(PROJNAME).dvi
	dvips $<

$(PROJNAME).dvi: $(PROJNAME).aux
	$(LATEX_CMD) $(PROJNAME).tex
	$(LATEX_CMD) $(PROJNAME).tex

$(PROJNAME).aux: $(PROJNAME).tex abstract.tex acknowledgements.tex \
appendices.tex appendix1.tex appendix2.tex bibliography.tex dedication.tex \
lists.tex nomenclature.tex titlepage.tex tamuconfig.sty rsinnet.sty \
sections/*.tex references.bib $(EPS_LATEX) $(EPS_NO_LATEX)
	$(LATEX_CMD) $(PROJNAME).tex
	bibtex $(PROJNAME).aux

figs/%.eps_latex: figs/%.eps_tex figs/%.eps figs/do_latex_subs.py figs/latex_subs.json
	$(MAKE) -C figs/ $(notdir $@)

.PHONY: clean all outline cg-energy es-stability proposal

clean:
	rm -f $(PROJNAME).pdf $(PROJNAME).ps $(PROJNAME).lot $(PROJNAME).lof \
	$(PROJNAME).bbl $(PROJNAME).aux $(PROJNAME).dvi $(PROJNAME).toc \
	$(PROJNAME).log $(PROJNAME).blg $(PROJNAME).out \
	*.aux sections/*.aux outline.pdf
	$(MAKE) -C proposal/ clean
	$(MAKE) -C figs/ clean
	$(MAKE) -C notes/ clean

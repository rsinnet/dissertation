LATEX_CMD=latex -interaction=nonstopmode

EPS_TEX := $(wildcard *.eps_tex)
EPS_LATEX := $(subst .eps_tex,.eps_latex,$(EPS_TEX))

all: $(EPS_LATEX)

%.eps_latex:: %.eps_tex %.eps do_latex_subs.py latex_subs.json
	./do_latex_subs.py $(basename $(notdir $<))

.PHONY: all clean

clean:
	rm -f *.eps_latex

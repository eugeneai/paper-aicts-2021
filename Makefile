.PHONY: clean run present paper

LATEXMK=latexmk -lualatex -latexoption=-shell-escape

# TARGET=talk-mda-lod-2019-12-zh-cn
PAPER=paper-aicts-cherkashin
TARGET=talk-aicts-2021-21-06


run: paper present

paper: $(PAPER).pdf

present: $(TARGET).pdf

$(PAPER).pdf: $(PAPER).tex
	$(LATEXMK) $<

$(TARGET).pdf: $(TARGET).tex
	$(LATEXMK) $<

clean:
	BIBINPUTS=$(BIBROOT) $(LATEXMK) -C
	rm -f *.{bbl,aux,ps,dvi,log,toc,out,vrb,snm,nav} *~ ~* *.bak *.synctex.* *.thm *-joined.pdf *.wbk *_latexmk *.fls
	# cd pics && make clean

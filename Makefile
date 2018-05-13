KANJI = -kanji=utf8
FONTMAP = -f ipaex.map -f ptex-ipaex.map
TEXMF = $(shell kpsewhich -var-value=TEXMFHOME)

all: endnotesj-ja.pdf

.SUFFIXES: .tex .dvi .pdf
.tex.dvi:
	platex $(KANJI) $<
	platex $(KANJI) $<
	rm *.aux *.log
.dvi.pdf:
	dvipdfmx $(FONTMAP) $<

.PHONY: install clean
install:
	mkdir -p ${TEXMF}/doc/latex/endnotesj
	cp ./Makefile ${TEXMF}/doc/latex/endnotesj/
	cp ./LICENSE ${TEXMF}/doc/latex/endnotesj/
	cp ./README.md ${TEXMF}/doc/latex/endnotesj/
	cp ./*.pdf ${TEXMF}/doc/latex/endnotesj/
	cp ./*.tex ${TEXMF}/doc/latex/endnotesj/
	mkdir -p ${TEXMF}/tex/latex/endnotesj
	cp ./*.sty ${TEXMF}/tex/latex/endnotesj/
clean:
	rm -f *.dvi *.pdf

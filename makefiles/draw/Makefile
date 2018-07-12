.PHONY: all png

PDF_DIRS := $(patsubst %.odg, %.pdf.d,  $(wildcard *.odg))
PDFS := $(patsubst %.odg, %.pdf,  $(wildcard *.odg))

all: $(PDFS) $(PDF_DIRS)

clean:
	rm -f *.pdf
	find . -type d -name '*pdf.d' | xargs rm -rf

%.pdf: %.odg
	libreoffice --convert-to pdf $<

%.pdf.d: %.pdf
	mkdir -p $@
	cp Makefile.pdftopng $@/Makefile
	pdftk $< burst dont_ask output $(patsubst %.pdf, $@/%%d.pdf, $<)
	rm $@/doc_data.txt
	(cd $<.d; make)

%.png: *.pdf
	inkscape --export-png=$@ $<

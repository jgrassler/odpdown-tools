.PHONY: all clean test

include metadata.mk

# All image files
DIA = $(wildcard img/dia/*.dia)
DRAW = $(wildcard img/draw/*.odg)
PNG = $(wildcard img/png/*.png)
SVG = $(wildcard img/svg/*.svg)
IMG = $(DIA) $(DRAW) $(PNG) $(SVG)

FILES := \
  presentation.md \
	presentation-4-3.odp \
	presentation-4-3.pdf \
	presentation-16-9.odp \
	presentation-16-9.pdf \
	transcript.md \
	transcript.html

all: $(FILES) $(PRESENTATION) $(PRESENTATION).tar.bz2

clean:
	rm -f $(FILES)
	(cd img/; make clean)
	touch $(IMG)
	rm -rf $(PRESENTATION)
	rm -rf $(PRESENTATION).tar.bz2

img: $(IMG)
	(cd $@; $(MAKE))
	touch $@

presentation.md: src/*.md
	echo 'changequote(,)' | cat - src/main.md | m4 > $@

$(PRESENTATION): $(FILES)
	mkdir -p $(PRESENTATION)
	touch $(PRESENTATION)
	cp img/*.png $(PRESENTATION)
	cp $(FILES) $(PRESENTATION)

presentation-4-3.odp: presentation.md templates/template-4-3.odp img
	odpdown \
	-p 1 \
	--content-master $(CONTENT_MASTER) \
	--break-master $(BREAK_MASTER) \
	presentation.md templates/template-4-3.odp $@

presentation-16-9.odp: presentation.md templates/template-16-9.odp img
	odpdown \
	-p 1 \
	--content-master $(CONTENT_MASTER) \
	--break-master $(BREAK_MASTER) \
	presentation.md templates/template-16-9.odp $@

%.html: %.md
	pandoc -s --toc -f markdown_github -t html5 -o $@ $<

%.pdf: %.odp
	libreoffice --convert-to pdf --outdir $(shell dirname $<) $<

transcript.md: presentation.md
	bin/htmlcomments $< > $@

$(PRESENTATION).tar.bz2:	$(PRESENTATION)
	tar -cjf $@ $(PRESENTATION)

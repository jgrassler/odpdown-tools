.PHONY: all clean test

include metadata.mk

# All image files
DIA = $(wildcard img/dia/*.dia)
DRAW = $(wildcard img/draw/*.odg)
PNG = $(shell find img/ -maxdepth 1 -type f -name '*.png')
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
	@echo "Presentation compiled."
	@echo
	@echo "Distribution files (presentation and transcript) are in"
	@echo
	@echo "  $(PRESENTATION)/"
	@echo
	@echo "$(PRESENTATION).tar.bz2 contains the contents of the $(PRESENTATION)/ directory."

clean:
	rm -f $(FILES)
	(cd img/; make clean)
	if [ -n "$(strip $(IMG))" ]; then touch $(strip $(IMG)); fi
	rm -rf $(PRESENTATION)
	rm -rf $(PRESENTATION).tar.bz2

img: $(IMG)
	(cd $@; $(MAKE))
	touch $@

presentation.md: src/*.md
	echo 'changequote(,)' | cat - src/main.md | m4 > $@

$(PRESENTATION): $(FILES)
	rm -rf $(PRESENTATION)
	mkdir -p $(PRESENTATION)
	touch $(PRESENTATION)
	if [ -n "$$(find img -maxdepth 1 -name '*.png')" ]; then \
	  mkdir -p $(PRESENTATION)/img; \
	  cp img/*.png $(PRESENTATION)/img; \
	fi
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

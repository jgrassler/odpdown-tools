.PHONY: all

PNGS := $(patsubst %.svg, %.dia,  $(wildcard *.svg))

all: $(PNGS)
	touch .

clean:
	rm -f *.png

%.png: *.dia
	dia -e $@ -t png $<

.PHONY: all

PNGS := $(patsubst %.svg, %.pdf,  $(wildcard *.svg))

all: $(PNGS)
	touch ../

clean:
	rm -f *.png

%.png: *.pdf
	inkscape --export-png=$@ $<

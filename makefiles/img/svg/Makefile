.PHONY: all

PNGS := $(patsubst %.svg, %.png,  $(wildcard *.svg))

all: $(PNGS)

clean:
	rm -f *.png

%.png: %.svg
	inkscape --export-png=$@ $<

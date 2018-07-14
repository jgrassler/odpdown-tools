.PHONY: all

PNGS := $(patsubst %.dia, %.png,  $(wildcard *.dia))

all: $(PNGS)

clean:
	rm -f *.png

%.png: %.dia
	dia -e $@ -t png $<

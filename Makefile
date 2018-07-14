.PHONY: all install clean

include config.mk
include defaults.mk

all: odpdown-init

clean:
	rm -f odpdown-init

odpdown-init: odpdown-init.in defaults.mk config.mk
	sed -e 's#__THEMEDIR__#$(THEMEDIR)#g' \
	    -e 's#__DATADIR__#$(DATADIR)#g' $< > $@

install: odpdown-init
	install -D -m 755 odpdown-init $(BINDIR)
	install -d -m 755 $(DATADIR)
	tar -cf - makefiles | tar -C $(DATADIR) -xf -
	tar -cf - themes | tar -C $(DATADIR) -xf -

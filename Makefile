.PHONY: all install clean

include defaults.mk
include config.mk

all: config.mk odpdown-init

config.mk:
	touch config.mk

clean:
	rm -f odpdown-init

odpdown-init: odpdown-init.in defaults.mk config.mk
	sed -e 's#__THEMEDIR__#${THEMEDIR}#g' \
	    -e 's#__DATADIR__#${DATADIR}#g' $< > $@

install: all
	install -D -d -m 755 ${BINDIR}
	install -D -m 755 odpdown-init ${BINDIR}
	install -D -d -m 755 ${INSTALL_DATADIR}
	tar -cf - makefiles | tar -C ${INSTALL_DATADIR} -xf -
	tar -cf - themes | tar -C ${INSTALL_DATADIR} -xf -

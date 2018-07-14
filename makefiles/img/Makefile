.PHONY: all clean draw/ svg/ dia/ links linkclean

all: draw/ svg/ dia/ links

linkclean:
	find . -maxdepth 1 -type l | xargs rm -f

clean: linkclean
	(cd dia; $(MAKE) clean)
	(cd draw; $(MAKE) clean)
	(cd svg; $(MAKE) clean)

links: linkclean
	for png in $$(find dia draw svg -type f -name '*.png'); \
		do ln -sr $$png .; \
	done

dia/:
	(cd $@; $(MAKE))

draw/:
	(cd $@; $(MAKE))

svg/:
	(cd $@; $(MAKE))

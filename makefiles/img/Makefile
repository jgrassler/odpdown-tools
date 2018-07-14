.PHONY: all cleanlinks

all: draw/ svg/ dia/ cleanlinks

clean: cleanlinks
	rm -f *.png

cleanlinks:
	find . -maxdepth 1 -type l | xargs rm -f
	for png in $$(find dia draw svg . -type f -name '*.png'); \
		do ln -sr $$png .; \
	done

dia/:
	(cd $@; $(MAKE))

draw/:
	(cd $@; $(MAKE))

svg/:
	(cd $@; $(MAKE))

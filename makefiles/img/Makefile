.PHONY: all cleanlinks

all: draw/ svg/ dia/ cleanlinks

clean: cleanlinks
	rm -f *.png

cleanlinks:
	find . -maxdepth 1 -type l | xargs rm -f
	for png in $$(find . -type f -name '*.png'); \
		do ln -sr $$png .; \
	done

dia/:
	(cd $@; $(MAKE))

draw/:
	(cd $@; $(MAKE))

svg/:
	(cd $@; $(MAKE))

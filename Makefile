DIRECTORIES = $(sort $(dir $(wildcard */)))
PDFS = $(patsubst %,%pdf/document.pdf,$(DIRECTORIES))
PDFS2 = $(foreach name,$(DIRECTORIES),$(name)/pdf/$(name).pdf)

all: $(PDFS)

%pdf/document.pdf: .EMPTY
	cd $(shell dirname $@)/../tex; latexmk -pdf document.tex -outdir=../pdf

clean_interm:
	-rm */pdf/*.aux
	-rm */pdf/*.fls
	-rm */pdf/*.log
	-rm */pdf/*.toc
	-rm */pdf/*.fls
	-rm */pdf/*.fdb_latexmk

clean: clean_interm
	-rm */pdf/*.pdf


echoer:
	echo -n $(DIRECTORIES)
	echo -n $(PDFS)

.EMPTY:

DIRECTORIES = $(sort $(dir $(wildcard */)))
PDFS = $(patsubst %,%pdf/document.pdf,$(DIRECTORIES))

all: $(PDFS) clean_interm

%pdf/document.pdf: %
	cd $<tex; latexmk -pdf document.tex -outdir=../pdf

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

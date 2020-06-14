LATEX=latexmk --halt-on-error --file-line-error -bibtex -pdf -e '$$max_repeat=8'

all: .Makefile.uptodate
	$(MAKE) spec

.Makefile.uptodate: Makefile
	$(MAKE) clean
	touch .Makefile.uptodate

spec.pdf: spec.tex spec.bib
	$(MAKE) spec

.PHONY: spec
spec:
	$(LATEX) spec

.PHONY: clean
clean:
	rm -f spec.pdf spec.aux spec.log spec.bbl spec.blg spec.brf spec.out spec.toc spec.synctex.gz spec.fdb_latexmk spec.fls spec.bcf spec.run.xml spec.dvi


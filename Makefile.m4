m4_include(inst.m4)m4_dnl

.SUFFIXES: .pdf .w .tex .html .aux .log .php

figfiles=$(shell ls *.fig)
figbases=$(basename $(figfiles))

pdft_names=$(foreach fil,$(figbases), $(fil).pdftex_t)
pdf_fig_names=$(foreach fil,$(figbases), $(fil).pdftex)

%.pdftex: %.fig
	fig2dev -L pdftex $< > $@

.PRECIOUS : %.pdftex
%.pdftex_t: %.fig %.pdftex
	fig2dev -L pdftex_t -p $*.pdftex $< > $@

%.pdf : %.w $(W2PDF) $(pdf_fig_names) $(pdft_names)
	chmod 775 $(W2PDF)
	$(W2PDF) $*




<!m4_!>m4_docname.w : a_<!!>m4_docname.w
	gawk '{if(match($$0, "@%")) {printf("%s", substr($$0,1,RSTART-1))} else print}' $< \
          | gawk '{gsub(/[\\][\$$]/, "$$");print}'  > $@

m4_docname.w : <!m4_!>m4_docname.w 
	m4 -P $< > $@


sources : <!m4_!>m4_docname.w
	nuweb m4_docname.w

pdf : m4_docname.w  $(pdf_fig_names) $(pdft_names)
	./w2pdf $<

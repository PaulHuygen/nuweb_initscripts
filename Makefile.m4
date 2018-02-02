m4_include(inst.m4)m4_dnl

.SUFFIXES: .pdf .w .tex .html .aux .log .php
.PHONY : html

figfiles=$(shell ls *.fig)
figbases=$(basename $(figfiles))

#
# PDF figures
#

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

#
# HTML
#
hfigfiles=$(foreach fil, $(figfiles), html/$(fil))

pst_names=$(foreach fil, $(figbases), html/$(fil).pstex_t)
psfig_names=$(foreach fil, $(figbases), html/$(fil).pstex)



html/%.pstex : %.fig
	fig2dev -L pstex $< > $@

html/%.pstex_t : %.fig html/%.pstex
	fig2dev -L pstex_t -p html/$*.pstex $*.fig > $@

html/m4_docname.w : m4_docname.w
	cd html && ln -fs ../m4_docname.w .


# cd html && ln -s ../$< .



<!m4_!>m4_docname.w : a_<!!>m4_docname.w
	gawk '{if(match($$0, "@%")) {printf("%s", substr($$0,1,RSTART-1))} else print}' $< \
          | gawk '{gsub(/[\\][\$$]/, "$$");print}'  > $@

m4_docname.w : <!m4_!>m4_docname.w 
	m4 -P $< > $@


sources : <!m4_!>m4_docname.w
	nuweb m4_docname.w

pdf : m4_docname.w  $(pdf_fig_names) $(pdft_names)
	./w2pdf $<

# html : $(hfigfiles)

html : $(psfig_names) $(pst_names) html/m4_docname.w
	mkdir -p html
	cd html && export TEXINPUTS=../: && ../w2html m4_docname



texes=docker-zomato/docker_zomato.pdf

all: $(texes)

$(texes): %.pdf: %.tex
	# echo $@ $<  # sop/sop sop/sop.tex
	@echo '----- pdflatex 1 -----'
	pdflatex $<
	#@echo '----- bibtex -----'
	#bibtex $@.aux
	@echo '----- pdflatex 2 -----'
	pdflatex $<
	@echo '----- pdflatex 3 -----'
	pdflatex $<

pdf:
	@echo '----- pdflatex 1 -----'
	pdflatex $(texes)
	#@echo '----- bibtex -----'
	#bibtex $(texes).aux
	@echo '----- pdflatex 2 -----'
	pdflatex $(texes)
	@echo '----- pdflatex 3 -----'
	pdflatex $(texes)

ps: dvi
	dvips $(title).dvi
	#dvips -t letter -Ppdf -G0 $(title).dvi -o

dvi: $(title).tex $(title).bib
	latex $(title).tex
	latex $(title).tex
	latex $(title).tex
	bibtex $(title)
	latex $(title).tex
	latex $(title).tex

test:
	#chktex -v2 $(texes)
	#chktex -q -n 6 $(texes)
	chktex -q -n 6 */*.tex

clean_logs:
	rm -f *.aux *.log *.toc *.bbl *.blg
	rm -f *~

clean_output:
	rm -f *.dvi *.out
	rm -f $(target)

clean: clean_logs clean_output

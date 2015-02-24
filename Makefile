all:

clean:
	rm -f *.aux *.html *.log *.out *.pdf *.tex

.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY:

# Render PDF from Markdown using pdflatex
%.pdf: %.tex
	pdflatex $<

# Render PDF from Markdown using pandoc
%.pdf: %.md
	pandoc -o $@ $<

# Generate LaTeX from Markdown using pandoc
%.tex: %.md
	pandoc -so $@ $<

# Render HTML from Markdown using pandoc
%.html: %.md
	pandoc -so $@ $<

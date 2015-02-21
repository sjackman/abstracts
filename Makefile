all:

.PHONY: all
.DELETE_ON_ERROR:
.SECONDARY:

# Render Markdown to HTML
%.html: %.md
	pandoc --template=template -o $@ $^

# Render Markdown to LaTeX
%.tex: %.md
	pandoc --template=template -o $@ $<

# Render LaTeX to PDF
%.pdf: %.tex
	pdflatex -halt-on-error $<

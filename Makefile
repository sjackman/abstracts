all:

.PHONY: all
.DELETE_ON_ERROR:
.SECONDARY:

%.html: %.md
	pandoc -so $@ $<

%.pdf: %.md
	pandoc -o $@ $<

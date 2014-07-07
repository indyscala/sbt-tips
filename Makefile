markdown = $(wildcard *.md)
html = $(markdown:.md=.html)

slides: $(html)

extract_template:
	pandoc --print-default-template dzslides > dzslides.template

%.html: %.md dzslides.template
	pandoc \
        --smart --standalone \
        --to dzslides \
        --template dzslides.template \
        $< \
        --output $@

.PHONY: slides

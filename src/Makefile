# sauce of original Makefile magic:
#   http://passingcuriosity.com/2008/literate-haskell-with-markdown-syntax-hightlighting/
# modified by kgadek

# Ok, so I found Markdown+Bird style to be nice BUT editors have problems with Haskell code (indenting & stuff) when
# each line starts with ">".
# On the other hand LaTeX style is ok but LaTeX is often too powerful - distracts me all the time from actual code.

# But don't worry, I'm (nearly) an Engineer. Solution:
# Write Markdown style, enclose code with \begin{code}..\end{code} block and use small sed script to convert it to Markdown+Bird.
# What is cool, GHC does not complain at all!

.SUFFIXES: .lhs .mkd .html .tex .pdf
.PHONY: all clean

PANDOC := pandoc --no-wrap -sS
HSCOLOUR := hscolour -lit
SED_CONVERT := sed '/\\begin{code}/,/\\end{code}/s/^/> /g'
# grep filter could be amended (more general regex) but works well for me
GREP_FILTER := grep -ve '\\\(begin\|end\){code}'


all: Problem_001.html Problem_002.html Problem_003.html Problem_004.html Problem_005.html Problem_006.html Problem_007.html Problem_008.html
clean:
	rm -f *.html

# get mathjax (http://www.mathjax.org/) and hscolour.css (http://www.cs.york.ac.uk/fp/darcs/hscolour/)
.lhs.html:
	cat $< | $(SED_CONVERT) | $(GREP_FILTER) | \
	$(HSCOLOUR) -css | $(PANDOC) -t html -c hscolour.css --mathjax='mathjax/MathJax.js?config=TeX-AMS-MML_HTMLorMML' > $@


# TODO: all below
.lhs.mkd:
	cat $< | $(HSCOLOUR) -css > $@

.lhs.tex:
	cat $< | $(HSCOLOUR) -latex -lit-tex -partial | $(PANDOC) -t latex> $@

.tex.pdf:
	pdflatex $< && pdflatex $< && pdflatex $<

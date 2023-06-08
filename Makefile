PAPER=main.tex
SHELL=/bin/zsh

all:
	cd build && lualatex -shell-escape ../main.tex main.pdf

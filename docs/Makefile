main:
	mkdir -p target/adds/
	cd src/ && \
	pdflatex -halt-on-error main.tex && \
	# bibtex main.aux && \
	# pdflatex -halt-on-error main.tex && \
	# pdflatex -halt-on-error main.tex && \
	mv main.pdf ../target/ && \
	mv main.tex @main.tex && \
	mv main.* ../target/adds/ && \
	mv @main.tex main.tex

clean:
	rm -r target/

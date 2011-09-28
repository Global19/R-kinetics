##
## Makefile for the running and building of the analysis.
##
analysis-build:
	cd Src && R CMD Sweave analysis.Rnw && pdflatex analysis.tex && cp analysis.pdf ../
	cd Src && R CMD Stange analysis.Rnw
analysis-clean:
	cd Src && rm -rf analysis.tex analysis.aux analysis.log Rplots.pdf analysis.R *~

synthetic-build:
	cd Data/Synthetic && make all	
lambda-build:
	cd Data/Lambda && make all	

synthetic-clean:
	cd Data/Synthetic && make clean
lambda-clean:
	cd Data/Lambda && make clean	

smrtpipe-build: synthetic-build lambda-build
smrtpipe-clean: synthetic-clean lambda-clean


#
#
#
TAR = $(HOME)/xmp-doc.tgz

main.pdf : main.dvi
	dvipdfmx main.dvi

main.dvi : clean
	platex main
	makeindex main
	platex main
	platex main
	platex main

clean:
	rm -f *.aux *.log *.idx *.ind *.ilg *.lot *.lof *.toc *.dvi *.ps *~ figs/*.bb

backup :
	make clean
	tar --create --file $(TAR) --directory .. DOC --compress
	tar --list --compress --file $(TAR)
	scp -i ~/.ssh/tsukuba $(TAR) hori@t2k-0007.ccs.tsukuba.ac.jp:/home/ESCIENCE/hori/xmp-doc.tar

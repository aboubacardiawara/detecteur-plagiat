all: 
	make compile

SOURCE=src/main.ml

compile: $(SOURCE)
	ocamlopt -o main $(SOURCE)





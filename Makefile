all:
	make dynamic
	make suffixe_tree
	make lecture_fichier
	make clean

SOURCE_PATH=src/
TEST_PATH=$(SOURCE_PATH)/test
MAIN_PATH=$(SOURCE_PATH)/main

TESTS=$(TEST_PATH)/test.ml
MAIN=$(MAIN_PATH)/
ASSERTER=$(TEST_PATH)/myAsserter.ml

dynamic: $(MAIN)/dynamic.ml
	@ocamlopt -o dynamic $(MAIN)/dynamic.ml

suffixe_tree: $(MAIN)/suffixe_tree.ml
	@ocamlopt -o suffixe_tree $(MAIN)/suffixe_tree.ml

lecture_fichier: $(MAIN)/lecture_fichier.ml
	@ocamlc unix.cma -o lecture_fichier $(MAIN)/lecture_fichier.ml
	@ocamlopt  unix.cmxa -o lecture_fichier.nat $(MAIN)/lecture_fichier.ml
	@rm -f $(MAIN)/*.cm* $(MAIN)/*.o *.nat

ecriture_fichier: $(MAIN)/ecriture_fichier.ml
	@ocamlopt -o ecriture_fichier $(MAIN)/ecriture_fichier.ml

test: $(TESTS)
	ocamlc $(TESTS)


asserter: $(ASSERTER)
	ocamlopt -o myAsserter $(ASSERTER)

clean:
	@rm -f $(MAIN)/*.cm* $(MAIN)/*.o

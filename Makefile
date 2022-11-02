all:
	make dynamic
	make suffixe_tree

SOURCE_PATH=src/
TEST_PATH=$(SOURCE_PATH)/test
MAIN_PATH=$(SOURCE_PATH)/main

TESTS=$(TEST_PATH)/test.ml
MAIN=$(MAIN_PATH)/
ASSERTER=$(TEST_PATH)/myAsserter.ml

dynamic: $(MAIN)/dynamic.ml
	@ocamlc $(MAIN)/dynamic.ml
	@rm -f $(MAIN)/*.cm*
	@mv a.out dynamic

suffixe_tree: $(MAIN)/suffixe_tree.ml
	@ocamlc $(MAIN)/suffixe_tree.ml
	@rm -f $(MAIN)/*.cm*
	@mv a.out suffixe_tree
test: $(TESTS)
	ocamlc $(TESTS)


asserter: $(ASSERTER)
	ocamlopt -o myAsserter $(ASSERTER)


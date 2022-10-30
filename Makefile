all:
	make main

SOURCE_PATH=src/
TEST_PATH=$(SOURCE_PATH)/test
MAIN_PATH=$(SOURCE_PATH)/main

TESTS=$(TEST_PATH)/test.ml
MAIN=$(MAIN_PATH)/*
ASSERTER=$(TEST_PATH)/myAsserter.ml

main: $(MAIN)
	@echo "< Compilation en cours"
	@ocamlc $(MAIN)
	@rm -f $(MAIN).cm*
	@echo "Compilation finished >"

test: $(TESTS)
	ocamlc $(TESTS)


asserter: $(ASSERTER)
	ocamlopt -o myAsserter $(ASSERTER)


all: 
	make test
	make main

SOURCE_PATH=src/
TEST_PATH=$(SOURCE_PATH)/test
MAIN_PATH=$(SOURCE_PATH)/main

TESTS=$(TEST_PATH)/test.ml
MAIN=$(MAIN_PATH)/*
ASSERTER=$(TEST_PATH)/myAsserter.ml

main: $(MAIN)
	ocamlc $(MAIN)

test: $(TESTS)
	ocamlc $(TESTS)


asserter: $(ASSERTER)
	ocamlopt -o myAsserter $(ASSERTER)


.PHONY: generate lint format breaking clean check build-python

BUF ?= buf

generate:
	$(BUF) generate

lint:
	$(BUF) lint

format:
	$(BUF) format -w

breaking:
	$(BUF) breaking --against '.git#branch=main'

clean:
	rm -rf gen/go gen/ts gen/python build dist

build-python:
	python -m build --wheel --no-isolation

check: lint breaking

.PHONY: generate lint format breaking clean check

BUF ?= buf

# Generate Go, TypeScript and Python code
generate:
	$(BUF) generate

# Validate protobuf definitions
lint:
	$(BUF) lint

# Format protobuf files
format:
	$(BUF) format -w

# Check backward compatibility against main
breaking:
	$(BUF) breaking --against '.git#branch=main'

# Remove generated files
clean:
	rm -rf gen/go gen/ts gen/python

# Run all validations
check: lint breaking

# Defining variables
OAPI_CODEGEN_VERSION := v1.10.0
OAPI_CODEGEN_BIN := bin/oapi-codegen
OAPI_CODEGEN := $(shell pwd)/$(OAPI_CODEGEN_BIN)
OPENAPI_SPEC_URL := https://raw.githubusercontent.com/cloud-hypervisor/cloud-hypervisor/v38.0/vmm/src/api/openapi/cloud-hypervisor.yaml
CLIENT_OUTPUT_FILE := client/client_gen.go

# Default target
all: generate

# Setup local bin/ directory and .gitignore
$(OAPI_CODEGEN_BIN):
	@mkdir -p bin
	echo "bin/" >> .gitignore
	GOBIN=$(shell pwd)/bin go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@$(OAPI_CODEGEN_VERSION)

# Generate the client from the OpenAPI spec
generate: $(OAPI_CODEGEN_BIN)
	curl -o openapi.yaml $(OPENAPI_SPEC_URL)
	$(OAPI_CODEGEN) --package=client -generate types,client -o $(CLIENT_OUTPUT_FILE) openapi.yaml

# Clean up generated files and local binaries
clean:
	rm -f $(CLIENT_OUTPUT_FILE) openapi.yaml
	rm -rf bin

.PHONY: all generate clean

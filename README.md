# cloud-hypervisor-go

[![Go Report Card](https://goreportcard.com/badge/github.com/afritzler/cloud-hypervisor-go)](https://goreportcard.com/report/github.com/afritzler/cloud-hypervisor-go)
[![Go Reference](https://pkg.go.dev/badge/github.com/afritzler/cloud-hypervisor-go.svg)](https://pkg.go.dev/github.com/afritzler/cloud-hypervisor-go)
[![GitHub License](https://img.shields.io/static/v1?label=License&message=Apache-2.0&color=blue)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://makeapullrequest.com)

This project provides a Go client for interacting with the Cloud Hypervisor API. It includes a simple example of 
creating a virtual machine (VM) with specified CPU and memory configurations.

## Prerequisites

Before you begin, ensure you have the following installed:
- Go 1.22 or higher

## Usage

To use the cloud-hypervisor-go client import the dependency into your project

```bash
go get github.com/afritzler/cloud-hypervisor-go
```

Here is a code sample to create a VM

```go
// Initialize the API client
c, err := client.NewClient("http://localhost:8080")
if err != nil {
    log.Fatalf("Failed to create client: %v", err)
}

// Create a VM with specific CPU and memory configuration
res, err := c.CreateVM(context.TODO(), client.CreateVMJSONRequestBody{
    Cpus: &client.CpusConfig{
        MaxVcpus: 1, // Configure the VM with 1 CPU
    },
    Memory: &client.MemoryConfig{
        Size: 1024 * 1024 * 1024, // Configure the VM with 1 GB of RAM
    },
})
if err != nil {
    log.Fatalf("Failed to create VM: %v", err)
}
```

## Generate client

Clone this repository to your local machine to get started:

```bash
git clone https://github.com/afritzler/cloud-hypervisor-go.git
cd cloud-hypervisor-go
```

Run the generation via

```bash
make generate
```

## Contributing

I'd love to get feedback from you. Please report bugs, suggestions or post questions by opening a GitHub issue.

## License

[Apache-2.0](LICENSE)

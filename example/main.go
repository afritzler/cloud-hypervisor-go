package main

import (
	"context"
	"fmt"
	"log"

	"github.com/afritzler/cloud-hypervisor-go/client"
)

func main() {
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

	// Print the response from the create VM operation
	fmt.Printf("Create VM response: %+v\n", res)
}

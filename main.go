package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("Hello, World!")

	ticker := time.NewTicker(3 * time.Second)
	defer ticker.Stop()

	count := 0
	for range ticker.C {
		count++
		fmt.Printf("tick #%d\n", count)

	}

	fmt.Println("loop ended")

}

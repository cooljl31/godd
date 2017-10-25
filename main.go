package main

import (
	"io"
	"net/http"
)

func main() {
	http.HandleFunc("/", hello)
	http.ListenAndServe(":3000", nil)
}

// The Handler function
func hello(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "Hello from go Docker")
}

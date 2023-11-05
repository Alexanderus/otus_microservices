package main

import (
	"encoding/json"
	"io"
	"net/http"
)

func health(w http.ResponseWriter, r *http.Request) {
	m := make(map[string]string)
	m["status"] = "ok"
	responseBytes, _ := json.Marshal(m)
	io.WriteString(w, string(responseBytes)+"\n")
}

func main() {

	mux := http.NewServeMux()
	mux.HandleFunc("/health", health)
	http.ListenAndServe(":8000", mux)

}

// Fileserver is a minimal binary to serve contents from the file system over HTTP.

package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	filesDir := os.Getenv("FILES_DIR")
	if filesDir == "" {
		filesDir = "/var/www"
	}
	fs := http.FileServer(http.Dir(filesDir))
	http.Handle("/", fs)

	addr := os.Getenv("SERVER_PORT")
	if addr == "" {
		addr = ":8080"
	}
	log.Printf("Fileserver serving %s on %s..\n", filesDir, addr)
	panic(http.ListenAndServe(addr, nil))
}

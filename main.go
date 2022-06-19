package main

import (
	"cinema-server/api"
	"cinema-server/connections"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	fmt.Println("cinema service is running")

	router := mux.NewRouter()

	router.Handle("/{cinemaID}/{showID}", http.HandlerFunc(api.FetchSeats)).Methods(http.MethodGet)
	// router.Handle("/book", http.HandlerFunc(api.Book))

	log.Fatal(http.ListenAndServe(":8081", router))

	connections.Close()
}

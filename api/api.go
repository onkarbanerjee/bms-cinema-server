package api

import (
	"encoding/json"
	"fmt"
	"net/http"

	"cinema-server/connections"
	"cinema-server/models"

	"github.com/gorilla/mux"
)

func FetchSeats(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	query := `SELECT 
		cinemas.name AS cinema, 
		screens.screenNumber AS screenNumber, 
		movies.name AS movie,
		seats.row,
		seats.column,
		seats.price
		FROM cinemas, screens, shows, movies, seats where (
			cinemas.id = ? AND 
			cinemas.id = screens.cinemaID AND 
			screens.id = shows.screenID AND 
			shows.id = ? AND
			shows.movieID= movies.id AND
			seats.screenID = screens.id AND
			seats.status = "available"
			);`

	rows, err := connections.GetMySQLDB().Query(query, params["cinemaID"], params["showID"])
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("COuld not fetch data from db, got" + err.Error()))
		return
	}

	fetchResponse := &models.FetchResponse{}

	for rows.Next() {
		var availableSeat models.Seat
		// for each row, scan the result into our tag composite object
		err = rows.Scan(
			&(fetchResponse.Cinema),
			&(fetchResponse.ScreenNumber),
			&(fetchResponse.Movie),
			&availableSeat.Row,
			&availableSeat.Column,
			&availableSeat.Price)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			w.Write([]byte("COuld not fetch data from db, got " + err.Error()))
			return
		}

		fetchResponse.AvailableSeats = append(fetchResponse.AvailableSeats, availableSeat)

	}

	fmt.Printf("fetchResponse: %v\n", fetchResponse)
	json.NewEncoder(w).Encode(fetchResponse)
}

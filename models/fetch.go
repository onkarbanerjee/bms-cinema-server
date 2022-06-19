package models

type FetchResponse struct {
	Cinema         string `json:"cinema,omitempty"`
	ScreenNumber   int    `json:"screenNumber,omitempty"`
	Movie          string `json:"movie,omitempty"`
	AvailableSeats []Seat
}

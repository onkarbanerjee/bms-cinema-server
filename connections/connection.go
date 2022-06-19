package connections

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

const (
	host     = "localhost"
	port     = 3306
	user     = "admin"
	password = "admin"
	dbname   = "bmsdb"
)

var connString = fmt.Sprintf("%s:%s@tcp(%s:%d)/%s",
	user, password, host, port, dbname)

var (
	db  *sql.DB
	err error
)

func init() {
	db, err = sql.Open("mysql", connString)
	if err != nil {
		panic(err)
	}
	// defer db.Close()

	err = db.Ping()
	if err != nil {
		panic(err)
	}
}

func GetMySQLDB() *sql.DB {
	return db
}

func Close() {
	db.Close()
}

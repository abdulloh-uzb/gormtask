package main

import (
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type Product struct {
	gorm.Model
	Name     string
	Category string
	Type     string
	Version  string
	Price    float64
	Stores   []Store `gorm:"many2many:product_store;"`
}

type Store struct {
	ID      int
	Name    string
	Address []Address `gorm:"many2many:store_addresses;"`
}

type Address struct {
	ID       int
	District string
	Street   string
}

func main() {
	dsn := "host=localhost user=postgres password=1234 dbname=test_db sslmode=disable"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		panic(err)
	}

	db.AutoMigrate(&Address{}, &Store{}, &Product{})
	p1 := Product{
		Name:     "PUBG",
		Version:  "2.1",
		Category: "game",
		Type:     "shooter",
		Price:    0,
		Stores: []Store{
			{
				Name: "Play Market",
				Address: []Address{
					{
						District: "Android",
						Street:   "",
					},
				},
			},
			{
				Name: "App Store",
				Address: []Address{
					{
						District: "IOS",
						Street:   "",
					},
				},
			},
		},
	}

	db.Transaction(func(tx *gorm.DB) error {
		if err := tx.Create(&p1).Error; err != nil {
			tx.Rollback()
			return err
		}

		return nil
	})

}

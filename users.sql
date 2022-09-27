create table car(
		id BIGSERIAL NOT NULL PRIMARY KEY,
		make VARCHAR(100) NOT NULL,
		model VARCHAR(100) NOT NULL,
		price NUMERIC(19, 2) NOT NULL

	); 
	create table users (
		id BIGSERIAL NOT NULL PRIMARY KEY,
		username VARCHAR(50) NOT NULL,
		fullname VARCHAR(50) NOT NULL,
		email VARCHAR(50),
		country VARCHAR(50) NOT NULL,
		car_id BIGINT REFERENCES car(id),
		UNIQUE(car_id)
	);

		select products.name, stores.name from products 
		inner join store_products on products.id = store_products.product_id 
		inner join stores on store_products.product_id = stores.id;

	insert into car(make, model, price) values('chevrolet','gentra','20000');
	insert into car(make, model, price) values('lada','xray','10000');
	insert into car(make, model, price) values('chevrolet','malibu','30000');
	insert into users ( username, fullname, email, country) values ('scastleton0', 'Seward Castleton', 'scastleton0@usa.gov', 'Afghanistan');
	insert into users ( username, fullname, email, country) values ('sjanaud1', 'Selene Janaud', 'sjanaud1@pcworld.com', 'Philippines');
	insert into users ( username, fullname, email, country) values ('cload2', 'Coralie Load', 'cload2@storify.com', 'Morocco');
	insert into users ( username, fullname, email, country) values ('rlemerie3', 'Rosetta Lemerie', 'rlemerie3@histats.com', 'Bahamas');




CREATE SCHEMA travel;

go

CREATE TABLE travel.airport (
    airport_code    VARCHAR(3) PRIMARY KEY NOT NULL,
    city            VARCHAR(100) NOT NULL,
    estado          VARCHAR(2) NOT NULL,
    nome            VARCHAR(100) NOT NULL
);

CREATE TABLE travel.flight (
    numero      VARCHAR(6) PRIMARY KEY NOT NULL,
    airline     VARCHAR(10) NOT NULL,
    weekdays    VARCHAR(7) NOT NULL
);

CREATE TABLE travel.flight_leg (
    numero          VARCHAR(6) NOT NULL,
    leg_no          INTEGER NOT NULL,
    airport_dep     VARCHAR(3) NOT NULL,
    departure_time  TIME NOT NULL,
    airport_arr     VARCHAR(3) NOT NULL,
    arrival_time    TIME NOT NULL,
    PRIMARY KEY (numero, leg_no),
    FOREIGN KEY (airport_dep) REFERENCES travel.airport(airport_code),
    FOREIGN KEY (airport_arr) REFERENCES travel.airport(airport_code)
);

CREATE TABLE travel.leg_instance (
    numero          VARCHAR(6)NOT NULL,
    leg_no          INTEGER NOT NULL,
    data            DATE NOT NULL,
    no_avail_seats  INTEGER NOT NULL,
    arr_time        TIME  NOT NULL,
    dep_time        TIME  NOT NULL,
    airplane_ID     VARCHAR(6)  NOT NULL,
    arr_airport_code VARCHAR(3)  NOT NULL,
    dep_airport_code VARCHAR(3)  NOT NULL,
    PRIMARY KEY (numero, leg_no, data),
    FOREIGN KEY (numero, leg_no) REFERENCES travel.flight_leg(numero, leg_no),
    FOREIGN KEY (airplane_ID) REFERENCES travel.airplane(airplane_ID),
    FOREIGN KEY (arr_airport_code) REFERENCES travel.airport(airport_code),
    FOREIGN KEY (dep_airport_code) REFERENCES travel.airport(airport_code)  
);

	
CREATE TABLE travel.seat (
    numero         VARCHAR(6)  NOT NULL,
    leg_no         INTEGER  NOT NULL,
    data           DATE  NOT NULL,
    seat_no        INTEGER  NOT NULL,
    c_phone        VARCHAR(15)  NOT NULL,
    customer_name  VARCHAR(50)  NOT NULL,
    PRIMARY KEY (numero, leg_no, data, seat_no),
    FOREIGN KEY (numero, leg_no, data) REFERENCES travel.leg_instance(numero, leg_no, data)  
);

CREATE TABLE travel.airplane_type (
    type_name   VARCHAR(50) PRIMARY KEY  NOT NULL,
    max_seats   INTEGER  NOT NULL,
    company     VARCHAR(50)  NOT NULL
);

CREATE TABLE travel.fare (
    numero          VARCHAR(6) NOT NULL,
    code            VARCHAR(6)  NOT NULL,
    amount          FLOAT  NOT NULL,
    restrictions    VARCHAR(100)  NOT NULL,
    PRIMARY KEY (numero, code),
    FOREIGN KEY (numero) REFERENCES travel.flight(numero) 
);

CREATE TABLE travel.can_land (
    airport_code VARCHAR(3)  NOT NULL,
    type_name    VARCHAR(50)  NOT NULL,
    PRIMARY KEY (airport_code, type_name),
    FOREIGN KEY (airport_code) REFERENCES travel.airport(airport_code),
    FOREIGN KEY (type_name) REFERENCES travel.airplane_type(type_name)
);

CREATE TABLE travel.airplane (
    airplane_ID      VARCHAR(6) PRIMARY KEY  NOT NULL,
    total_num_seats  INTEGER  NOT NULL,
    type_name        VARCHAR(50) REFERENCES travel.airplane_type(type_name)   NOT NULL
);

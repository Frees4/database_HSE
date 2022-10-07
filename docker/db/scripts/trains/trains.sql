CREATE TABLE train (
  train_num int PRIMARY KEY,
  length int
);

CREATE TABLE station (
  station_name varchar PRIMARY KEY,
  tracks_num int,
  city_name varchar,
  start timestamp,
  end timestamp
);

CREATE TABLE city (
  city_name varchar PRIMARY KEY,
  region varchar
);

CREATE TABLE connected (
  train_num int PRIMARY KEY,
  station_from varchar,
  station_to varchar,
  departure date,
  arrival date
);


ALTER TABLE city ADD FOREIGN KEY (city_name) REFERENCES station (city_name);
ALTER TABLE connected ADD FOREIGN KEY (train_num) REFERENCES train (train_num);
ALTER TABLE connected ADD FOREIGN KEY (station_from) REFERENCES station (station_name);
ALTER TABLE connected ADD FOREIGN KEY (station_to) REFERENCES station (station_name);
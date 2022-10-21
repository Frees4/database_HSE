# Исправленные SQL скрипты

hospital.sql

    CREATE TABLE "patient" (
      "patient_num" integer PRIMARY KEY,
      "name" text,
      "disease" text,
      "station_num" integer REFERENCES station (station_num),
      "room_num" integer REFERENCES room (room_num),
      "doctor_num" integer REFERENCES doctor (personell_num)
    );

    CREATE TABLE "room" (
      "room_num" integer,
      "beds_count" integer,
      "station_num" integer REFERENCES station (station_num),
      "admission_from" timestamp,
      "admission_to" timestamp,
      PRIMARY KEY ("room_num", "station_num")
    );

    CREATE TABLE "station" (
      "station_num" integer PRIMARY KEY,
      "name" text
    );

    CREATE TABLE "station_personell" (
      "personell_num" integer PRIMARY KEY,
      "station_num" integer REFERENCES station (station_num),
      "name" text
    );

    CREATE TABLE "caregiver" (
      "personell_num" integer PRIMARY KEY REFERENCES station_personell (station_num),
      "qualification" text
    );

    CREATE TABLE "doctor" (
      "personell_num" integer PRIMARY KEY REFERENCES station_personell (station_num),
      "rank" text,
      "area" text
    );

trains.sql

    CREATE TABLE city (
      name varchar PRIMARY KEY UNIQUE,
      region varchar UNIQUE
    );

    CREATE TABLE station (
      name varchar PRIMARY KEY UNIQUE,
      tracks_num int,
      city_name varchar REFERENCES city (name),
      region varchar REFERENCES city (region)
    );

    CREATE TABLE train (
      train_num int PRIMARY KEY,
      length int,
      StartStationName varchar REFERENCES station (name),
      EndStationName varchar REFERENCES station (name)
    );

    CREATE TABLE Connection (
      FromStation varchar REFERENCES station (name),
      ToStation varchar REFERENCES station (name),
      TrainNr int REFERENCES train (train_num),
      Departure timestamp,
      Arrival timestamp
    );

library.sql

    CREATE TABLE Publisher (
      PubName varchar PRIMARY KEY UNIQUE,
      PubAddress varchar
    );

    CREATE TABLE Book (
      ISBN int UNIQUE PRIMARY KEY,
      Title varchar,
      Author varchar,
      PagesNum int,
      PubYear date,
      PubName varchar UNIQUE,
      FOREIGN KEY (PubName) REFERENCES Publisher (PubName)
    );

    CREATE TABLE Category (
      CategoryName varchar PRIMARY KEY,
      ParentCat varchar REFERENCES Category (Categoryname)
    );

    CREATE TABLE Copy (
      ISBN int,
      CopyNumber int UNIQUE,
      ShelfPosition varchar,
      PRIMARY KEY (ISBN, CopyNumber),
      FOREIGN KEY (ISBN) REFERENCES book (ISBN)
    );

    CREATE TABLE Reader (
      ID int PRIMARY KEY,
      LastName varchar,
      FirstName varchar,
      Address varchar,
      BirthDate date
    );

    CREATE TABLE Borrowing (
      ReaderNr int,
      ISBN int,
      CopyNumber int,
      ReturnDate date,
      FOREIGN KEY (ReaderNr) REFERENCES Reader (ID),
      FOREIGN KEY (ISBN) REFERENCES book (ISBN),
      FOREIGN KEY (CopyNumber) REFERENCES Copy (CopyNumber)
    );

    CREATE TABLE BookCat (
        ISBN int,
        CategoryName varchar,
        FOREIGN KEY (CategoryName) REFERENCES Category (CategoryName),
        FOREIGN KEY (ISBN) REFERENCES book (ISBN)
    );

CREATE TABLE "patient" (
  "patient_num" integer PRIMARY KEY,
  "name" text,
  "disease" text,
  "station_num" integer,
  "room_num" integer,
  "doctor_num" integer
);

CREATE TABLE "room" (
  "room_num" integer,
  "beds_count" integer,
  "station_num" integer,
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
  "station_num" integer,
  "name" text
);

CREATE TABLE "caregiver" (
  "personell_num" integer,
  "qualification" text
);

CREATE TABLE "doctor" (
  "personell_num" integer PRIMARY KEY,
  "rank" text,
  "area" text
);

ALTER TABLE "patient" ADD FOREIGN KEY ("station_num", "room_num") REFERENCES "room" ("station_num", "room_num");
ALTER TABLE "patient" ADD FOREIGN KEY ("doctor_num") REFERENCES "doctors" ("personell_num");
ALTER TABLE "room" ADD FOREIGN KEY ("station_num") REFERENCES "stations" ("station_num");
ALTER TABLE "station_personell" ADD FOREIGN KEY ("station_num") REFERENCES "stations" ("station_num");
ALTER TABLE "caregiver" ADD FOREIGN KEY ("personell_num") REFERENCES "station_personell" ("personell_num");
ALTER TABLE "doctor" ADD FOREIGN KEY ("personell_num") REFERENCES "station_personell" ("personell_num");
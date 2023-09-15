CREATE TABLE "book" (
  "id" integer[pk],
  "title" varchar(255),
  "category_id" integer[fk]
);

CREATE TABLE "book_author" (
  "book_id" integer[pk][fk],
  "author_id" integer[pk][fk]
);

CREATE TABLE "author" (
  "id" integer[pk],
  "name" varchar(255)
);

CREATE TABLE "waitlist" (
  "patron_id" integer[pk][fk],
  "book_id" integer[pk][fk]
);

CREATE TABLE "category" (
  "id" integer[pk],
  "name" varchar(255)
);

CREATE TABLE "book_copy" (
  "id" integer[pk],
  "year_published" integer,
  "book_id" integer[fk],
  "publisher_id" integer[fk]
);

CREATE TABLE "checkout" (
  "id" integer PRIMARY KEY,
  "start_time" timestamp,
  "end_time" timestamp,
  "book_copy_id" integer[fk],
  "patron_account_id" integer[fk]
);

CREATE TABLE "patron_account" (
  "card_number" char(10) PRIMARY KEY,
  "first_name" varcher(255),
  "surname" varchar(255),
  "email" varchar(255),
  "status" varchar(10)
);

CREATE TABLE "hold" (
  "id" integer[pk],
  "start_time" timestamp,
  "end_tme" timestamp,
  "book_copy_id" integer[fk],
  "patron_account_id" integer[fk]
);

CREATE TABLE "publisher" (
  "id" integer PRIMARY KEY,
  "name" varcher(255)
);

CREATE TABLE "notification" (
  "id" integer PRIMARY KEY,
  "sent_at" timestamp,
  "type" varchar(20),
  "patron_account_id" integer[fk]
);

ALTER TABLE "book_author" ADD FOREIGN KEY ("book_id") REFERENCES "book" ("id");

ALTER TABLE "waitlist" ADD FOREIGN KEY ("patron_id") REFERENCES "book" ("title");

ALTER TABLE "book" ADD FOREIGN KEY ("id") REFERENCES "category" ("name");

ALTER TABLE "book_copy" ADD FOREIGN KEY ("id") REFERENCES "book" ("category_id");

ALTER TABLE "checkout" ADD FOREIGN KEY ("start_time") REFERENCES "book_copy" ("book_id");

ALTER TABLE "checkout" ADD FOREIGN KEY ("id") REFERENCES "patron_account" ("first_name");

ALTER TABLE "book_copy" ADD FOREIGN KEY ("publisher_id") REFERENCES "publisher" ("id");

ALTER TABLE "hold" ADD FOREIGN KEY ("start_time") REFERENCES "book_copy" ("book_id");

ALTER TABLE "hold" ADD FOREIGN KEY ("end_tme") REFERENCES "patron_account" ("email");

ALTER TABLE "notification" ADD FOREIGN KEY ("sent_at") REFERENCES "patron_account" ("surname");

ALTER TABLE "patron_account" ADD FOREIGN KEY ("card_number") REFERENCES "waitlist" ("patron_id");

ALTER TABLE "book_author" ADD FOREIGN KEY ("book_id") REFERENCES "author" ("name");

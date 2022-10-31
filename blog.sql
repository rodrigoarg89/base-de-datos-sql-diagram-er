CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL,
  "age" int NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "authors" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar UNIQUE NOT NULL,
  "description" varchar,
  "author_id" int,
  "category_id" int,
  "content" varchar UNIQUE
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "comment" varchar,
  "user_id" int,
  "posts_id" int
);

CREATE TABLE "category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

ALTER TABLE "posts" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("author_id") REFERENCES "authors" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("posts_id") REFERENCES "posts" ("id");

insert into authors (name) values ('Robert Kiyosaki'), ('Tony Robins'), ('Brian Tracy');

insert into "user" (name, age, email, password) values 
('Thork Martillo', 33, 'thork@gmaiil.com', 'sdfas'), 
('Tony Stark', 45, 'ironman@gmaiil.com', 'sfderw'),
('Bruce Banner', 43, 'hulk@gmaiil.com', 'revadsf'),
('Peter Parker', 18, 'spidy@gmaiil.com', 'svarere'),
('Harry Osborn', 40, 'duendeverdejr@gmaiil.com', 'sdfvar');

insert into category (name) values ('inteligencia financiera'), ('inteligencia emocional');

insert into posts (title, description, author_id, category_id, content) values 
('Finances to Superheroes', 'Personal finance deals with how
Individuals or families manage their resources throughout their lives. In his analysis
includes not only income and expenses received or paid during life, but
also the financial tools or products available to individuals or
families to optimize the management of their resources.', 1, 1, 
'Objective of personal finance, Elements of personal finance,
Personal finance planning'),
('Personal development', 'It is a process in which the individual focuses on discovering 
certain aspects to put them into practice and improve their health, virtues, talents 
and abilities. The goal is to live in a balanced way and that there is consonance 
between body and mind.', 3, 2, 
'Action plan to start personal development
There are a series of outstanding steps to improve certain aspects of a person and 
for them to take control of their lives and implement these changes: Self knowledge, 
Objectives, Action plan, Means, Results');

insert into "comments"  (comment, user_id, posts_id) values 
('i like this aspect of life', 2, 2), 
('this is so good, i will never see this way', 1, 1);

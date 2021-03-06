# This script drops and recreates the database. It then populates the database with a minimum
# 2 main exercises per muscle category and 10 complete workouts.

DROP DATABASE IF EXISTS fitness;

CREATE DATABASE fitness;

USE fitness;

DROP TABLE IF EXISTS muscles;
DROP TABLE IF EXISTS secondary_muscles;
DROP TABLE IF EXISTS difficulty;
DROP TABLE IF EXISTS exercises;
DROP TABLE IF EXISTS workouts;

CREATE TABLE muscles (
id int NOT NULL,
name varchar(45),
PRIMARY KEY(id)
);

CREATE TABLE secondary_muscles (
id int NOT NULL,
name varchar(45),
PRIMARY KEY(id)
);

CREATE TABLE difficulty (
id int NOT NULL,
level varchar(45) NOT NULL,
warning varchar(255),
PRIMARY KEY(id)
);

CREATE TABLE exercises (
id int NOT NULL ,
name varchar(255) NOT NULL,
description	varchar(255),
primary_muscle int NOT NULL,
secondary_muscle int,
difficulty varchar(255),
PRIMARY KEY(id)
);

CREATE TABLE workouts (
id int NOT NULL	AUTO_INCREMENT,
name varchar(255) NOT NULL,
description	varchar(255),
exercise_one varchar(255),
exercise_two varchar(255),
exercise_three varchar(255),
difficulty int,
PRIMARY KEY(id)
);

INSERT INTO 
muscles (id, name) 
VALUES 
(0, "biceps"),
(1, "triceps"),
(2, "chest"),
(3, "forearms"),
(4, "abdominals"),
(5, "quadriceps"),
(6, "hamstrings"),
(7, "calves"),
(8, "back"),
(9, "shoulders");

INSERT INTO
secondary_muscles (id, name)
VALUES
(0, "distal bicep head"),
(1, "teres minor"),
(2, "sternocleidomastoid"),
(3, "brachioradialis"),
(4, "tranverse abdomis"),
(5, "rectus femoris"),
(6, "gluteus maximus"),
(7, "soleus"),
(8, "external oblique"),
(9, "deltoid head");

INSERT INTO
difficulty (id, level, warning)
VALUES
(0, "beginner", "This is fine for any level of experience."),
(1, "intermediate", "We recommend that someone shows you the ropes if this is your first time."),
(2, "expert", "Make sure you know what you're doing, or you risk injury (or an inefficient workout).");

INSERT INTO
exercises(id, name, description, primary_muscle, secondary_muscle, difficulty)
VALUES
(0, "standing dumbell curl", 
"Hold dumbells by your sides in each hand. Keeping your elbows tucked by your torso, curl the dumbells towards each side of your chest.", 
0, 0, 0),
(1, "hammer curl", 
"This is a standard hammer curl but keep the dumbbells parallel to your body instead of twisting them.",
0, 0, 1),
(2, "triangle pushups",
"The classic pushup is modified by bringing your hands together under your chest. Keep your elbows tucked in close.",
1, 1, 2),
(3, "skullcrushers", 
"Hold a single dumbell; behind your head with both hands. Keep your elbows tucked in as your straighten your arms upwards", 
1, 1, 2),
(4, "pushups", 
"The standard pushup is invaluable for building your triceps and chest. Keeping your hands at shoulders width focuses building on your chest.", 
2, 2, 1),
(5, "dumbell chest press", 
"Lay flat on a bench with dumbells at your side. Keep your arms and hands at shoulder length and press the dumbells into the air.", 
2, 2, 1),
(6, "behind the back curls", 
"Using a 45 degree bench, allow your arms to dangle behind you holding 2 dumbbells. Curl them to your chest.", 
3, 3, 2),
(7, "reverse curls", 
"These are standard curls with an overhand grip for building your forarms. You likely won't be able to curl quite as much.", 
3, 4, 1),
(8, "situps", 
"The biggest tip people need when performing situps is start going up immedaitely as soon as their back hits.", 
4, 4, 0),
(9, "plank", 
"Make sure to keep your back straight and flat.", 
4, 8, 1),
(10, "squats", 
"Ensure your knees stay over your feed to reduce straight on your knee.", 
5, 7, 1),
(11, "lunges", 
"For a more advanced lunge take large steps.", 
5, 6, 0),
(12, "good mornings", 
"Hold a barbell or dowel across your back at shoulder level. Slightly bed your knees and hinge forward from your hips until your chest is parallel to the ground.", 
6, 7, 0),
(13, "sumo deadlifts", 
"These are similar to regular deadlifts except your feet are further than hip width apart. Just imagine a sumo stance!", 
6, 7, 2),
(14, "calf raises", 
"Find something heavy and a slightly raised area such as a step. Then lift onto your tip-toes.", 
7, 7, 0),
(15, "bent rows", 
"Place one knee on a bench and let your arm dangle on the side with your straigt leg. Pull upwards into your hip.", 
8, 0, 0),
(16, "pullups", 
"Use a wide grip outside your shoulders with your palms facing out for a back focused pullup.", 
8, 0, 1),
(17, "side raises", 
"Hold your dumbbells at your sides and raise your arms to your side. Stop at shoulder height.", 
9, 9, 1),
(18, "front raises", 
"Similar to side raises but you want to go straight forward, still stopping at shoulder height.", 
9, 9, 0);

INSERT INTO
workouts (id, name, description, exercise_one, exercise_two, exercise_three, difficulty)
VALUES
(default, "Quarantine Special",
"This is a fullbody workout that doesn't require weights. Perfect for the quarantine!",
4, 14, 16, 2),
(default, "Upper Body Blast",
"This set of exercises should be performed without stopping as to maximize your workout.",
0, 3, 17, 0),
(default, "Shoulder Focus",
"Three shoulder focused exercises will have you feeling the burn.",
17, 18, 3, 1),
(default, "Bicep Focus",
"We combine one compound exercise with two bicep isolations.",
0, 1, 15, 0),
(default, "Tricep Focus",
"This combines one compound exercise with two tricep isolating movements.",
2, 3, 5, 1),
(default, "Lower Body Crunch",
"This exclusively focuses on the lower body and can be adjusted with high weights or high reps, or both.",
11, 14, 10, 2);

select * from exercises;


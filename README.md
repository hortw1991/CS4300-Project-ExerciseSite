# CS4300-Project-ExerciseSite
CS4300 Final Project

## Initial Proposal

Our website is going to be a fitness centric site, specializing in letting users look up workouts and choosing workouts to let them add to their overall plan

* First page will be a generic landing page, listing new site developments, new workouts, and any other breaking news.
* We will have a page of preset workouts allowing the users to focus on building strength, cardio, or various combinations.
* There will be a page allowing you to search workouts by muscle type, bodyweight or free weights, benches, and various other options.
* The fourth page will be a article page that allows users to view all or search for articles about
  the benefit of certain exercises
* The fifth page is an about us page with our information and our philosophy

Our SQL database will focus on 3 types of data: user data (aka user stored workouts and settings), exercise data (individual exercises), and workout sets.

* User data is fairly straightforward. Other than their login credentials, we will be keeping track of what custom workouts they have selected. This can be as simple as linking to the workout or “favorited” exercise primary key (likely to be the name of the exercise>
* Exercise data will be the most basic type of data. It will have the name of the exercise, keyword muscle groups, and other information like bench, warnings, or things that the user may or may not want to focus on. For example, “hammer curls” would contain the keyword “bicep” so that when the user searches bicep or arm, this is returned in the query.
* Workout data is essentially a name for the workout and a link to the SQL key containing stored exercises.

Our database queries will focus around retreiving exercises, sets of exercises, and articles pertaining to a specific topic from the user

* For user workouts, the query might be as simple as ‘SELECT * FROM USER_WORKOUT WHERE USERNAME == “USER”. Any other data should be able to be essentially the same lookup.
* Workout data is similar to user data. When the user selects options such as BICEP and FREE WEIGHT, the query would be SELECT EXERCISE_NAME from EXERCISES where BICEP == 1 and FREE_WEIGHT == 1. It may be possible these would just look up an image link to take youto the specific BICEP workout exercise page.

The user data will have login information, exercise search, and workout searches

* The first will be a login page for the user to store and access their data and saved workouts. The exercises and some set workouts will be searchable without creating an account.
* The second user data focuses on searches for specific exercises and we will retrieve form data (such as focus on specific body parts) to filter our query.
* The third type of user data specific data is an ability for the user to save exercises into set workouts which are then searchable by them (and maybe others including anonymous users, though we don't want a situation where anyone can just flood our database with worthless workout sets)

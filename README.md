# iKanBan README

Welcome to iKanBan! This task board app can help you stay organized on a variety of projects, with and without colleagues. Please follow these instructions to install and run the app:
~~~~~
1. Run `bundle install` to install the necessary gems.
2. Create a `.env` file and immediately add it to `gitignore` -- DO NOT make any commits before `.env`
is added to `gitignore`.
3. Use the Google Developer Console to create a new project (web application), then set up the OAuth
consent screen. Once your project has been created, copy the Google Client ID and Google Client Secret
and paste them into `.env` as `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET`. They must be saved this way
for Google OAuth to work in the app.
4. Run rails s and navigate to http://localhost:3000 to get started. Have fun!
~~~~~
~~~~~
# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many
Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; 
e.g., Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that
is to say, some attribute other than its foreign keys that can be submitted by the app's user
(attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations 
e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see
the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
~~~~~
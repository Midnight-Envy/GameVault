# Specifications for the Rails Assessment

Add notes below each checkbox with how your application has met the requirement

Requirements:

- [x] Uses Ruby on Rails
  - GameVault is built as a Ruby on Rails application using Rails models, controllers, views, routes, and ActiveRecord.

- [x] Includes at least one has_many relationship
  - User `has_many :game_entries` and `has_many :reviews`.
  - Game also `has_many :game_entries` and `has_many :reviews`.

- [x] Includes at least one belongs_to relationship
  - GameEntry `belongs_to :user` and `belongs_to :game`.
  - Review also `belongs_to :user` and `belongs_to :game`.

- [x] Includes at least two has_many through relationships
  - User `has_many :games, through: :game_entries`.
  - Game `has_many :users, through: :game_entries`.

- [x] Every model contains at least two simple attributes
  - User contains username and email.
  - Game contains name, developer, release_year, and genre.
  - GameEntry contains status, rating, hours_played, and notes.
  - Review contains title, body, and rating.

- [x] Includes reasonable validations
  - User validates account information such as username and email.
  - Game validates required game information and prevents duplicate game names.
  - GameEntry validates status, rating, hours played, and prevents a user from adding the same game to their vault more than once.
  - Review validates its title, body, and rating.

- [x] Includes a class level ActiveRecord scope method
  - GameEntry defines ActiveRecord scopes for `playing`, `completed`, and `backlog` statuses.

- [x] Includes signup, login and logout functionality
  - GameVault uses `has_secure_password`, Rails sessions, a UsersController, and a SessionsController to provide signup, login, and logout functionality.

- [x] Includes nested resource show or index
  - Reviews are nested under Games.
  - A game's reviews can be viewed at `/games/:game_id/reviews`.

- [x] Includes nested resource form
  - The new Review form is nested under its parent Game at `/games/:game_id/reviews/new`.

- [x] Includes form display of validation errors
  - Forms display model validation errors to the user when invalid information is submitted.

- [x] Includes Unit tests all of your models
  - RSpec model specs test User, Game, GameEntry, and Review.

- [x] Includes at least one type of Integration test
  - GameVault includes RSpec request specs that test application request and response behavior.

- [x] Use FactoryBot to build instances of your models in your tests
  - FactoryBot factories are defined for User, Game, GameEntry, and Review and are used throughout the RSpec test suite.

- [x] Conforms to Nitro Ruby linting rules (running `rubocop` returns 0 offenses)
  - RuboCop and rubocop-performance are configured for the project.
  - Running `bundle exec rubocop` returns 0 offenses.

- [x] Includes a `README.md` with an application description and installation guide
  - README.md describes GameVault, its models, relationships, features, testing, installation, and usage.

Confirm:

- [x] The application is pretty DRY
  - Shared functionality is reused where appropriate, including the Game form partial and controller authentication methods.

- [x] Limited logic in controllers
  - Model validations, associations, and scopes are defined in the models while controllers primarily handle request flow, record creation/update, rendering, and redirects.

- [x] Views use helper methods if appropriate
  - Rails view helpers such as `form_with`, `link_to`, `button_to`, and route helpers are used throughout the views. Authentication methods such as `current_user` and `logged_in?` are also exposed for use in shared navigation.

- [x] Views use partials if appropriate
  - The Game form is extracted into `app/views/games/_form.html.erb` and rendered by the Game form view.

If you've added any additional functionality to your application that you'd like to demonstrate, please describe it below:

GameVault includes a personal game library built through the GameEntry join model. Each user can track their own status, rating, hours played, and notes for a game. The application also prevents a user from adding the same game to their vault multiple times and provides shared navigation for moving between the game catalog, personal vault, game creation, profile, reviews, and authentication features.
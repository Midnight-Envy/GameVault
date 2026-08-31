# GameVault

GameVault is a Ruby on Rails application that allows users to build and manage a personal video game library. Users can browse games, add games to their own vault, track their progress and experience with each title, and leave reviews.

## Project Goal

The goal of GameVault is to create a simple place for players to keep track of the games they are playing, the games they have completed, and the games they want to play next.

The project is also designed to demonstrate Rails concepts including MVC, RESTful routing, ActiveRecord associations, validations, authentication, nested resources, scopes, and automated testing with RSpec.

## Models and Relationships

GameVault is planned around four main models:

### User

A User represents a registered GameVault account.

- `has_many :game_entries`
- `has_many :games, through: :game_entries`
- `has_many :reviews`

### Game

A Game represents a video game stored in GameVault.

- `has_many :game_entries`
- `has_many :users, through: :game_entries`
- `has_many :reviews`

### GameEntry

GameEntry is the join model between User and Game. It represents a specific game being stored in a specific user's personal library.

- `belongs_to :user`
- `belongs_to :game`

Planned attributes include:

- status
- rating
- hours played
- notes

### Review

A Review connects a user's written review to a specific game.

- `belongs_to :user`
- `belongs_to :game`

Planned attributes include:

- title
- body
- rating

## Features

### User Authentication

Users can create an account, log in, and log out. Authentication protects user-specific features such as managing a personal library and creating reviews.

### Browse Games

Users can browse games stored in GameVault and view information about individual games.

For the MVP, games are stored directly in the application's database rather than retrieved from an external API.

### Add Games

Logged-in users can add new games to GameVault when a game does not already exist.

Planned game information includes:

- Name
- Developer
- Release year
- Genre

### Personal Game Library

Users can add existing games to their own library through GameEntries.

Each GameEntry can track information specific to that user, including:

- Status
- Rating
- Hours played
- Notes

Example statuses include Backlog, Playing, and Completed.

### Library Filters

ActiveRecord scopes will allow users to filter their library by status, such as currently playing or completed games.

### Game Reviews

Users can leave reviews for games. Reviews contain a title, body, and rating and belong to both the user who created the review and the game being reviewed.

Reviews are planned as a nested resource under games.

Example:

`/games/1/reviews`

`/games/1/reviews/new`

## Technologies Used

- Ruby
- Ruby on Rails
- ActiveRecord
- ERB
- HTML
- CSS
- SQLite
- RSpec
- FactoryBot
- RuboCop

## Testing

GameVault will use RSpec for automated testing.

The test suite will include:

- Unit/model specs for all models
- FactoryBot factories for model test data
- At least one integration, request, feature, or system spec

## MVP

The minimum viable product includes:

1. User signup, login, and logout
2. Browse games
3. Create games
4. Add games to a personal library
5. Track game status, rating, hours played, and notes
6. Filter library entries using ActiveRecord scopes
7. Create and view reviews nested under games
8. Display validation errors in forms
9. RSpec model tests and at least one integration-style test

## Stretch Goals

Once the core Rails requirements are complete, possible additions include:

- External video game API integration for game search/importing
- Game cover artwork
- Favorite games
- Additional filtering and sorting
- User profile pages
- Expanded review features

## Installation

### 1. Clone the Repository

`git clone <repository-url>`

### 2. Navigate into the Project Directory

`cd game-vault`

### 3. Install Dependencies

`bundle install`

### 4. Set Up the Database

`bin/rails db:migrate`

If seed data is included:

`bin/rails db:seed`

### 5. Run the Test Suite

`bundle exec rspec`

### 6. Check Ruby Style

`bundle exec rubocop`

### 7. Start the Rails Server

`bin/rails server`

Then visit:

`http://localhost:3000`

## Project Status

GameVault is currently in the planning and development stage. Features and documentation will be updated as the application is built.

## Author

Thomas Correia

Power Coding Academy - Phase 4 Rails Project

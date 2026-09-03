# GameVault

GameVault is a Ruby on Rails application that allows users to build and manage a personal video game library. Users can create an account, browse games, add games to their personal vault, track their progress with each title, and write reviews.

## Project Goal

The goal of GameVault is to create a simple place for players to keep track of the games they are playing, the games they have completed, and the games they want to play next.

The project also demonstrates core Ruby on Rails concepts including MVC, RESTful routing, ActiveRecord associations, validations, authentication, nested resources, scopes, partials, and automated testing with RSpec and FactoryBot.

## Models and Relationships

GameVault is built around four main models:

### User

A User represents a registered GameVault account.

Associations:

- `has_many :game_entries`
- `has_many :games, through: :game_entries`
- `has_many :reviews`

Users authenticate using `has_secure_password`.

### Game

A Game represents a video game stored in GameVault.

Associations:

- `has_many :game_entries`
- `has_many :users, through: :game_entries`
- `has_many :reviews`

Game information includes:

- Name
- Developer
- Release year
- Genre

### GameEntry

GameEntry is the join model between User and Game. It represents a specific game being stored in a specific user's personal library.

Associations:

- `belongs_to :user`
- `belongs_to :game`

Attributes include:

- Status
- Rating
- Hours played
- Notes

GameEntry also contains ActiveRecord scopes for filtering entries by status:

- Backlog
- Playing
- Completed

### Review

A Review connects a user's written review to a specific game.

Associations:

- `belongs_to :user`
- `belongs_to :game`

Attributes include:

- Title
- Body
- Rating

## Features

### User Authentication

Users can create an account, log in, and log out.

Authentication is handled using Rails sessions and `has_secure_password`. Logged-in users can access user-specific functionality such as managing their personal vault and creating reviews.

### Browse Games

Users can browse the games stored in GameVault and click on individual games to view more information.

For the MVP, games are stored directly in the application's database rather than retrieved from an external API.

### Add Games

Logged-in users can add new games to GameVault.

Game information includes:

- Name
- Developer
- Release year
- Genre

Validations prevent invalid game records and duplicate game names.

### Personal Game Library

Users can add existing games to their own personal library through GameEntries.

Each GameEntry tracks information specific to that user, including:

- Status
- Rating
- Hours played
- Notes

Example statuses include Backlog, Playing, and Completed.

Users can view their vault and edit their GameEntries.

A user cannot add the same game to their personal vault more than once.

### Library Filters

GameEntry includes class-level ActiveRecord scopes for filtering library entries by status.

The available status scopes include:

- Backlog
- Playing
- Completed

### Game Reviews

Users can write and view reviews for games.

Each review belongs to both the User who created it and the Game being reviewed.

Reviews contain:

- Title
- Body
- Rating

Reviews are implemented as a nested resource under games.

Example nested routes:

`/games/1/reviews`

`/games/1/reviews/new`

This allows reviews to remain directly associated with the game being viewed.

### Validation Errors

Forms display validation errors when submitted data does not meet model requirements.

This provides users with feedback instead of silently failing or creating invalid records.

### Application Navigation

GameVault includes shared application navigation so users can move through the application without manually entering URLs.

Logged-in users can navigate between:

- Browse Games
- My Vault
- Add Game
- My Profile
- Log Out

Users can also access a game's reviews and review form directly from that game's page.

## Technologies Used

- Ruby
- Ruby on Rails
- ActiveRecord
- ERB
- HTML
- SQLite
- RSpec
- FactoryBot
- RuboCop
- RuboCop Performance

## Testing

GameVault uses RSpec and FactoryBot for automated testing.

The test suite includes:

- Unit/model specs for User
- Unit/model specs for Game
- Unit/model specs for GameEntry
- Unit/model specs for Review
- FactoryBot factories for test data
- Request specs for integration-style testing

Run the full test suite with:

```bash
bundle exec rspec
```

The current test suite contains 27 passing examples.

## Code Quality

GameVault uses RuboCop to enforce Ruby style and code-quality standards.

Run RuboCop with:

```bash
bundle exec rubocop
```

The application currently passes RuboCop with zero offenses.

The application also uses Rails partials where appropriate to reduce duplication. For example, the Game form is extracted into a reusable `_form.html.erb` partial.

## MVP

The completed minimum viable product includes:

1. User signup, login, and logout
2. Browse games
3. Create games
4. View individual games
5. Add games to a personal library
6. Edit personal GameEntries
7. Track game status, rating, hours played, and notes
8. Filter library entries using ActiveRecord scopes
9. Create and view reviews nested under games
10. Display validation errors in forms
11. Navigate through the application using clickable links
12. RSpec model testing
13. Request/integration-style testing
14. FactoryBot test data
15. RuboCop linting

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/Midnight-Envy/GameVault.git
```

### 2. Navigate into the Project Directory

```bash
cd GameVault
```

### 3. Install Dependencies

```bash
bundle install
```

### 4. Set Up the Database

Run the database migrations:

```bash
bin/rails db:migrate
```

### 5. Run the Test Suite

```bash
bundle exec rspec
```

### 6. Check Ruby Style

```bash
bundle exec rubocop
```

### 7. Start the Rails Server

```bash
bin/rails server
```

Then visit:

`http://localhost:3000`

## Using GameVault

After starting the Rails server:

1. Visit `http://localhost:3000`
2. Create an account or log in
3. Browse the available games
4. Add a new game if needed
5. Click a game to view its details
6. Add the game to your personal vault
7. Visit My Vault to manage your games
8. Edit your status, rating, hours played, or notes
9. View or write reviews from an individual game's page
10. Log out when finished

## Stretch Goals

Future additions to GameVault could include:

- External video game API integration for game search and importing
- Game cover artwork
- Favorite games
- Additional filtering and sorting
- Expanded user profile pages
- Expanded review functionality
- Improved visual styling

## Author

Thomas Correia

Power Coding Academy - Phase 4 Rails Project
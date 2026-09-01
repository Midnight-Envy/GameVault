# GameVault User Stories

## User Stories

### Feature 1: User Authentication

#### User Story

As a user, I want to create an account and log in so that I can maintain my own personal GameVault.

#### Details

- A user can sign up with a username, email, and password.
- A user can log in with valid credentials.
- A logged-in user can log out.
- Passwords are stored securely using Rails authentication.
- Validation errors are displayed when signup information is invalid.

---

### Feature 2: Browse Games

#### User Story

As a user, I want to browse the games stored in GameVault so that I can find games I have played or want to play.

#### Details

- Users can view an index of games.
- Each game displays basic information such as its name, developer, release year, and genre.
- Users can select a game to view its individual show page.
- Games are stored in the application's database rather than retrieved from an external API for the MVP.

---

### Feature 3: Add a Game to GameVault

#### User Story

As a user, I want to add a game that is not already in GameVault so that it can be added to my library.

#### Details

- Logged-in users can create a new game.
- The game form accepts information such as name, developer, release year, and genre.
- Game data is validated before it is saved.
- Validation errors are displayed in the form when invalid information is submitted.
- Game names should be unique to help prevent duplicate game records.

---

### Feature 4: Manage My Game Library

#### User Story

As a user, I want to add games to my personal library so that I can track my experience with each game.

#### Details

- A user can add an existing game to their library.
- A `GameEntry` connects a User and a Game.
- Each GameEntry stores user-specific information such as status, rating, hours played, and notes.
- A user can update their GameEntry as their experience with the game changes.
- Status options can include Backlog, Playing, and Completed.
- A user can view the games currently saved in their personal library.

---

### Feature 5: Filter My Library

#### User Story

As a user, I want to filter my library by game status so that I can quickly see what I am currently playing or have completed.

#### Details

- GameEntry uses ActiveRecord scopes to organize library entries.
- Users can view games with a specific status such as Playing, Completed, or Backlog.
- The filtering logic is handled by the model rather than duplicated in controllers or views.

---

### Feature 6: Review Games

#### User Story

As a user, I want to review a game so that I can record and share my opinion of it.

#### Details

- A logged-in user can create a review from a game's page.
- Reviews belong to both a User and a Game.
- A review contains a title, body, and rating.
- Reviews are nested under games using RESTful routes.
- A route such as `/games/1/reviews/new` allows a user to create a review for a specific game.
- Review validation errors are displayed when invalid information is submitted.

---

### Feature 7: View Game Reviews

#### User Story

As a user, I want to see reviews for a game so that I can see what other GameVault users think about it.

#### Details

- A game's show page displays reviews associated with that game.
- Each review identifies the user who created it.
- Reviews display their title, rating, and body.
- Review views use partials where appropriate to keep the application DRY.

---

## MVP

The minimum viable product includes:

1. User signup, login, and logout.
2. Browse and create games.
3. Add games to a personal library through GameEntries.
4. Track status, rating, hours played, and notes.
5. Filter library entries using at least one ActiveRecord scope.
6. Create and view reviews nested under games.
7. Display validation errors.
8. Model specs and at least one integration/request/feature spec using RSpec and FactoryBot.

## Stretch Goals

- Search or import games using an external video game API.
- Game cover artwork.
- Additional library filters and sorting.
- Favorite games.
- User profile pages.
- Review editing and additional review features.

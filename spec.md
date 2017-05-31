# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      - The CLI controller is in the lib/nyt_bestseller/cli.rb file.
      - This file contains the code that welcomes the user, presents the application's capabilities, and grabs the user's input needed to run the application.
- [x] Pull data from an external source
      - The data that is needed is pulled from the Barnes and Noble website.
      - The charts are each scraped from their own respective pages, and each book instance is scraped from the individual book's webpage within the B&N website.
- [x] Implement both list and detail views
      - The user is provided with a Category list on the first level.
      - The user is able to choose a Category, which provides a list of the top books in that selected Category.
      - From there, the user is able to choose a specific book to retrieve details such as Title, Author, and Summary.

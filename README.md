# Hangman just with a Tree / TREEMAN
#### Video Demo:  <https://youtu.be/KKmHspSDAdE>
#### Description:

The code in the first file represents a struct called Game which represents a single game of hangman. The Game struct has three properties: word, which is the word that the player needs to guess; incorrectMovesRemaining, which is the number of incorrect moves that the player is allowed to make before losing the game; and guessedLetters, which is an array of the letters that the player has guessed so far. The Game struct also has a method called playerGuessed which processes a player's guess and updates the game state accordingly. It also has a computed property called formattedWord which returns the word with underscores for unguessed letters and correctly guessed letters.

The code in the second file represents a class called ViewController which handles the game logic and UI for the hangman game. The ViewController class has properties for the total number of wins and losses, and outlets for the UI elements that display the game state. It also has a property called currentGame which represents the current game of hangman being played. The ViewController class has several methods for starting a new round of the game, updating the UI, enabling or disabling letter buttons, and checking the current state of the game.

Both of these files are necessary for the hangman game because they contain the logic and UI elements that are required for the game to function. The Game struct is responsible for representing a single game of hangman and processing player guesses, while the ViewController class handles the overall game logic and manages the UI elements that display the game state to the player.

I created the images for the trees with the apples in Photoshop. Just like the icon for the app.

# Hangman

Hangman is a word guessing game where the player must guess a hidden word before running out of incorrect moves.

# Features

Choose from a list of words to guess
View the number of wins and losses
See the number of incorrect moves remaining with a visual display
Guess letters by pressing buttons on the screen

# Requirements

iOS 16.2 or later
Xcode 11 or later

# Installation

Clone the repository or download the zip file
Open the project in Xcode
Build and run the project on a simulator or device

# Credits

This project was created by Frieder Singer as a learning exercise and the final project for the CS50 course at Harvard.
The UI was built using Interface Builder and the game logic was implemented in Swift.

# License

This project is licensed under the MIT License.

![treeman1](https://user-images.githubusercontent.com/117061955/210339170-46ed4f8b-b0db-4981-8c0d-f4de1f56311d.jpg)


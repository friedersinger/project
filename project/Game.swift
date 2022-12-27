//
//  Game.swift
//  project
//
//  Created by Frieder Singer on 25.12.22.
//

import Foundation

// Declare the Game struct, which represents a single game of Hangman but i made a tree game
struct Game {
    // Declare properties for the word to be guessed, the number of incorrect moves remaining, and the letters that have been guessed
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    // Process a player's guess and update the game state
    mutating func playerGuessed(letter: Character) {
        // Add the letter to the list of guessed letters
        guessedLetters.append(letter)
        // If the letter is not in the word, decrement the number of incorrect moves remaining
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
        
    }
    
    // Return the word with underscores for unguessed letters and correctly guessed letters
    var formattedWord: String{
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                // If the letter has been guessed, add it to the formatted word
                guessedWord += "\(letter)"
            } else {
                // If the letter has not been guessed, add an underscore
                guessedWord += "_"
            }
        }
        return guessedWord
    }

}

//
//  ViewController.swift
//  project
//
//  Created by Frieder Singer on 22.12.22.
//

import UIKit

// Declare an array of words that will be used in the game
var listOfWords = ["apple", "hamburger", "harvard", "python", "JavaScript", "bug", "year", "writer", "author", "ban", "auto"]

// Declare a constant for the number of incorrect moves allowed in the game
let incorrectMovesAllowec = 7

// Declare the ViewController class, which handles the game logic and UI
class ViewController: UIViewController {

    // Declare properties for the total number of wins and losses
    var totalWins = 0 {
        didSet {
            // Start a new round when the total number of wins changes
            newRound()
        }
    }

    var totalLosses = 0 {
        didSet {
            // Start a new round when the total number of losses changes
            newRound()
        }
    }

    // Declare outlets for the UI elements that display the game state
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    
    // Called when the view controller's view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Start a new round when the view is loaded
        newRound()
    }
    
    // Declare a property for the current game
    var currentGame: Game!
    
    // a func that start a new round of the game
    func newRound() {
        // If there are still words in the list, start a new game with the next word
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowec, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            // If there are no more words in the list, disable all letter buttons
            enableLetterButtons(false)
        }
    }
    
    // Enable or disable all letter buttons
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    // Update the UI to reflect the current state of the game
    func updateUI() {
        // Format the current game's word with spaces between each letter
        var letters = [String]()
            for letter in currentGame.formattedWord{
                letters.append(String(letter))
            }
            let wordWithSpacing = letters.joined(separator: " ")
            correctWordLabel.text = wordWithSpacing
        // Update the score label
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        // Update the tree image view to show the number of incorrect moves remaining
        treeImageView.image = UIImage(named: "tree-\(currentGame.incorrectMovesRemaining)")
    }

    // Called when a letter button is pressed
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        // Disable the button to prevent it from being pressed again
        sender.isEnabled = false
        
        // Get the letter from the button's title
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        
        // Have the current game process the player's guess
        currentGame.playerGuessed(letter: letter)
        // Update the game state
        updatGameState()
    }
    
    // Check the current state of the game and update the win/loss counters as needed
    func updatGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            // If the player has run out of incorrect moves, increase the loss counter
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            // If the player has guessed all the letters in the word, increase the win counter
            totalWins += 1
        } else {
            // If the game is not yet won or lost, update the UI
            updateUI()
        }
    }
}


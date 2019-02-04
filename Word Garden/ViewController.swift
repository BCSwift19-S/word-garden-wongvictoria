//
//  ViewController.swift
//  Word Garden
//
//  Created by Victoria Wong on 2/3/19.
//  Copyright © 2019 Victoria Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    var wordToGuess = "CODE"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
//        print ("In viewDidLoad, is guessedLetterField the first responder?",
//            guessedLetterField.isFirstResponder)
        
    }
    
    func updateUIAfterGuess(){
    guessedLetterField.resignFirstResponder()
    guessedLetterField.text = ""
        
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter(){
        formatUserGuessLabel()
        guessCount += 1
        
        //decrements wrongGuessesRemaining and shows the next flower image with one less petal
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
            
        }
        let revealedWord = userGuessLabel.text!
        // Stop game if wrongGuessesRemaining = 0
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So sorry, you're out of guesses. Try again?"
        } else if !revealedWord.contains("_") {
            //You've won a grame
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You've got it! It took you \(guessCount) guesses to guess the word!"
        } else {
            //update guess count
            let guess = (guessCount == 1 ? "Guess" : "Guesses")
            guessCountLabel.text = "You've made \(guessCount) \(guess)"
        }
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else {
            //disable butto if do not have single letter in the guessedLetterField
            guessLetterButton.isEnabled = false
        }
//        print ("Hey! The guessedLetterFieldChanged!!!")
    }
    
    @IBAction func doneKeyPresed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
//        print ("In doneKeyPressed, is guessedLetterField the first responder before updateUIAfterGuess?",
//               guessedLetterField.isFirstResponder)
//        updateUIAfterGuess()
//        print ("In doneKeyPressed, is guessedLetterField the first responder after updateUIAfterGuess?",
//               guessedLetterField.isFirstResponder)
    }
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
        
//        print ("In guessLetterButtonPressed, is guessedLetterField the first responder after updateUIAfterGuess?",
//               guessedLetterField.isFirstResponder)
//        updateUIAfterGuess()
//        print ("In guessLetterButtonPressed, is guessedLetterField the first responder after updateUIAfterGuess?",
//            guessedLetterField.isFirstResponder)
        
    }
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've made 0 guesses"
        guessCount = 0
    }
    

}


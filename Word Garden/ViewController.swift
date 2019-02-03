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
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
//        print ("In viewDidLoad, is guessedLetterField the first responder?",
//            guessedLetterField.isFirstResponder)
        
    }
    
    func updateUIAfterGuess(){
    guessedLetterField.resignFirstResponder()
    guessedLetterField.text = ""
        
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
    }
    

}


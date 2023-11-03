//
//  WordleDataModel.swift
//  Wordle-Clone
//
//  Created by Gaurav Bhambhani on 11/1/23.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    
    @Published var guesses: [Guess] = []
    
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6) // [0, 0, 0, 0, 0, 0]
    
    // for keyboard, empty dict with String as key and Color as value
    var keyColors = [String: Color]()
    
    var selectedWord = "" // this will hold the random word. empty initially.
    var currentWord = "" // we build a word that our string can compare to. So this starts out as an empty string, and again when we create a new game we will set it to an empty string.
    
    //once we add the letters to the word, we need to update our guess object for that row with the letters in that word. So we first need to know what row we're on.
    var tryIndex = 0
    
    var inPlay = false // to check if user has started the game. false initially. set to true in newGame() when it is triggered.
    
    
    var gameOver = false // to check if user is still playing or game is over.
    
    // this is a computed property used to check when the current word is not empty or when tryindex is greater than 0.
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    // this computed property will be used to see when should we disable the enter and backspace key 
    var disabledKeys: Bool {
        !inPlay || currentWord.count == 5
    }
    
    // for this class, when it gets initialised, we'll want to start a new game right away, so when we launch the app, we'll get a new game if one isn't already in display.
    init() {
        newGame()
    }
    
    // each time we start a new game, we have to refresh our guesses array to default values along with some other values that will need to be reset everytime we get a new game.
    
    // MARK: - Setup
    func newGame() {
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()! // ! is so that it compulsorilty gets a random word.
        currentWord = ""
        inPlay = true
        
    }
    
    func populateDefaults() {
        guesses = [] // reset it to empty array
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        
        // reset keyboard colors
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters {
            keyColors[String(char)] = .unused
        }
    }
    
    //MARK: - Game Play
    func addToCurrentWord(_ letter: String) {
        currentWord += letter
        updateRow()
    }
    
    func enterWord() {
        if currentWord == selectedWord {
            gameOver = true
            print("You Win :)")
            setCurrentGuessColors()
            inPlay = false
        } else {
            if verifyWord() {
                print("Valid word!")
                setCurrentGuessColors()
                tryIndex += 1
                if tryIndex == 6 {
                    gameOver = true
                    inPlay = false
                    print("You Lose :(")
                }
            } else {
                print("Invalid word!")
                withAnimation {
                    self.incorrectAttempts[tryIndex] += 1
                }
                incorrectAttempts[tryIndex] = 0
            }
        }
    }
    
    func removeLetterFromCurrentWord() {
        if currentWord.count > 0 {
            currentWord.removeLast()
        }
                
        updateRow()
    }
    
    func updateRow() {
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    // now to check if the input word is a valid word, we can use the in-built dictionary
    // check if word exists.
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
    
    // to set the background colors of each box
    func setCurrentGuessColors() {
        let correctLetters = selectedWord.map {String($0)}
        
        var frequency = [String : Int]() // dict
        for letter in correctLetters {
            frequency[letter, default: 0] += 1
        }
        
        // checking for correct
        for index in 0...4 {
            let correctLetter = correctLetters[index]
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if guessLetter == correctLetter {
                guesses[tryIndex].bgColors[index] = .correct
                frequency[guessLetter]! -= 1
            }
        }
        
        // checking for misplaced
        for index in 0...4 {
            let guessLetter = guesses[tryIndex].guessLetters[index]
            // check if guess letter is in correct letter and also check if background color at the current guess is not already set to correct.
            // so we can't override a correct letter with a misplaced letter.
            if correctLetters.contains(guessLetter)
                && guesses[tryIndex].bgColors[index] != .correct
                && frequency[guessLetter]! > 0 {
                
                guesses[tryIndex].bgColors[index] = .misplaced
                frequency[guessLetter]! -= 1
                
            }
        }
        
        // check for wrong is already done as all are initially marked as wrong.
        
        print(selectedWord)
        print(guesses[tryIndex].word)
    }
}

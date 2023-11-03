//
//  Guess.swift
//  Wordle-Clone
//
//  Created by Gaurav Bhambhani on 11/1/23.
//

import SwiftUI

struct Guess {
    
    let index: Int // created when we create the object and it never changes (let)
    var word = "     " // word is a string of 5 characters that's initially just 5 spaces and it's variable.
    var bgColors = [Color](repeating: .wrong, count: 5) // array of bg Color for each square initially set to the systems background color
    var cardFlipped = [Bool](repeating: false, count: 5) // all cards flipped initially will be false. if the guessed letter matches the word, we will change it to true and card will flip changing the color to green.
    
    // we will now break the word into an array so we can compare each letter of that word to the input letter. Done using a computed property that's an array of String and this could be found by mapping each character of the word converting it to a string
    
    var guessLetters: [String] {
        word.map{String($0) }
    }
    
}

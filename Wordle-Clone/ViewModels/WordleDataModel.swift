//
//  WordleDataModel.swift
//  Wordle-Clone
//
//  Created by Gaurav Bhambhani on 11/1/23.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    
    @Published var guesses: [Guess] = []
    
    // for this class, when it gets initialised, we'll want to start a new game right away, so when we launch the app, we'll get a new game if one isn't already in display.
    init() {
        newGame()
    }
    
    // each time we start a new game, we have to refresh our guesses array to default values along with some other values that will need to be reset everytime we get a new game.
    
    func newGame() {
        populateDefaults()
    }
    
    func populateDefaults() {
        guesses = [] // reset it to empty array
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
    }
}

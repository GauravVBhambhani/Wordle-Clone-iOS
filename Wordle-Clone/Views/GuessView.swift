//
//  GuessView.swift
//  Wordle-Clone
//
//  Created by Gaurav Bhambhani on 11/1/23.
//

import SwiftUI

struct GuessView: View {
    
    // in this view, we're going to need an instance of our guess that will be updated as we make our guesses, so we will make it a binding variable
    
    @Binding var guess: Guess
    
    var body: some View {
        HStack(spacing: 3) {
            // loop provides with an index that will represent the corresponding index of the guessed word array
            ForEach(0...4, id: \.self) { index in
                Text(guess.guessLetters[index])
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .background(Color.systemBackground)
                    .font(.system(size: 35, weight: .heavy))
                    .border(.primary)
            }
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(guess: .constant(Guess(index: 0)))
    }
}

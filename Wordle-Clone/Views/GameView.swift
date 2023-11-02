//
//  GameView.swift
//  Wordle-Clone
//
//  Created by Gaurav Bhambhani on 10/30/23.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var dm: WordleDataModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack (spacing: 3) {
                    ForEach(0...5, id: \.self){ i in
                        GuessView(guess: $dm.guesses[i])
                            .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[i])))
                    }
                    
//                    GuessView(guess: $dm.guesses[1])
//                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[1])))
//                    GuessView(guess: $dm.guesses[2])
//                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[2])))
//                    GuessView(guess: $dm.guesses[3])
//                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[3])))
//                    GuessView(guess: $dm.guesses[4])
//                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[4])))
//                    GuessView(guess: $dm.guesses[5])
//                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[5])))
                }
                .frame(width: Global.broadWidth, height: 6 * Global.broadWidth / 5)
                
                Spacer()
                
                Keyboard()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
                
                Spacer()
            }
            // No matter what screen we're using this on, the board will fit within a 5X6 rectangle.
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("WORDLE")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "chart.bar")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack) // to prevent the split view from occuring in iPads
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(WordleDataModel())
    }
}

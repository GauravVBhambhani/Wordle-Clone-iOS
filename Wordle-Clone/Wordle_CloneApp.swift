//
//  Wordle_CloneApp.swift
//  Wordle-Clone
//
//  Created by Gaurav Bhambhani on 10/30/23.
//

import SwiftUI

@main
struct Wordle_CloneApp: App {
    
    // now that we have our WordleDataModel, we can inject it into the environment, so since this file is the apps entry point, we create a state object, dm (DataModel)
    
    @StateObject var dm = WordleDataModel()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm) // when we present our GameView, we inject dm into the environment.
        }
    }
}

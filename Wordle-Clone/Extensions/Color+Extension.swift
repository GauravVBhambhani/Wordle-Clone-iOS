//
//  Color+Extension.swift
//  Wordle-Clone
//
//  Created by Gaurav Bhambhani on 11/1/23.
//

import SwiftUI

extension Color {
    // static properties of type Color that stores the colors we have in the assets folder.
    
    static var wrong: Color {
        Color(UIColor(named: "wrong")!)
    }
    
    static var misplaced: Color {
        Color(UIColor(named: "misplaced")!)
    }
    
    static var correct: Color {
        Color(UIColor(named: "correct")!)
    }
    
    static var unused: Color {
        Color(UIColor(named: "wrong")!)
    }
    
    static var systemBackground: Color {
        Color(.systemBackground)
    }
    
}

//
//  Global.swift
//  Wordle-Clone
//
//  Created by Gaurav Bhambhani on 11/1/23.
//


// Next, We want to know the width of the screen, so that we can adjust the width and height of the VStack that we're going to be putting our 6 rows of guesses in.
// after a lot of experimentation, here's the brief.
// after going through a sheet of dimensions of all known iOS devices, I defined a range of values based on the width and adjust accordingly within ranges.

import UIKit // for accessing UIString

// Here, i'll create a enum of Global, which we can use as our namespace.
// inside, we'll create a new series of static properties and that will require my accessing the UIString object

enum Global {
    
    // to find out whether we're in landscape or potrait mode.wajkl],o0
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    static var minDimension: CGFloat {
        min(screenWidth, screenHeight)
    }
    
    // best scale can be broken down based on a range of the minimum dimensions
    
    static var broadWidth: CGFloat {
        switch minDimension {
        case 0...320: // upto and including iPod touch
            return screenWidth - 55
        case 321...430: // iphones
            return screenWidth - 50
        case 431...1000: // smaller iPads
            return 350
        default: // everything larger than that
            return 500
        }
    }
}

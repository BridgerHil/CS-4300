//
//  Theme.swift
//  MemorizeV2
//
//  Created by Bridger Hildreth on 2/7/22.
//

import Foundation
import SwiftUI

struct Theme {
    
    var color: String
    var name: String
    var emojis: [String]
    var numPairs: Int
    
    init(color: String, name: String, emojis: [String], numPairs: Int) {
        self.color = color
        self.name = name
        self.emojis = emojis
        self.numPairs = numPairs > emojis.count ? emojis.count : numPairs
    }
    
    //This initializer uses a default numPairs count to the array.count (Extra Credit)
    init(color: String, name: String, emojis: [String]) {
        self.color = color
        self.name = name
        self.emojis = emojis
        self.numPairs = emojis.count - 1
    }
    
    func getThemeColor() -> Color {
        switch self.color {
        case "orange":
            return Color.orange
        case "purple":
            return Color.purple
        case "red":
            return Color.red
        case "gray":
            return Color.gray
        case "green":
            return Color.green
        case "black":
            return Color.black
        default:
            return Color.gray
        }
    }
    
    func getEmojis() -> [String] {
        return self.emojis
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getNumPairs() -> Int {
        return self.numPairs
    }
}

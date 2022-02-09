//
//  EmojiMemoryGame.swift
//  MemorizeV2
//
//  Created by Bridger Hildreth on 1/28/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static var themes: Array<Theme> = [
        Theme(color: "green", name: "Vehicles", emojis: ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚"], numPairs: 10),
        Theme(color: "purple", name: "Animals", emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷"], numPairs: 11),
        
        //Colors Theme generates in a special init that assumes default size/amount in the String array (Extra Credit)
        Theme(color: "gray", name: "Colors", emojis: ["❤️", "🧡","💛","💚","💙","💜","🖤","🤍","🤎","💖"]),
        
        //Emojis Theme generates a random number for the amount of pairs (Extra Credit)
        Theme(color: "black", name: "Emojis", emojis: ["😀","😃","😄","😁","😆","😅","😂","🤣","🥲","☺️","😊","😇","😩","🥸","😡","😭","😕","🥳","🧐"],numPairs: Int.random(in: 2...15)),
        Theme(color: "orange", name: "Foods", emojis: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥝","🥑","🍆"],numPairs: 13),
        Theme(color: "red", name: "Sports", emojis: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🏓","🏸","🏒","🥍","🏹"],numPairs: 12)
    ]
    
    
    
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.numPairs) { pairIndex in return theme.emojis[pairIndex] }
    }
    
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    var getThemeColor: Color {
        switch theme.color {
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
                       
    var themeName: String {
        return theme.name
    }
    
    var score: Int {
        return model.score
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func startNewGame(){
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}


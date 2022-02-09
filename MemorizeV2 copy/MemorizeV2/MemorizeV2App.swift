//
//  MemorizeV2App.swift
//  MemorizeV2
//
//  Created by Bridger Hildreth on 1/12/22.
//

import SwiftUI

@main
struct MemorizeV2App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

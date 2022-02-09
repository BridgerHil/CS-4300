//
//  ContentView.swift
//  MemorizeV2
//
//  Created by Bridger Hildreth on 1/12/22.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        Text("Memorize!\n" + viewModel.themeName + "\nScore: " + String(viewModel.score))
            .font(.largeTitle)
            .foregroundColor(Color.purple)
        
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum:65))]){
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            Button("New Game") {
                viewModel.startNewGame()
            }
        }
        .padding(.horizontal)
        .foregroundColor(viewModel.getThemeColor)
    }
}


struct CardView: View{
    let card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
              
                
            
            if card.isFaceUp{
            shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: 3)
                Text(card.content).font(.largeTitle).fontWeight(.heavy)
            } else if card.isMatched{
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
    




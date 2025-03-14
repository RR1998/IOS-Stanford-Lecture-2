//
//  ContentView.swift
//  Lecture 2
//
//  Created by Roberto Rubio on 26/2/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "👿"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            Text("Memorize!")
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View {
        HStack(){
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbols: String) -> some View {
        Button(action: {
            if (cardCount > 1) {
                cardCount += offset
            }
        }, label: {
            Image(systemName: symbols)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardWithEmoji(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.orange)
    }
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbols: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbols: "rectangle.stack.badge.plus.fill")
    }
}

struct CardWithEmoji: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack(){
            let base = RoundedRectangle(cornerRadius: 12)
             
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 12)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

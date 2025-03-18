//
//  ContentView.swift
//  Lecture 2
//
//  Created by Roberto Rubio on 26/2/25.
//

import SwiftUI

struct ContentView: View {
    let halloweenEmojis = ["👻", "🎃", "🕷️", "👿"]
    let animalEmojis = ["🐶","🐭","🐱","🦊"]
    let vehicleEmojis = ["🚗","🚕","🚙","🚌"]
    @State var selectedEmojis: Array<String> = ["👻", "🎃", "🕷️", "👿"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
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
            halloweenCardsButton
            Spacer()
            carsCardsButton
            Spacer()
            animalsCardsButton
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardThemeChanger(emojis: Array<String>) -> some View {
        Button(action: {
            selectedEmojis = emojis
        }, label: {
            Text(emojis[0])
        })
    }
    
    var halloweenCardsButton: some View {
        cardThemeChanger(emojis: halloweenEmojis)
    }
    
    var carsCardsButton: some View {
        cardThemeChanger(emojis: vehicleEmojis)
    }
    
    var animalsCardsButton: some View {
        cardThemeChanger(emojis: animalEmojis)
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardWithEmoji(content: selectedEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.orange)
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

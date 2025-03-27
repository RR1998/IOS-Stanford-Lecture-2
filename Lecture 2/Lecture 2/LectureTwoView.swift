//
//  ContentView.swift
//  Lecture 2
//
//  Created by Roberto Rubio on 26/2/25.
//

import SwiftUI

struct LectureTwoView: View {

    @ObservedObject var viewModel = LectureTwoViewModel()
    
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
    
    func cardThemeChanger(buttonTitle: String, emojis: Array<String>) -> some View {
        Button(action: {
            viewModel.onSelectedEmoji(emojis: emojis)
        }, label: {
            VStack{
                Text(emojis[0])
                Text(buttonTitle)
                    .font(.footnote)
            }
        })
    }
    
    var halloweenCardsButton: some View {
        cardThemeChanger(buttonTitle: "Halloween", emojis: viewModel.halloweenEmojis)
    }
    
    var carsCardsButton: some View {
        cardThemeChanger(buttonTitle: "Vehicle", emojis: viewModel.vehicleEmojis)
    }
    
    var animalsCardsButton: some View {
        cardThemeChanger(buttonTitle: "Animal", emojis: viewModel.animalEmojis)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(0..<viewModel.cardCount, id: \.self) { index in
                CardWithEmoji(content: viewModel.selectedEmojis[index])
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
    LectureTwoView()
}

//
//  ContentView.swift
//  Lecture 2
//
//  Created by Roberto Rubio on 26/2/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "👿"]
    var body: some View {
        VStack {
            Text("Memorize!")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            HStack {
                ForEach(emojis.indices, id: \.self) { index in
                    CardWithEmoji(content: emojis[index])
                }
            }.foregroundColor(.orange)
        }
        .padding()
    }
}


struct CardWithEmoji: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack(){
            let base = RoundedRectangle(cornerRadius: 12)
             
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 12)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

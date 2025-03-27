//
//  LectureTwoViewModel.swift
//  Lecture 2
//
//  Created by Roberto Rubio on 19/3/25.
//

import Foundation

class LectureTwoViewModel: ObservableObject {
    let halloweenEmojis = ["👻", "🎃", "🕷️", "👿","👻", "🎃", "🕷️", "👿"]
    let animalEmojis = ["🐶","🐭","🐱","🦊","🐶","🐭","🐱","🦊"]
    let vehicleEmojis = ["🚗","🚕","🚙","🚌","🚗","🚕","🚙","🚌"]
    @Published var selectedEmojis: Array<String> = ["👻", "🎃", "🕷️", "👿","👻", "🎃", "🕷️", "👿"]
    @Published var cardCount: Int = 7
    
    func onSelectedEmoji(emojis: Array<String>) {
        cardCount = emojis.count - 1
        selectedEmojis = emojis.shuffled()
    }
}

//
//  Decks.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-04.
//

import Foundation
import Blackbird

struct Decks: BlackbirdModel{
    //MARK: Storing property
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var Deck: String
    @BlackbirdColumn var New: Int
    @BlackbirdColumn var Learn: Int
    @BlackbirdColumn var Review: Int
    @BlackbirdColumn var Remembered: Int
    @BlackbirdColumn var Due: Int
    @BlackbirdColumn var Total: Int
    
}

let demonstration = [Decks(id: 1, Deck: "Alpha", New: 1, Learn: 2, Review: 3, Remembered: 4, Due: 6, Total: 10),Decks(id: 2, Deck: "Beta", New: 1, Learn: 2, Review: 3, Remembered: 4, Due: 6, Total: 10),Decks(id: 3, Deck: "Zeta", New: 0, Learn: 0, Review: 0, Remembered: 10, Due: 0, Total: 10)]

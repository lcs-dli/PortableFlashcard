//
//  Flashcards.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import Foundation
import Blackbird

struct Flashcards: BlackbirdModel{
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var Front: String
    @BlackbirdColumn var Back: String
    @BlackbirdColumn var Deckid: Int
    @BlackbirdColumn var Status: String
    @BlackbirdColumn var ReviewDate: Date
}

let cards = [Flashcards(id: 1, Front: "A", Back: "First letter in the alphabet", Deckid: 1, Status: "New", ReviewDate: Date())]

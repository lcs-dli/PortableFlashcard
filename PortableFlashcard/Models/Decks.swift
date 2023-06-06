//
//  Decks.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-04.
//

import Foundation
import Blackbird

struct Decks: Identifiable{
    //MARK: Storing property
    var uuID: UUID = UUID()
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var Deck: String
    @BlackbirdColumn var New: Int
    @BlackbirdColumn var Learn: Int
    @BlackbirdColumn var Review: Int
    @BlackbirdColumn var Remembered: Int
    
    var flashcards: [Flashcards]
    //MARK: Computing property
    var Due: Int{
        return New + Learn + Review
    }
    
    var Total: Int{
        return Due + Remembered
    }
    
    var cardsNeedToStudy: [Flashcards]{
        var hold: [Flashcards] = []
        for index in flashcards{
            if(index.Status != "Remembered"){
                hold.append(index)
            }
        }
        return hold
    }
}

let demonstration = [Decks(id: 1, Deck: "Alpha", New: 1, Learn: 2, Review: 3, Remembered: 4,flashcards: cards),Decks(id: 2, Deck: "Beta", New: 1, Learn: 2, Review: 3, Remembered: 4, flashcards: cards),Decks(id: 3, Deck: "Zeta", New: 0, Learn: 0, Review: 0, Remembered: 10, flashcards: cards)]

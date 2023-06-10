//
//  CombineDeck.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-06.
//

import Foundation

struct CombineDeck: Identifiable{
    var id = UUID()
    var deck: Decks
    var flashcards: [Flashcards]
    //MARK: Computing property
    var Due: Int{
        return deck.New + deck.Learn + deck.Review
    }
    
    var Total: Int{
        return Due + deck.Remembered
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

let demonstrationDeck: [CombineDeck] = [CombineDeck(deck: demonstration[0], flashcards: cards), CombineDeck(deck: demonstration[1], flashcards: cards),
CombineDeck(deck: demonstration[2], flashcards: cards)]

var cDeck: [CombineDeck] = []


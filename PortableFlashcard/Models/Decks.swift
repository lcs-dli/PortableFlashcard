//
//  Decks.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-04.
//

import Foundation
import Blackbird

struct Decks: Identifiable{
    var uuID: UUID = UUID()
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var deck: String
    @BlackbirdColumn var new: Int
    @BlackbirdColumn var learn: Int
    @BlackbirdColumn var review: Int
    @BlackbirdColumn var remembered: Int
    @BlackbirdColumn var total: Int
}

let demonstration = [Decks(id: 1, deck: "Alpha", new: 1, learn: 2, review: 3, remembered: 4, total: 10),Decks(id: 2, deck: "Beta", new: 1, learn: 2, review: 3, remembered: 4, total: 10),Decks(id: 3, deck: "Zeta", new: 1, learn: 2, review: 3, remembered: 4, total: 10)]

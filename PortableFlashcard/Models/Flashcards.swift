//
//  Flashcards.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import Foundation
import Blackbird

struct Flashcards{
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var front: String
    @BlackbirdColumn var back: String
    @BlackbirdColumn var deck: String
}

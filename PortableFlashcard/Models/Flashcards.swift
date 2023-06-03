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
    @BlackbirdColumn var front: Int
    @BlackbirdColumn var back: Int
    @BlackbirdColumn var deck: Int
}

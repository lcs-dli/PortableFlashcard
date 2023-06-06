//
//  FlashcardView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-05.
//

import SwiftUI

struct FlashcardView: View {
    //MARK: storing property
    let studyDeck: Decks
    //MARK: Computing property
    
    var body: some View {
        Text("Hello World")
        //show the front
       
    }
}

struct FlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardView(studyDeck: demonstration[0])
    }
}

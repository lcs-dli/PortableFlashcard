//
//  BrowseSetView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI
import Blackbird

struct BrowseSetView: View {
    //MARK: Storing property
    let DeckId: Int
    
    @BlackbirdLiveQuery var flashcards: Blackbird.LiveResults<Blackbird.Row>
    //MARK: Computing property
    var body: some View {
        //List for different status of flashcards
        
            ForEach(flashcards.results, id: \.self){ displayedCard in
                if let front = displayedCard["Front"]?.stringValue,
                   let back = displayedCard["Back"]?.stringValue,
                   let status = displayedCard["Status"]?.stringValue,
                   let reviewDate = displayedCard["ReviewDate"]?.stringValue{
                    
                    BrowseFlashcardView(front: front, back: back, status: status, reviewDate: reviewDate)
                }
                
            }
        
    }
    //MARK: Initializer(s)
    init(DeckId: Int) {
            
            // Initialize the live query
            _flashcards = BlackbirdLiveQuery(tableName: "Flashcards", { db in
                try await db.query("SELECT * FROM FlashcardsWithDeckNames WHERE Deckid = \(DeckId)")
            })
            
        self.DeckId = DeckId
            
        }
    
}

struct BrowseSetView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseSetView(DeckId: 1)
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}

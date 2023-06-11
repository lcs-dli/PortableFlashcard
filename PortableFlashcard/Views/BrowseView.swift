//
//  BrowseView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI
import Blackbird

struct BrowseView: View {
    //MARK: Storing property
    @BlackbirdLiveQuery(tableName: "Flashcards", {db in
        try await db.query("SELECT * FROM DeckWithDeckid")
    }) var decks
   
    
    @BlackbirdLiveQuery(tableName: "Flashcards", { db in
        try await db.query("SELECT * FROM FlashcardsWithDeckNames")
    }) var flashcards
    //MARK: Computing property
    
    var body: some View {
        NavigationView{
            List(){
                
                
                ForEach(decks.results, id: \.self){currentDeck in
                    Section(content: {
                        if let deckId = currentDeck["Deckid"]?.intValue{
                            BrowseSetView(DeckId: deckId)
                        }
                    }, header: {
                        if let deckName = currentDeck["Deck"]?.stringValue{
                            Text(deckName)
                        }
                    })
                    
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Browse")
        }
        
    }
        
    
}
    

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
        
    }
}

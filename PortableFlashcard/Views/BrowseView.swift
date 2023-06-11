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
    //var decks: [Decks]
    @BlackbirdLiveModels ({ db in
        try await Decks.read(from: db)
    }) var decks
    
    @BlackbirdLiveQuery(tableName: "Flashcards", { db in
        try await db.query("SELECT * FROM FlashcardsWithDeckNames")
    }) var flashcards
    //MARK: Computing property
    
    var body: some View {
        List(decks.results){ displayDeck in
            NavigationLink(destination: {
                BrowseSetView(selectedDeck: displayDeck, flashcards: findFlashcards(deckName: displayDeck.Deck))
            }, label: {
                HStack{
                    Text(displayDeck.Deck)
                    Spacer()
                    Text("\(displayDeck.Total)")
                }
                
            })
        }
    }
    
    //MARK: Function
    func findFlashcards(deckName: String) -> [Flashcards] {
        var hold: [Flashcards] = []
        for index in flashcards.results{
            if let id = index["id"]?.intValue,
                let front = index["Front"]?.stringValue,
                let back = index["back"]?.stringValue,
                let deck = index["Deck"]?.stringValue,
                let status = index["Status"]?.stringValue,
                let reviewDate = index["ReviewDate"]?.stringValue{
                if(deck == deckName){
                    hold.append(Flashcards(id: id, Front: front, Back: back, Deck: deck, Status: status, ReviewDate: reviewDate))
                }
            }
        }
        return hold
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            BrowseView()
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}

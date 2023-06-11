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
        NavigationView{
            List(){
                Text("A")
                Text("B")
                Text("C")
                }
            .navigationTitle("Browse")
            }
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

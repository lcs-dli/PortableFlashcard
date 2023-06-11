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
                Section(content: {
                    Text("A")
                    Text("B")
                }, header: {
                    Text("Group 1")
                })
                
                Section(content: {
                    Text("C")
                }, header: {
                    Text("Group 2")
                })
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

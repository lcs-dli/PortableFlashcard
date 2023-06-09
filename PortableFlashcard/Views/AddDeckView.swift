//
//  AddDeckView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-09.
//

import SwiftUI
import Blackbird

struct AddDeckView: View {
    //MARK: Storing property
    //Access to the connection of the database (needed to add a new record)
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    @State var deckName = ""
    //MARK: Computing property
    var body: some View {
        NavigationView{
            VStack{
                Text("Deck's name: ")
                
                TextField("", text: $deckName)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(5)
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    Button(action: {
                        addDeck()
                    }, label: {
                        Text("Add")
                    })
                }
            }
        }
        
    }
    
    //MARK: Functions
    
    func addDeck(){
        //Write to the database
        Task{
            try await db?.transaction{core in
                try core.query("""
                            INSERT INTO DECKS (
                                Deck,
                                New,
                                Learn,
                                Review,
                                Remembered
                                Due,
                                Total
                            )
                            VALUES(
                                (?),
                                (?),
                                (?),
                                (?),
                                (?),
                                (?),
                                (?)
                            )
                        """,
                        deckName,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0)
            }
        }
    }
}

struct AddDeckView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeckView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}

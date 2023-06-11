//
//  AddView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI
import Blackbird

struct AddView: View {
    //MARK: Storing property
    //Picker
    @State private var selectedDecks = 1
    @State private var defaultDeck = "Please select one deck"
    
    @BlackbirdLiveModels({db in
        try await Decks.read(from: db)
    }) var decks
    
    
    //Connect with database
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    //Front input and back input
    @State var front = ""
    @State var back = ""
    //MARK: Computing property
    var body: some View {
        
            VStack{
                Picker(selection: $selectedDecks, label: Text("Select a deck")){
                    Text(defaultDeck).tag(defaultDeck)
                    ForEach(decks.results){ index in
                        Text(index.Deck).tag(index.Deck)
                    }
                }
                .pickerStyle(.menu)
                Text("Front: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("", text: $front)
                Spacer()
                Text("Back: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("", text: $back)
                Spacer()
                //Button the add the flashcard
                Button(action: {
                    Task{
                        try await db!.transaction{ core in
                            try core.query("""
                                        INSERT INTO Flashcards (
                                            Front,
                                            Back,
                                            Status,
                                            Deckid,
                                            ReviewDate
                                        )
                                        VALUES(
                                            (?),
                                            (?),
                                            (?),
                                            (?),
                                            (?)
                                        )
                                        """,
                                            front,
                                            back,
                                            "New",
                                           selectedDecks,
                                           "2023-06-11"
                                            )
                            }
                        
                        front = ""
                        back = ""
                    }
                }, label: {
                    Text("Add")
                })
                .buttonStyle(.borderedProminent)
                //.frame(maxWidth: .infinity, alignment: .leading)
                
            
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}

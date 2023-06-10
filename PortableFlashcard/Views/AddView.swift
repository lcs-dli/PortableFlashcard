//
//  AddView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI

struct AddView: View {
    //MARK: Storing property
    //Picker
    @State private var selectedDecks = "Please select one deck"
    @State private var defaultDeck = "Please select one deck"
    @State var decks: [CombineDeck]
    //Picker unwrapp
    
    
    //Front input and back input
    @State var front = ""
    @State var back = ""
    //MARK: Computing property
    var body: some View {
        
            VStack{
                Picker(selection: $selectedDecks, label: Text("Select a deck")){
                    Text(defaultDeck).tag(defaultDeck)
                    ForEach(0..<decks.count){ index in
                        Text(decks[index].deck.Deck).tag(decks[index].deck.Deck)
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
        AddView(decks: demonstrationDeck)
    }
}

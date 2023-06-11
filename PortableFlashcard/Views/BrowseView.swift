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
    //MARK: Computing property
    
    var body: some View {
        List(decks.results){ displayDeck in
            NavigationLink(destination: {
                BrowseSetView(selectedDeck: displayDeck)
            }, label: {
                HStack{
                    Text(displayDeck.Deck)
                    Spacer()
                    Text("\(displayDeck.Total)")
                }
                
            })
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

//
//  BrowseView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI

struct BrowseView: View {
    //MARK: Storing property
    var decks: [CombineDeck]
    //MARK: Computing property
    
    var body: some View {
        List(decks){ displayDeck in
            NavigationLink(destination: {
                BrowseSetView(selectedDeck: displayDeck)
            }, label: {
                HStack{
                    Text(displayDeck.deck.Deck)
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
            BrowseView(decks: demonstrationDeck)
        }
    }
}

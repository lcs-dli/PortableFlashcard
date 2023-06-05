//
//  BrowseView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI

struct BrowseView: View {
    //MARK: Storing property
    var decks: [Decks]
    //MARK: Computing property
    
    var body: some View {
        List(decks){ displayDeck in
            NavigationLink(destination: {
                
            }, label: {
                HStack{
                    Text(displayDeck.deck)
                    Spacer()
                    Text("\(displayDeck.total)")
                }
                
            })
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView(decks: demonstration)
    }
}

//
//  BrowseSetView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI

struct BrowseSetView: View {
    //MARK: Storing property
    let selectedDeck: Decks
    //MARK: Computing property
    var body: some View {
        //List for different status of flashcards
        List{
            NavigationLink(destination: {
                
            }, label: {
                HStack{
                    Text("All")
                    Spacer()
                    Text("\(selectedDeck.Total)")
                }
                
            })
            NavigationLink(destination: {
                
            }, label: {
                HStack{
                    Text("New")
                    Spacer()
                    Text("\(selectedDeck.New)")
                }
            })
            NavigationLink(destination: {
                
            }, label: {
                HStack{
                    Text("Learn")
                    Spacer()
                    Text("\(selectedDeck.Learn)")
                }
            })
            NavigationLink(destination: {
                
            }, label: {
                HStack{
                    Text("Review")
                    Spacer()
                    Text("\(selectedDeck.Review)")
                }
            })
            NavigationLink(destination: {
                
            }, label: {
                HStack{
                    Text("Remembered")
                    Spacer()
                    Text("\(selectedDeck.Remembered)")
                }
            })
        }
    }
}

struct BrowseSetView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseSetView(selectedDeck: demonstration[1])
    }
}

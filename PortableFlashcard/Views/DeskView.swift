//
//  DeskView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI

struct DeskView: View {
    //MARK: Storing property
    //MARK: Computing property
    var body: some View {
        VStack{
            //title of the table
            HStack{
                Text("Deck")
                    .frame(width: 120)
                    .bold()
                Spacer()
                Text("New")
                    .frame(width: 90)
                    .foregroundColor(.blue)
                    .bold()
                Spacer()
                Text("Learn")
                    .foregroundColor(.red)
                    .bold()
                Spacer()
                Text("Review")
                    .frame(width: 100)
                    .foregroundColor(.green)
                    .bold()
            }
            //the actual table
            List(demonstration){ displayedDeck in
                if(displayedDeck.remembered != displayedDeck.total){
                    NavigationLink(destination: {
                        StudyView(studyDeck: displayedDeck)
                    }, label: {
                        HStack{
                            Text(displayedDeck.deck)
                            Spacer()
                            Text("\(displayedDeck.new)")
                                .foregroundColor(.blue)
                            Spacer()
                            Text("\(displayedDeck.learn)")
                                .foregroundColor(.red)
                            Spacer()
                            Text("\(displayedDeck.review)")
                                .foregroundColor(.green)
                        }
                    })
                }else{
                    NavigationLink(destination: {
                        FinishView()
                    }, label: {
                        HStack{
                            Text(displayedDeck.deck)
                            Spacer()
                            Text("\(displayedDeck.new)")
                                .foregroundColor(.blue)
                            Spacer()
                            Text("\(displayedDeck.learn)")
                                .foregroundColor(.red)
                            Spacer()
                            Text("\(displayedDeck.review)")
                                .foregroundColor(.green)
                        }
                    })
                }
                
            }
            Spacer()
            
            //button for add new item in the list
            Button(action: {
                
            }, label: {
                HStack{
                    Image(systemName: "plus")
                    Text("Create new deck")
                }
                
            })
            .buttonStyle(.borderedProminent)
        }
    }
}

struct DeskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TabView(selection: .constant(1)){
                DeskView()
                    .tabItem{
                        Image(systemName: "tablecells.fill")
                        Text("Desk")
                    }
                    .tag(1)
                AddView(decks: demonstration)
                    .tabItem{
                        Image(systemName: "plus.app.fill")
                        Text("Add")
                    }
                    .tag(2)
                BrowseView(decks: demonstration)
                    .tabItem{
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Browse")
                    }
                    .tag(3)
            }
        }
    }
}

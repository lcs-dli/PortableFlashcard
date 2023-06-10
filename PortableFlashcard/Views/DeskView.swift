//
//  DeskView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI
import Blackbird

struct DeskView: View {
    //MARK: Storing property
    @State var showAddDeckView = false
    //flashcards database
    
    
    @BlackbirdLiveQuery(tableName: "Flashcards", { db in
        try await db.query("SELECT * FROM FlashcardsWithDeckNames")
    }) var flashcards
    
    @BlackbirdLiveModels ({ db in
        try await Decks.read(from: db)
    }) var decks
    
    //MARK: Computing property
    var body: some View {
        NavigationView{
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
                
                
              /* List(demonstrationDeck){ displayedDeck in
                    if(displayedDeck.deck.Remembered != displayedDeck.Total){
                        NavigationLink(destination: {
                            StudyView(studyDeck: displayedDeck)
                        }, label: {
                            HStack{
                                Text(displayedDeck.deck.Deck)
                                Spacer()
                                Text("\(displayedDeck.deck.New)")
                                    .foregroundColor(.blue)
                                Spacer()
                                Text("\(displayedDeck.deck.Learn)")
                                    .foregroundColor(.red)
                                Spacer()
                                Text("\(displayedDeck.deck.Review)")
                                    .foregroundColor(.green)
                            }
                        })
                    }else{
                        NavigationLink(destination: {
                            FinishView()
                        }, label: {
                            HStack{
                                Text(displayedDeck.deck.Deck)
                                Spacer()
                                Text("\(displayedDeck.deck.New)")
                                    .foregroundColor(.blue)
                                Spacer()
                                Text("\(displayedDeck.deck.Learn)")
                                    .foregroundColor(.red)
                                Spacer()
                                Text("\(displayedDeck.deck.Review)")
                                    .foregroundColor(.green)
                            }
                        })
                    }
                    
                }*/
                List(decks.results){ displayedDeck in
                    if (displayedDeck.Due != 0){
                        NavigationLink(destination: {
                            StudyView(studyDeck: displayedDeck)
                        }, label: {
                            HStack{
                                Text(displayedDeck.Deck)
                                Spacer()
                                Text("\(displayedDeck.New)")
                                    .foregroundColor(.blue)
                                Spacer()
                                Text("\(displayedDeck.Learn)")
                                    .foregroundColor(.red)
                                Spacer()
                                Text("\(displayedDeck.Review)")
                                    .foregroundColor(.green)
                            }
                        })
                    } else{
                        NavigationLink(destination: {
                            FinishView()
                        }, label: {
                            HStack{
                                Text(displayedDeck.Deck)
                                Spacer()
                                Text("\(displayedDeck.New)")
                                    .foregroundColor(.blue)
                                Spacer()
                                Text("\(displayedDeck.Learn)")
                                    .foregroundColor(.red)
                                Spacer()
                                Text("\(displayedDeck.Review)")
                                    .foregroundColor(.green)
                            }
                        })
                    }
                }
                Spacer()
                
                //button for add new item in the list
                
            }
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    Button(action: {
                        showAddDeckView = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .sheet(isPresented: $showAddDeckView){
                        AddDeckView()
                            .presentationDetents([.fraction(0.3)])
                    }
                }
            }
        }
        
    }
    
    //MARK: Function
    func updateDatabase(){
        
        
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
                    .environment(\.blackbirdDatabase, AppDatabase.instance)
                AddView(decks: demonstrationDeck)
                    .tabItem{
                        Image(systemName: "plus.app.fill")
                        Text("Add")
                    }
                    .tag(2)
                    .environment(\.blackbirdDatabase, AppDatabase.instance)
                BrowseView(decks: demonstrationDeck)
                    .tabItem{
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Browse")
                    }
                    .tag(3)
                    .environment(\.blackbirdDatabase, AppDatabase.instance)
            }
        }
        
    }
}

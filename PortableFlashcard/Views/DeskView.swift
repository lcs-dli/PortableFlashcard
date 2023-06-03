//
//  DeskView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI

struct DeskView: View {
    var body: some View {
        VStack{
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
                Text("Due")
                    .frame(width: 110)
                    .foregroundColor(.green)
                    .bold()
            }
            List{
                NavigationLink(destination: {
                    
                }, label: {
                    HStack{
                        Text("DeckName")
                        Spacer()
                        Text("20")
                            .foregroundColor(.blue)
                        Spacer()
                        Text("10")
                            .foregroundColor(.red)
                        Spacer()
                        Text("3")
                            .foregroundColor(.green)
                    }
                })
            }
            Spacer()
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
        TabView(selection: .constant(1)){
            DeskView()
                .tabItem{
                    Image(systemName: "tablecells.fill")
                    Text("Desk")
                }
                .tag(1)
            AddView()
                .tabItem{
                    Image(systemName: "plus.app.fill")
                    Text("Add")
                }
                .tag(2)
            BrowseView()
                .tabItem{
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Browse")
                }
                .tag(3)
        }
    }
}

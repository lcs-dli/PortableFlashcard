//
//  PortableFlashcardApp.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI

@main
struct PortableFlashcardApp: App {
    var body: some Scene {
        WindowGroup {
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

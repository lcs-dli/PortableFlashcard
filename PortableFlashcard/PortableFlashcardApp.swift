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
                    .tag(1)
                AddView(decks: demonstration)
                    .tag(2)
                BrowseView(decks: demonstration)
                    .tag(3)
            }
        }
    }
}

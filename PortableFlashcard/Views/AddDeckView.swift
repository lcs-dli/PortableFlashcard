//
//  AddDeckView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-09.
//

import SwiftUI

struct AddDeckView: View {
    //MARK: Storing property
    @State var deckName = ""
    //MARK: Computing property
    var body: some View {
        VStack{
            Text("Deck's name: ")
            
            TextField("", text: $deckName)
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct AddDeckView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeckView()
    }
}

//
//  StudyView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI

struct StudyView: View {
    //MARK: Storing property
    let studyDeck: Decks
    //MARK: Computing property
    var body: some View {
        //if there is no cards for study
            VStack{
                HStack{
                    Text(studyDeck.deck)
                    VStack{
                        Text("New: \(studyDeck.new)")
                            .foregroundColor(.blue)
                        Text("Learn: \(studyDeck.learn)")
                            .foregroundColor(.red)
                        Text("Review: \(studyDeck.review)")
                            .foregroundColor(.green)
                    }
                }
                
                Spacer()
                
                //button for begin of study
                Button(action: {
                    
                }, label: {
                    HStack{
                        Text("Study Now")
                        Image(systemName: "arrow.forward")
                    }
                })
                .buttonStyle(.borderedProminent)
            }
        }
}

struct StudyView_Previews: PreviewProvider {
    static var previews: some View {
        StudyView(studyDeck: demonstration[0])
    }
}

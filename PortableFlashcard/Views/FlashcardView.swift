//
//  FlashcardView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-05.
//

import SwiftUI

struct FlashcardView: View {
    //MARK: storing property
    let studyDeck: CombineDeck
    
    @State var answerOpacity = 0.0
    //MARK: Computing property
    
    var body: some View {
        VStack{
            Text(studyDeck.cardsNeedToStudy[0].Front)
                .padding()
            
           
            
            Button(action: {
                answerOpacity = 1.0
            }, label: {
                HStack{
                    Image(systemName: "arrow.down")
                    Text("Show Answer")
                }
            })
            .padding()
            .opacity(1.0-answerOpacity)
            
     
            
            Text(studyDeck.cardsNeedToStudy[0].Back)
                .padding()
                .opacity(answerOpacity)
            
            HStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .opacity(answerOpacity)
                        .tint(.green)
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .opacity(answerOpacity)
                        .tint(.red)
                })
            }
        }
       
    }
}

struct FlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardView(studyDeck: demonstrationDeck[0])
    }
}

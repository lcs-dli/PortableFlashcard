//
//  StudyView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-03.
//

import SwiftUI

struct StudyView: View {
    //MARK: Storing property
    let new: Int
    let learn: Int
    let review: Int
    //MARK: Computing property
    var body: some View {
        //if there is no cards for study
        if((new + learn + review) == 0){
            
            
            Text("Congratulation, you have nothing to study for now! ")
            
        
        //if there is cards for study
        }else{
            VStack{
                HStack{
                    Text("Deckname")
                    VStack{
                        Text("New: \(new)")
                            .foregroundColor(.blue)
                        Text("Learn: \(learn)")
                            .foregroundColor(.red)
                        Text("Review: \(review)")
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
}

struct StudyView_Previews: PreviewProvider {
    static var previews: some View {
        StudyView(new: 0, learn: 0, review: 1)
    }
}

//
//  BrowseFlashcardView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-10.
//

import SwiftUI
import Blackbird

struct BrowseFlashcardView: View {
    //MARK: Storing property
    let front: String
    let back: String
    let status: String
    let reviewDate: String
    
    
    //MARK: Computing property
    var body: some View {
       
            
            HStack(alignment: .center){
                Text(front)
                
                Text(back)
                    
                Text(status)
                
                Text(reviewDate)
            }
            
            
            
        
    }
}

struct BrowseFlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseFlashcardView(front: "A", back: "First letter in the alphabet", status: "New", reviewDate: "2022-06-12")
    }
}

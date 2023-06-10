//
//  FinishView.swift
//  PortableFlashcard
//
//  Created by David Li on 2023-06-06.
//

import SwiftUI

struct FinishView: View {
    var body: some View {
        VStack{
            Text("Congratulation, you've finished the study for this desk! ")
                .bold()
                .font(.title)
                .padding()
            Text("Wait a few day for the next study to happen")
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}

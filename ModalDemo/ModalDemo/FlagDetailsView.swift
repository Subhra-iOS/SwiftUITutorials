//
//  FlagDetailsView.swift
//  ModalDemo
//
//  Created by Subhra Roy on 03/01/22.
//

import SwiftUI

struct FlagDetailsView: View {
    
    var flag: String = ""
    @Binding var country: String
    @Binding var isShown: Bool
    
    var body: some View {
        VStack{
            Text(self.flag)
                .font(.custom("Arial", size: 150))
                .padding()
            TextField("Enter country name", text: $country)
                .fixedSize()
                .font(.custom("Arial", size: 25))
                
            Button("Submit") {
                self.isShown.toggle()
            }
        }
    }
}

struct FlagDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FlagDetailsView(country: .constant("India"), isShown: .constant(true))
    }
}

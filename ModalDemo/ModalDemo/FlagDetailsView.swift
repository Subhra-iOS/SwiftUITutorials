//
//  FlagDetailsView.swift
//  ModalDemo
//
//  Created by Subhra Roy on 03/01/22.
//

import SwiftUI

struct FlagDetailsView: View {
    
    @Binding var flagVM: FlagViewModel
    
    var body: some View {
        VStack{
            Text(self.flagVM.flag)
                .font(.custom("Arial", size: 150))
                .padding()
            TextField("Enter country name", text: self.$flagVM.country)
                .fixedSize()
                .font(.custom("Arial", size: 25))
                
            Button("Submit") {
                self.flagVM.showModal.toggle()
            }
        }
    }
}

struct FlagDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FlagDetailsView(flagVM: .constant(FlagViewModel(flag: "", country: "", showModal: false)))
    }
}

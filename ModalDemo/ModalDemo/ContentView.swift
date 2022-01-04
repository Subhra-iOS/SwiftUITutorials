//
//  ContentView.swift
//  ModalDemo
//
//  Created by Subhra Roy on 03/01/22.
//

import SwiftUI

struct ContentView: View {
    
    let flags = ["🇮🇳","🇮🇱","🇪🇸","🇩🇪","🇺🇸","🇧🇷"]
    
    /*@State private var isOpen: Bool = false
    @State private var selectedFlag: String = ""
    @State private var country: String = ""*/
    
    @State private var flagViewModel: FlagViewModel = FlagViewModel(flag: "", country: "", showModal: false)
    
    var body: some View {
        List{
            Text(self.flagViewModel.country)
                .font(.custom("Arial", size: 30))
            
            /*ForEach(0..<self.flags.count) { index in
                
                HStack{
                    Text("\(self.flags[index])")
                        .font(.custom("Arial", size: 100))
                    Text("Flag index: \(index + 1)")
                }.gesture(TapGesture(count: 1)
                            .onEnded({ _  in
                                print("tap on flag")
                                self.isOpen.toggle()
                                self.selectedFlag = self.flags[index]
                            }))
            }*/
            
            ForEach(self.flags, id: \.self){ flag in
                
                HStack{
                    Text("\(flag)")
                        .font(.custom("Arial", size: 100))
                    Spacer()
                    
                }.gesture(TapGesture(count: 1)
                            .onEnded({ _  in
                                self.flagViewModel.flag = flag
                                self.flagViewModel.showModal.toggle()
                            }))
            }
            
        }.sheet(isPresented: self.$flagViewModel.showModal, content: {
            
            FlagDetailsView(flagVM: self.$flagViewModel)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

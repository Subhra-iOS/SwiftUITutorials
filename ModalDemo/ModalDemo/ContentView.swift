//
//  ContentView.swift
//  ModalDemo
//
//  Created by Subhra Roy on 03/01/22.
//

import SwiftUI

struct ContentView: View {
    
    let flags = ["🇮🇳","🇪🇸","🇩🇪","🇺🇸","🇮🇱","🇧🇷"]
    
    @State private var isOpen: Bool = false
    @State private var selectedFlag: String = ""
    @State private var country: String = ""
    
    var body: some View {
        List{
            Text(self.country)
                .font(.custom("Arial", size: 30))
            
            ForEach(0..<self.flags.count) { index in
                
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
            }
        }.sheet(isPresented: self.$isOpen, content: {
            /*Text("\(self.selectedFlag)")
                .font(.custom("Arial", size: 100))*/
            FlagDetailsView(flag: self.selectedFlag,
                            country: self.$country,
                            isShown: self.$isOpen)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

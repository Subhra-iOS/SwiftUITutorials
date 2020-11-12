//
//  ContentView.swift
//  GridSwiftUI
//
//  Created by Subhra Roy on 12/11/20.
//

import SwiftUI

struct ContentView: View {
    
    let animals = ["🐈","🐆","🦌","🦒","🦏","🐄","🐀","🦩","🦜"]
    @State private var sliderValue: CGFloat = 1.0
    
    var body: some View {
        NavigationView{
            VStack{
                Slider(value: $sliderValue, in: 1...10, step: 1) { _  in
                    
                }
                Text(String(format: "%.0f", self.sliderValue))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
//                List(self.animals, id: \.self){ 
//                    
//                }
               
            }.navigationBarTitle(Text("Animals"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

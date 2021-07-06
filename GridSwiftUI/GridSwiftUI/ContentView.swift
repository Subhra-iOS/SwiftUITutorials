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
                Slider(value: $sliderValue, in: 1...8, step: 1)
                Text(String(format: "%.0f", self.sliderValue))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                List(self.animals.chunks(size: Int(self.sliderValue)), id: \.self){ animalPair in
                    ForEach(animalPair, id: \.self) { (animal)  in
                        Text(animal)
                            .font(.system(size: CGFloat(300/self.sliderValue)))
                    }
                }
               
            }.navigationBarTitle(Text("Animals"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

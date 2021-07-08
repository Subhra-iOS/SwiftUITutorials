//
//  ContentView.swift
//  StateBindingDemo
//
//  Created by Subhra Roy on 07/07/21.
//

import SwiftUI

struct ContentView: View {
    let models = Dishes.all()
    @State private var isSpiecy: Bool = false
    @State private var isToggleEnable: Bool = false
    
    var body: some View {
        VStack{
            Toggle(isOn: $isSpiecy) {
                Text("Spiecy")
                    .font(.title)
            }
            List{
                ForEach(isToggleEnable ? models.filter{ $0.isSpiecy == self.isSpiecy } : models) { dish in
                    HStack{
                        Image(dish.imageUrl)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                        Text(dish.name)
                            .font(.title)
                            .lineLimit(nil)
                        Spacer()
                        if dish.isSpiecy {
                            Image("spicy-icon")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .scaledToFit()
                        }
                    }
                }
            }
            
            Button(action: didTapOnEnable) {
                Text("Enable")
                    .font(.largeTitle)
            }
        }
    }
    
    private func didTapOnEnable(){
        self.isToggleEnable = !self.isToggleEnable
        self.isSpiecy = self.isToggleEnable
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

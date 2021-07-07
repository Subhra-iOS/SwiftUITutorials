//
//  ContentView.swift
//  GridDemo
//
//  Created by Subhra Roy on 07/07/21.
//

import SwiftUI

struct ContentView: View {
    let dishes = Dish.allDishes()
    @State private var name: String = "Subhra"
    
    var body: some View {
        let chunkedDishes = dishes.chunked(into: 2)
        VStack {
            Text(name)
                .font(.largeTitle)
            Button(action: {
                name = "My Company"
            }, label: {
                Text("Click")
                    .font(.largeTitle)
            })
            List{
                ForEach(0..<chunkedDishes.count){ index in
                    HStack{
                        ForEach(chunkedDishes[index]) { dish  in
                            Image(dish.imgUrl)
                                .resizable()
                                //.frame(width: 110, height: 110)
                                .scaledToFit()
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/* List{
 ForEach(0..<5) {  _ in
 HStack{
 ForEach(0..<2){ _ in
 Image("e2")
 .resizable()
 .scaledToFit()
 }
 }
 }
 }*/

//
//  ContentView.swift
//  SwiftTutorial
//
//  Created by Subhra Roy on 25/09/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center){
            Image("costa-rica")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20.0)
                .padding(.all)
                //.clipShape(Circle())
            Text("First Line")
                .font(.largeTitle)
                .foregroundColor(.green)
            Text("Second Line")
                .font(.title)
                .foregroundColor(.orange)
            HStack{
                Text("Left Side")
                    .font(.headline)
                    .foregroundColor(.blue)
                Text("Right Side")
                    .font(.headline)
                    .foregroundColor(.pink)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

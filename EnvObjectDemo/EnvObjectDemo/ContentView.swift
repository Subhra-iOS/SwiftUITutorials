//
//  ContentView.swift
//  EnvObjectDemo
//
//  Created by Subhra Roy on 08/07/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var settings = UserSettings()
    
    var body: some View {
        VStack{
            Text("\(self.settings.score)")
                .font(.largeTitle)
                .padding()
                .background(Color.orange)
            Button("Increment score") {
                self.settings.score += 1
            }.padding()
            .background(Color.blue)
            .foregroundColor(.white)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

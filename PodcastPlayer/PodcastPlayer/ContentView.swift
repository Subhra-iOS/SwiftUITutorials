//
//  ContentView.swift
//  PodcastPlayer
//
//  Created by Subhra Roy on 08/07/21.
//

import SwiftUI

struct ContentView: View {
    
    let episode = Episode(name: "Macbreak Weekly", track: "WWDC 2021")
    @State private var isPlaying: Bool = false
    @ObservedObject private var fancyTimer = FancyTimer()
    
    var body: some View {
        VStack{
            Text("\(self.fancyTimer.value)")
                .font(.largeTitle)
                .foregroundColor(.red)
            Text(episode.name)
                .font(.title)
                .foregroundColor(self.isPlaying ? .green : .black)
            Text(episode.track)
                .font(.subheadline)
                .padding(10)
            PlayButton(isPlayEnable: $isPlaying)
        }
    }
}

struct PlayButton: View {
    @Binding var isPlayEnable: Bool
    var body: some View{
        Button(action: {
            self.isPlayEnable.toggle()
        }, label: {
            Text("Play")
        }).padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

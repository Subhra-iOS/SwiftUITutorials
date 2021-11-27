//
//  ContentView.swift
//  ImageDemo
//
//  Created by Subhra Roy on 27/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Spacer()
        VStack{
            ImageDownloaderView("https://m.media-amazon.com/images/M/MV5BOGZmYzVkMmItM2NiOS00MDI3LWI4ZWQtMTg0YWZkODRkMmViXkEyXkFqcGdeQXVyODY0NzcxNw@@._V1_SX300.jpg",
                                "placeholder-image")
        }
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

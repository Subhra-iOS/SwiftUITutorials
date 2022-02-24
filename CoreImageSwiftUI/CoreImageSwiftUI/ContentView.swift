//
//  ContentView.swift
//  CoreImageSwiftUI
//
//  Created by Subhra Roy on 11/02/22.
//

import SwiftUI
import CoreML
import UIKit

struct ContentView: View {
    
    private let images = ["cat1", "dog", "tree", "mountains"]
    @State private var selectedImage = ""
        
    @ObservedObject private var viewModel: ImageDetectionViewModel
    
    init() {
        self.viewModel = ImageDetectionViewModel(manager: ImageDetectionManager(model: Resnet50()), predictionLabel: "")
    }
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal, showsIndicators: true, content: {
                    HStack{
                        ForEach(images, id: \.self) { item in
                            Image(item)
                                .resizable()
                                .frame(width: 300, height: 300)
                                .padding()
                                .onTapGesture {
                                    self.selectedImage = item
                                }.border(Color.blue, width: self.selectedImage == item ? 10 : 0)
                        }
                    }
                })
                
                Button(action: {
                    self.viewModel.detect(name: self.selectedImage)
                }, label: {
                    Text("Setect")
                })
                .padding()
                .frame(width: 100, height: 44, alignment: .center)
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10.0)
                
                Text(self.viewModel.updatedLabel)
                    .padding()
            }
            .navigationBarTitle("Core ML")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

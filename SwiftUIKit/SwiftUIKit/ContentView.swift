//
//  ContentView.swift
//  SwiftUIKit
//
//  Created by Subhra Roy on 24/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShwonPicker: Bool = false
    @State private var pickedImage: Image?
    
    var body: some View {
        VStack{
            
            pickedImage?.resizable()
                .scaledToFit()
            
            Button(action: {
                self.isShwonPicker = true
            }, label: {
                Text("Open Camera")
            }).padding()
            .background(Color.green)
            .foregroundColor(Color.white)
            .cornerRadius(10.0)
            
        }.sheet(isPresented: self.$isShwonPicker, content: {
            PhotoCaptureView(isPickerShown: self.$isShwonPicker, captureImage: self.$pickedImage)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

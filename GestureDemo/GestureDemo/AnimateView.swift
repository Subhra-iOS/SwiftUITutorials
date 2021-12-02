//
//  AnimateView.swift
//  GestureDemo
//
//  Created by Subhra Roy on 02/12/21.
//

import SwiftUI

struct AnimateView: View {
    
    let isToggle: Bool
    
    @State private var zoomLevel: CGFloat = 1.0
    @State private var rotatingAngle: Double = 0.0
    
    var body: some View {
       VStack{
            Image("cat")
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
                .scaleEffect(self.zoomLevel)
                .gesture(MagnificationGesture()
                        .onChanged({ value in
                            self.zoomLevel = value.magnitude
                        })
                )
                .rotationEffect(Angle(degrees: self.rotatingAngle))
                .gesture(RotationGesture()
                        .onChanged({ angle in
                            self.rotatingAngle = angle.degrees
                        })
                        .onEnded({ _ in
                            self.rotatingAngle = 0.0
                        })
                )
            Text("Hello, World!")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0 , maxHeight: .infinity)
       .background(self.isToggle ? Color.green : Color.purple)
       .cornerRadius(20.0)
    }
}

struct AnimateView_Previews: PreviewProvider {
    static var previews: some View {
        AnimateView(isToggle: false)
    }
}

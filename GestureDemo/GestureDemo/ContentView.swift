//
//  ContentView.swift
//  GestureDemo
//
//  Created by Subhra Roy on 02/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isTapped: Bool = false
    @State private var verticalDragDelta: CGFloat = 0.0
    
    var body: some View {
        AnimateView(isToggle: self.isTapped)
            .animation(.spring())
            .gesture(TapGesture(count: 1)
                    .onEnded({ () in
                        print("Tapped")
                        self.isTapped.toggle()
                    })
            )
            .offset(y: self.verticalDragDelta)
            .gesture(DragGesture()
                    .onChanged({ value in
                        self.verticalDragDelta = value.translation.height
                    })
                    .onEnded({ _ in
                        self.verticalDragDelta = 0.0
                    })
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

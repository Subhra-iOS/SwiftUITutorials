//
//  HikeDetails.swift
//  Hiking
//
//  Created by Subhra Roy on 19/10/20.
//

import SwiftUI

struct HikeDetails: View {
    
    let hike: Hike
    @State private var zoomed: Bool = false
    
    var body: some View {
        VStack{
            Image(hike.imageUrl)
                .resizable()
                .aspectRatio(contentMode: self.zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        self.zoomed.toggle()
                    }
                }
            Text(hike.name)
                .font(.title)
            Text(String(format: "%0.2f miles", hike.miles))
        }
    }
}

struct HikeDetails_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetails(hike: Hike(name: "Angle Hikie", imageUrl: "tam", miles: 10.0))
    }
}

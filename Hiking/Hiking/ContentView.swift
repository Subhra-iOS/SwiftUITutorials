//
//  ContentView.swift
//  Hiking
//
//  Created by Subhra Roy on 05/10/20.
//

import SwiftUI

struct ContentView: View {
    
    let hikes = Hike.all()
    var body: some View {
        NavigationView{
            List(self.hikes, id: \.name) { hike in
                NavigationLink(destination: HikeDetails(hike: hike),
                    label: {
                        HikeCell(hike: hike)
                })
            }
            .navigationTitle("Hikings")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HikeCell: View {
    
    let hike: Hike
    var body: some View {
        HStack{
            Image(hike.imageUrl)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(10.0)
            VStack(alignment: .leading){
                Text(hike.name)
                    .font(.title2)
                Text(String(format: "%0.2f miles", hike.miles))
            }
        }
    }
}

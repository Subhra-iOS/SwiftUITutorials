//
//  ContentView.swift
//  NotificationDemo
//
//  Created by Subhra Roy on 03/01/22.
//

import SwiftUI

struct ContentView: View {
    
    private var images = ["🗾","🌅","🌄","🌠","🎇","🌇","🗾","🌅","🌄","🌠","🎇","🌇"]
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("")) {
                    HStack{
                        Text("Show Previews")
                        Spacer()
                        NavigationLink(
                            destination: Text(""),
                            label: {
                                Text("Always")
                                    .foregroundColor(.gray)
                        })
                        .fixedSize()
                    }
                }
                
                Section(header: Text("Notification previews will be shown whether the iPhone is locked or unlocked")
                            .foregroundColor(.gray)
                            .padding()
                            .lineLimit(nil)) {
                    NavigationLink(
                        destination: Text(""),
                        label: {
                            Text("Siri Suggestions")
                        })
                }
                
                Section(header: VStack(alignment: .leading){
                    Text("Choose while app can suggest shortcuts on the lock screen")
                        .padding()
                        .lineLimit(nil)
                    Text("NOTIFICATION STYLE").padding()
                }.foregroundColor(.gray)) {
                    
                    ForEach(images, id: \.self) { item  in
                        NavigationLink(
                            destination: Text(""),
                            label: {
                                CellView(item: NotificationItem(icon: item, title: "Placeholder"))
                            })
                    }
                }
            }
            .navigationBarTitle("Notification settings", displayMode: .inline).padding()
        }
    }
}

struct CellView: View {
    
    let item: NotificationItem
    var body: some View {
        HStack{
            Text("\(item.icon)")
            Text("\(item.title)")
        }
    }
}

struct NotificationItem {
    let icon: String
    let title: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

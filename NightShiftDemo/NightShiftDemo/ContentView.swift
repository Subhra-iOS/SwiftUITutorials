//
//  ContentView.swift
//  NightShiftDemo
//
//  Created by Subhra Roy on 10/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var schedule: Bool = false
    @State private var manuallyEnable: Bool = false
    @State private var colorTeperature: CGFloat = 0.5
    
    private var images = ["🗾","🌅","🌄","🌠","🎇","🌇","🗾","🌅","🌄","🌠","🎇","🌇"]
    
    var body: some View {
        NavigationView{
            
            Form{
                Section(header: Text("Night shift automaltically shift    colors Night shift automaltically shift colors Night shift automaltically shift colors Night shift automaltically shift colors")
                            .font(.system(size: 15.0))
                            .padding()
                            .lineLimit(nil)) {
                    Toggle(isOn: $schedule, label: {
                        Text("Scheduled")
                    })
                    
                    HStack{
                        VStack{
                            Text("From")
                            Text("To")
                        }
                        
                        Spacer()
                        
                        NavigationLink(
                            destination: Text("Schedule settings"),
                            label: {
                                
                                VStack{
                                    Text("Sunset")
                                    Text("Sunrise")
                                }.foregroundColor(.blue)
                                
                        }).fixedSize()
                    }
                }
                
                Section(header: Text("").padding(2)) {
                    Toggle(isOn: $manuallyEnable, label: {
                        Text("Manually Enable Untill Tomorrow")
                    })
                }
                
                Section(header: Text("COLOR TEMPERATURE")) {
                    HStack{
                        Text("Less Warm")
                        Slider(value: $colorTeperature)
                        Text("More Warm")
                    }
                }
                Section(header: Text("List")) {
                    ForEach(self.images, id: \.self) { img  in
                        NavigationLink(
                            destination: Text("Destination"),
                            label: {
                                ListCellView(item: img)
                            })
                    }
                }
            }
            .navigationBarTitle("Night shift settings", displayMode: .inline).padding()
        }
    }
}


struct ListCellView: View {
    let item: String
    
    var body: some View {
        HStack{
            Text(item).font(.largeTitle).padding(5)
            Text("Placeholder").padding(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Subhra Roy on 10/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    init() {
        self.weatherViewModel = WeatherViewModel(service: WeatherService())
    }
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter city name", text: self.$weatherViewModel.cityName, onCommit: {
                self.weatherViewModel.search()
            }).font(.custom("Arial", size: 50))
            .padding()
            .fixedSize()
            
            Text("Temp: \(self.weatherViewModel.temperature)")
                .font(.custom("Arial", size: 50))
                .foregroundColor(.white)
                .offset(y: 50)
                .padding()
            Text("Humidity: \(self.weatherViewModel.humidity)")
                .font(.custom("Arial", size: 50))
                .foregroundColor(.white)
                .offset(y: 50)
                .padding()
            
        }.frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
        .background(Color.yellow)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  BarGraphDemo
//
//  Created by Subhra Roy on 01/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       // DummyFigure()
        BarGraph(reports: Report.all())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DummyFigure: View {
    var body: some View{
        return VStack{
                Spacer()
                Circle()
                    .fill(Color.red)
                    .frame(width: 150, height: 150, alignment: .center)
                Spacer()
                Circle()
                    .stroke(Color.green, lineWidth: 10)
                    .frame(width: 150, height: 150, alignment: .center)
                Spacer()
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 100, height: 200, alignment: .center)
                Spacer()
        }
    }
}

//
//  GraphView.swift
//  BarGraphDemo
//
//  Created by Subhra Roy on 01/12/21.
//

import Foundation
import SwiftUI

struct GraphView: View {
    
    let report: Report
    @State private var showGraph: Bool = false
    
    var body: some View{
        
        let value = report.revenue / 500
        let yValue = Swift.min(value*20, 500)
        
        return VStack {
            Text(String(format: "$%.2f", report.revenue))
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: self.showGraph ? CGFloat(yValue) : 0.0)
                .onAppear{
                    withAnimation(.default) {
                        self.showGraph = true
                    }
                }
            Text(report.year)
        }
        
    }
}

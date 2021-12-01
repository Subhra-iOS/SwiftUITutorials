//
//  BarGraph.swift
//  BarGraphDemo
//
//  Created by Subhra Roy on 01/12/21.
//

import Foundation
import SwiftUI

struct BarGraph: View {
    let reports: [Report]
    
    var body: some View{
        VStack{
            HStack(alignment: .lastTextBaseline){
                ForEach(self.reports, id: \.year) { report  in
                    GraphView(report: report)
                }
            }
        }
    }
}

struct BarGraph_Preview: PreviewProvider {
        
    static var previews: some View{
        BarGraph(reports: Report.all())
    }
    
}


//
//  OrderTotalView.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 23/11/21.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format:"$%.2f", self.total))
                .font(.title)
                .foregroundColor(.green)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            OrderTotalView(total: 15.25).previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .large)
            OrderTotalView(total: 15.25).previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .extraLarge)
            OrderTotalView(total: 15.25).previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .extraExtraLarge)
        }
    }
}

//
//  OrderListView.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 15/11/21.
//

import SwiftUI

struct OrderListView: View {
    
    private let orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    var body: some View {
        List{
            ForEach(self.orders, id: \.id){ order in
                HStack{
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .leading)
                        .cornerRadius(15.0)
                    VStack{
                        Text(order.name)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0))
                        HStack{
                            Text(order.coffeeName)
                                .font(.body)
                                .padding(EdgeInsets(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0))
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10.0)
                            Text(order.size)
                                .font(.body)
                                .padding(EdgeInsets(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0))
                                .background(Color.yellow)
                                .foregroundColor(.red)
                                .cornerRadius(10.0)
                        }
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Order(name: "Subhra", size: "Large", coffeeName: "Cappuccino", total: 3.0))])
    }
}

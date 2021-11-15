//
//  ContentView.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 11/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListViewModel: OrderListViewModel = OrderListViewModel(service: Webservice())
    
    var body: some View {
        NavigationView{
            OrderListView(orders: self.orderListViewModel.orders)
            .navigationBarTitle("Coffee orders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

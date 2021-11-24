//
//  ContentView.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 11/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListViewModel: OrderListViewModel = OrderListViewModel(service: Webservice())
    
    @State private var showAddCoffeeView: Bool = false
    
    var body: some View {
        NavigationView{
            OrderListView(orders: self.orderListViewModel.orders)
            .navigationBarTitle("Coffee orders")
                .navigationBarItems(leading: Button(action: reloadOrders, label: {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                }), trailing: Button(action: showAddCoffeOrderView, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                }))
            .sheet(isPresented: $showAddCoffeeView, content: {
                AddCoffeeOrderView(isShowModal: $showAddCoffeeView)
            })
        }
    }
    
    private func reloadOrders(){
        self.orderListViewModel.getAllOrders()
    }
    
    private func showAddCoffeOrderView(){
        self.showAddCoffeeView = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

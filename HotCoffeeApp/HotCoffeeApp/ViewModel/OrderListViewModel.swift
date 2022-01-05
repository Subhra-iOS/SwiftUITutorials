//
//  OrderListViewModel.swift
//  HotCoffeeApp
//
//  Created by Subhra Roy on 05/01/22.
//

import Foundation
import SwiftUI
import Combine
import CoreData

class  OrderListViewModel: ObservableObject{
    let dbManager: CoreDataManager
    @Published var orders: [OrderViewModel] = [OrderViewModel]()
    
    init(dbManager: CoreDataManager){
        self.dbManager = dbManager
        self.fetchAllOrders()
    }
   
    
    private func fetchAllOrders(){
        guard let orders = self.dbManager.fetchAllOrders() else{
            return
        }
        self.orders = orders.compactMap(OrderViewModel.init)
        print("\(String(describing: self.orders))")
    }
    
}

class OrderViewModel{
    
    let name: String
    let type: String
    
    init(order: Order) {
        self.name = order.customerName ?? ""
        self.type = order.coffeeType ?? ""
    }
    
}

extension OrderViewModel: Hashable {
    static func == (lhs: OrderViewModel, rhs: OrderViewModel) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(type)
    }
}
 

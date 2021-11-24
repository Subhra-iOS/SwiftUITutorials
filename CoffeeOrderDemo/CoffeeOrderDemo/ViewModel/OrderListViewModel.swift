//
//  OrderListViewModel.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 15/11/21.
//

import Foundation

struct OrderViewModel {
    private let order: Order
    let id: String
    
    init(identifier: String = UUID().uuidString,
        order: Order) {
        self.id = identifier
        self.order = order
    }
    
    var name: String{
        return self.order.name
    }
    
    var size: String{
        return self.order.size
    }
    
    var coffeeName: String{
        return self.order.coffeeName
    }
    
    var totalPrice: Double{
        return self.order.total
    }
}

class OrderListViewModel: ObservableObject {
    
    private let service: Webservice
    @Published var orders: [OrderViewModel] = [OrderViewModel]()
    
    init(service: Webservice) {
        self.service = service
        self.fetchAllOrders()
    }
    
    private func fetchAllOrders() -> Void{
        self.service.getAllOrders { (result) in
            switch result{
                case .success(let orderList):
                    self.orders = orderList.map({ (order) -> OrderViewModel in
                        return OrderViewModel(order: order)
                    })
                case .failure(let error): print("Error type:\(error)")
            }
        }
    }
    
    func getAllOrders(){
        self.fetchAllOrders()
    }
}

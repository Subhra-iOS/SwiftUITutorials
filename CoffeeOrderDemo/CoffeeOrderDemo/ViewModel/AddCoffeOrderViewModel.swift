//
//  AddCoffeOrderViewModel.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 22/11/21.
//

import Foundation
import Combine

class AddCoffeOrderViewModel: ObservableObject {
    
    private let webService: Webservice
    private let addCoffeModels : [AddCoffeeModel]
    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    var name: String = ""
    @Published var coffeName: String = ""
    @Published var size: String = "Medium"
    
    
    init(service: Webservice, coffeList: [Coffee]) {
        self.webService = service
        self.addCoffeModels = coffeList.map({ (coffee) -> AddCoffeeModel in
            return AddCoffeeModel(name: coffee.name, imageUrl: coffee.imageUrl, price: coffee.price)
        })
    }
    
    private var calculatePrice: Double {
        if let model: AddCoffeeModel = self.addCoffeModels.first(where: { $0.name == coffeName }) {
            return model.price * priceToSize()
        }else{
            return 0.0
        }
    }
    
    private func priceToSize()-> Double {
        let sizes = ["small": 2.0, "medium": 3.0, "large": 4.0]
        return sizes[size] ?? 0.0
    }
    
    func placeCoffeOrder(){
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeName, total: self.calculatePrice)
        do{
            try self.webService.postCoffee(order: order)
                .receive(on: DispatchQueue.main)
                .decode(type: OrderResponse.self, decoder: JSONDecoder())
                .sink { (completion) in
                    switch completion{
                        case .finished: print("Done")
                        case  .failure(let error):
                            print("Error:\(error)")
                    }
                } receiveValue: { (response) in
                    if response.success { print("Order placed successfully")}
                }.store(in: &cancellable)
        }catch let error{
            print("\(error)")
        }

    }
    
}

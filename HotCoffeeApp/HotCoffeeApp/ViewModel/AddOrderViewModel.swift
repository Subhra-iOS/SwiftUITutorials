//
//  AddOrderViewModel.swift
//  HotCoffeeApp
//
//  Created by Subhra Roy on 05/01/22.
//

import Foundation

class AddOrderViewModel{
    
    let dbManager: CoreDataManager
    init(dbManager: CoreDataManager){
        self.dbManager = dbManager
    }
    
    var userName: String = ""
    var coffeeType: String = ""
    
    func saveOrder(on complete: @escaping(_ status: Bool) -> ()){
        self.dbManager.save(user: userName,
                            choice: coffeeType) { state in
            complete(state)
        }
    }
}

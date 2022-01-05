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
    
    func saveOrder(){
        self.dbManager.save(user: userName, choice: coffeeType)
    }
}

//
//  Webservice.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 14/11/21.
//

import Foundation

enum ServiceError: Error {
    case invalid
    case noData
}

struct Webservice {
    
    func getAllOrders(completion: @escaping (Swift.Result<[Order]?,ServiceError>) -> ()) -> Void{
        guard let url = URL(string: "") else {
            completion(.failure(.noData))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.invalid))
                return
            }
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            completion(.success(orders))
        }.resume()
    }
}

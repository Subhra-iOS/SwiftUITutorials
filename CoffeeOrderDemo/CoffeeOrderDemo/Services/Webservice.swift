//
//  Webservice.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 14/11/21.
//

import Foundation
import Combine

enum ServiceError: Error {
    case invalid
    case noData
    case badRequest
}

enum RemoteResponse<T, ServiceError>{
    case success(T)
    case failure(ServiceError)
}

struct Webservice {
    
    func getAllOrders(completion: @escaping (Swift.Result<[Order],ServiceError>) -> ()) -> Void{
        guard let url = URL(string: Service.fetch("orders").url) else {
            DispatchQueue.main.async {
                completion(.failure(.noData))
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.invalid))
                }
                return
            }
            if let orders = try? JSONDecoder().decode([Order].self, from: data){
                DispatchQueue.main.async{
                    completion(.success(orders))
                }
            }else{
                DispatchQueue.main.async {
                    completion(.failure(.invalid))
                }
            }
        }.resume()
    }
    
    func postCoffee(order: Order) throws -> Future<Data,ServiceError>{
        guard let url: URL = URL(string: Service.post("orders").url) else{
            throw ServiceError.badRequest
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let jsonBody = try? JSONEncoder().encode(order) else {
            throw ServiceError.badRequest
        }
        request.httpBody = jsonBody
        return Future{ promise in
            URLSession.shared.dataTask(with: request){ data, response, error in
                guard let data = data, error == nil else {
                    promise(.failure(.noData))
                    return
                }
                promise(.success(data))
            }.resume()
        }
    }
}

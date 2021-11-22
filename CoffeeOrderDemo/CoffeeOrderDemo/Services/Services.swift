//
//  Services.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 22/11/21.
//

import Foundation

enum API{
    enum URL{
        static let baseUrl = "https://glimmer-scratch-cartoon.glitch.me/"
    }
}

protocol ServiceProtocol {
    var url: String { get }
}

enum Service{
    case fetch(String)
    case post(String)
}

extension Service: ServiceProtocol{
    var url: String {
        switch self {
            case .fetch(let uri):
                return API.URL.baseUrl + uri
            case .post(let uri):
                return API.URL.baseUrl + uri
        }
    }

}

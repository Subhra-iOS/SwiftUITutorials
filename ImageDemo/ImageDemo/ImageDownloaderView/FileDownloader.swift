//
//  FileDownloader.swift
//  ImageDemo
//
//  Created by Subhra Roy on 27/11/21.
//

import Foundation
import Combine

class FileDownloader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func loadData(from url: String){
        guard let _url: URL = URL(string: url) else {
            self.downloadedData = nil
            return
        }
        
        URLSession.shared.dataTask(with: _url) { (data, _, error) in
            
            guard let data = data, error == nil else {
                self.downloadedData = nil
                return
            }
            self.downloadedData = data
        }.resume()
    }
    
}

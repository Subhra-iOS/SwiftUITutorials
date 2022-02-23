//
//  ImageDetectionViewModel.swift
//  CoreImageSwiftUI
//
//  Created by Subhra Roy on 23/02/22.
//

import Foundation
import SwiftUI
import Combine

class ImageDetectionViewModel: ObservableObject{
    var name: String = ""
    let manager: ImageDetectionManager
    @Published private var predictedLabel: String
    
    init(manager: ImageDetectionManager,
         predictionLabel: String = "") {
        self.manager = manager
        self.predictedLabel = predictionLabel
    }
    
    func detect(name: String){
        //resize the image
        
        
        //detect the image
        
        //update the prediction label with prediction value
    }
}

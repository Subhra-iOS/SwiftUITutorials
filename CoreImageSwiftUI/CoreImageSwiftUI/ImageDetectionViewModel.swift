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
    
    var updatedLabel: String{
        return self.predictedLabel
    }
    
    func detect(name: String){
        //resize the image
        guard let image: UIImage = UIImage(named: name),
              let resizeImg: UIImage = image.resizeImage(targetSize: CGSize(width: 224.0, height: 224.0)) else {
            fatalError("Unable to resize image")
        }
        //detect the image
        guard let lable = self.manager.detect(image: resizeImg) else {
            return
        }
        self.predictedLabel = lable
        //update the prediction label with prediction value
    }
}

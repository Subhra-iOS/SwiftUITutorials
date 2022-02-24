//
//  ImageDetectionManager.swift
//  CoreImageSwiftUI
//
//  Created by Subhra Roy on 23/02/22.
//

import Foundation
import CoreML
import UIKit

struct ImageDetectionManager{
    
    let model: Resnet50
    init(model: Resnet50) {
       
        self.model = model
    }
    
    
    func detect(image: UIImage) -> String?{
        guard let pixelBuffer = image.toCVPixelBuffer(),
              let prediction = try? model.prediction(image: pixelBuffer) else {
            return nil
        }
        return prediction.classLabel
    }
    
}

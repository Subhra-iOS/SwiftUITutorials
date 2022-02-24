//
//  PhotoCaptureView.swift
//  SwiftUIKit
//
//  Created by Subhra Roy on 24/02/22.
//

import SwiftUI

struct PhotoCaptureView: View {
    
    @Binding var isPickerShown: Bool
    @Binding var captureImage: Image?
    
    var body: some View {
        ImagePicker(isShown: self.$isPickerShown, image: self.$captureImage)
    }
}

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(isPickerShown: .constant(false), captureImage: .constant(Image("")))
    }
}

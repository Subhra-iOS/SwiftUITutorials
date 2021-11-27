//
//  ImageDownloaderView.swift
//  ImageDemo
//
//  Created by Subhra Roy on 27/11/21.
//

//http://www.omdbapi.com/?s=batman&apikey=564727fa

import SwiftUI

struct ImageDownloaderView: View {
    
    private let url: String
    private let placeholder: String
    
    @ObservedObject private var fileDownloader = FileDownloader()
    
    init(_ url: String, _ placeholderImgName: String) {
        self.url = url
        self.placeholder = placeholderImgName
        self.fileDownloader.loadData(from: url)
    }
    
    var body: some View {
        if let data = self.fileDownloader.downloadedData,
           let image: UIImage = UIImage(data: data){
            return Image(uiImage: image).resizable()
        }else{
            return Image(self.placeholder).resizable()
        }
    }
}

struct ImageDownloaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDownloaderView("https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg", "placeholder-image")
    }
}

//
//  Array+Extensions.swift
//  GridSwiftUI
//
//  Created by Subhra Roy on 06/07/21.
//

import Foundation

extension Array {
    func chunks(size: Int) -> [ArraySlice<Element>]{
        var chunkArr: [ArraySlice<Element>] = [ArraySlice<Element>]()
        for index in stride(from: 0, to: self.count - 1, by: size){
            var chunk = ArraySlice<Element>()
            let end = index + size
            if end >= self.count{
                chunk = self[index ..< self.count]
            }else{
                chunk = self[index ..< end]
            }
            chunkArr.append(chunk)
            if (end + 1) == self.count {
                let remainingChunk = self[end ..< self.count]
                chunkArr.append(remainingChunk)
            }
        }
        return chunkArr
    }
}

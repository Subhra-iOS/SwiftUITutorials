//
//  FancyTimer.swift
//  PodcastPlayer
//
//  Created by Subhra Roy on 08/07/21.
//

import Foundation
import Combine

class FancyTimer: ObservableObject {
    @Published private(set) var value: Int = 0
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.value += 1
        }
    }
}

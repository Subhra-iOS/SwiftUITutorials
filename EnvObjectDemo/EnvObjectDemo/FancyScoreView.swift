//
//  FancyScoreView.swift
//  EnvObjectDemo
//
//  Created by Subhra Roy on 08/07/21.
//

import SwiftUI

struct FancyScoreView: View {
    @Binding var score: Int
    
    var body: some View {
        VStack{
            Text("\(self.score)")
                .font(.title)
                .padding()
            Button("Score") {
                self.score += 1
            }.padding()
            .background(Color.red)
            .foregroundColor(.white)
        }.padding()
        .background(Color.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView(score: .constant(0))
    }
}

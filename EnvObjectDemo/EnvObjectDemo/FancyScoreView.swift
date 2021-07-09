//
//  FancyScoreView.swift
//  EnvObjectDemo
//
//  Created by Subhra Roy on 08/07/21.
//

import SwiftUI

struct FancyScoreView: View {
    //@Binding var score: Int
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack{
            Text("\(self.userSettings.score)")
                .font(.title)
                .padding()
            Button("Score") {
                self.userSettings.score += 1
            }.padding()
            .background(Color.red)
            .foregroundColor(.white)
        }.padding()
        .background(Color.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView().environmentObject(UserSettings())
    }
}

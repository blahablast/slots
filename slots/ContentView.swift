//
//  ContentView.swift
//  slots
//
//  Created by sam blaha on 1/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var credits = 1000
    @State var cost = 50
    @State var reward = 300
    @State var apple: String
    @State var cherry: String
    @State var star: String
    @State var isHidden = true
    @State var disabledBtn = false
    @State var gameOver = true
    
    var body: some View {
        VStack {
            Text("SwiftUI Slots!")
                .font(.title)
                .padding(.top, 50)
            Spacer()
            Text("Credits: \(credits)")
            Text("Jackpot!!!")
                .font(.title)
                .foregroundColor(.pink)
                .padding()
                .opacity(isHidden ? 0 : 1)
            Text("GAME OVER")
                .padding(30)
                .font(.largeTitle)
                .background(Color.white)
                .foregroundColor(.red)
                .cornerRadius(20)
                .opacity(gameOver ? 0 : 1)
            Spacer()
            HStack {
                Image(apple)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(cherry)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(star)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding()
            Spacer()
            Button {
                let appleRand = Int.random(in: 1...3)
                let cherryRand = Int.random(in: 1...3)
                let starRand = Int.random(in: 1...3)
                
                apple = "image\(appleRand)"
                cherry = "image\(cherryRand)"
                star = "image\(starRand)"
                
                if appleRand == cherryRand && appleRand == starRand {
                    credits = credits + reward
                    isHidden.toggle()
                }
                else {
                    credits = credits - cost
                    isHidden = true
                }
                
                if credits == 0 {
                    gameOver = false
                    disabledBtn = true
                }
                
            } label: {
                Text("Spin")
                    .fontWeight(.bold)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
            .disabled(disabledBtn)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(apple: "image1", cherry: "image2", star: "image3")
    }
}

//
//  ContentView.swift
//  Dicee UI
//
//  Created by Martin Dn on 3/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    @State var opacity = 1.0
    
    var body: some View {
        ZStack{
            
            Image("background").resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber, o: opacity)
                    DiceView(n: rightDiceNumber,o: opacity)

                }
                .padding(.horizontal)
                Spacer()
                Button {
                    DispatchQueue.main.async {
                       let time = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { Timer in
                            self.leftDiceNumber = Int.random(in: 1...6)
                            self.rightDiceNumber = Int.random(in: 1...6)
                            self.opacity = 0.5
                        }
                        
                        let time2 = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { Timer2 in
                            time.invalidate()
                            self.leftDiceNumber = Int.random(in: 1...6)
                             self.rightDiceNumber = Int.random(in: 1...6)
                             self.opacity = 1.0
                         }
                        
                    }


                    
                } label: {
                    Text("Play").font(.system(size: 50)).foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }


            
            
            
            
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let n: Int
    let o: Double
    var body: some View {
        
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .padding(.all, 10.0)
            .opacity(o)
    }
}

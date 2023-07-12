//
//  ContentView.swift
//  VolleyRef
//
//  Created by Javier Alaves on 12/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var teamOneScore: Int = 0
    @State var teamTwoScore: Int = 0
    
    @State var switchAlert: Bool = false
    @State var winAlert: Bool = false
    
    @State var matchWinner: String = ""
    
    var body: some View {
        HStack {
            Spacer()
            VStack (spacing: 20) {
                Text("Team 1")
                
                Button {
                    teamOneScore += 1
                    switchSides()
                } label: {
                    Text("\(teamOneScore)")
                        .font(.largeTitle)
                        .frame(width: 120, height: 120)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(.infinity)
                }
            }
            Spacer()
            VStack (spacing: 20) {
                Text("Team 2")
                
                Button {
                    teamTwoScore += 1
                    switchSides()
                } label: {
                    Text("\(teamTwoScore)")
                        .font(.largeTitle)
                        .frame(width: 120, height: 120)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(.infinity)
                }
            }
            Spacer()
        }
        .alert(isPresented: $switchAlert) {
            Alert(title: Text("Switch sides"),
                  message: Text("It's time to switch sides"),
                  dismissButton: .default(Text("OK")))
        }

    }
    
    func switchSides() {
        let scoreSum = teamOneScore + teamTwoScore
        
        if scoreSum.isMultiple(of: 7) {
            switchAlert = true
            print("Switch sides")
        } else {
            switchAlert = false
        }
    }
    
    func matchEnd() {
        
        if teamOneScore == 21 {
            matchWinner = "Team 1"
            print("Team 1 won")
            winAlert = true
        } else if teamTwoScore == 21 {
            matchWinner = "Team 2"
            print("Team 2 won")
            winAlert = true
        } else {
            matchWinner = ""
            print("Match ongoing")
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
    
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @State var matchAlert: Bool = false
        
    var body: some View {
        HStack {
            Spacer()
            VStack (spacing: 20) {
                Text("Team 1")
                
                Button {
                    teamOneScore += 1
                    matchRules()
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
                    matchRules()
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
        .alert(isPresented: $matchAlert) {
            Alert(title: Text(alertTitle),
                  message: Text(alertMessage),
                  dismissButton: .default(Text("OK")))
        }

    }
    
    func matchRules() {
        let scoreSum = teamOneScore + teamTwoScore
        
        if scoreSum.isMultiple(of: 7) {
            alertTitle = "Switch sides"
            alertMessage = "It's time to switch sides"
            matchAlert = true
        } else if teamOneScore == 21 {
            alertTitle = "We have a winner"
            alertMessage = "Team 1 won the match"
            matchAlert = true
        } else if teamTwoScore == 21 {
            alertTitle = "We have a winner"
            alertMessage = "Team 2 won the match"
            matchAlert = true
        } else {
            matchAlert = false
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

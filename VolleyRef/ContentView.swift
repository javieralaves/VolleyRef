//
//  ContentView.swift
//  VolleyRef
//
//  Created by Javier Alaves on 12/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var teamOneName: String = "Equipo 1"
    @State var teamTwoName: String = "Equipo 2"
    
    @State var teamOneScore: Int = 0
    @State var teamTwoScore: Int = 0
    
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @State var matchAlert: Bool = false
        
    var body: some View {
        HStack {
            Spacer()
            VStack (spacing: 20) {
                
                TextField(teamOneName, text: $teamOneName)
                    .multilineTextAlignment(.center)
                
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
                
                Button {
                    teamOneScore -= 1
                    matchRules()
                } label: {
                    Image(systemName: "minus.circle")
                        .font(.title)
                        .foregroundColor(.secondary)
                }
                
            }
            Spacer()
            VStack (spacing: 20) {
                TextField(teamTwoName, text: $teamTwoName)
                    .multilineTextAlignment(.center)
                
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
                
                Button {
                    teamTwoScore -= 1
                    matchRules()
                } label: {
                    Image(systemName: "minus.circle")
                        .font(.title)
                        .foregroundColor(.secondary)
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
        
        if teamOneScore == 21 {
            alertTitle = "Equipo 1 ha ganado 🎉"
            alertMessage = "Por favor, comunica el resultado por WhatsApp: +34 609 98 99 52"
            matchAlert = true
        } else if teamTwoScore == 21 {
            alertTitle = "Equipo 2 ha ganado 🎉"
            alertMessage = "Por favor, comunica el resultado por WhatsApp: +34 609 98 99 52"
            matchAlert = true
        } else if scoreSum.isMultiple(of: 7) {
            alertTitle = "Cambio de lado"
            alertMessage = "Toca cambiar de lado"
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

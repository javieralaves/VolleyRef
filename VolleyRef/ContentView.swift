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
                Text("Equipo 1")
                
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
                Text("Equipo 2")
                
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
            alertTitle = "Cambio de lado"
            alertMessage = "Toca cambiar de lado"
            matchAlert = true
        } else if teamOneScore == 21 {
            alertTitle = "Tenemos a un ganador"
            alertMessage = "El equipo 1 ha ganado 🎉"
            matchAlert = true
        } else if teamTwoScore == 21 {
            alertTitle = "Tenemos a un ganador"
            alertMessage = "El equipo 2 ha ganado 🎉"
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

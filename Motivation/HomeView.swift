//
//  HomeView.swift
//  Motivation
//
//  Created by William Tanil on 13/06/24.
//  Copyright (c) 2024 William Tanil. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    
    // stat
    @AppStorage("countOfYes") private var countOfYes = 0
    @AppStorage("countOfNo") private var countOfNo = 0
    @AppStorage("totalCount") private var totalCount = 0
    @AppStorage("storedDate") var storedDate = Double(0)
    // setting
    @AppStorage("showCustomGoal") private var showCustomGoal = false
    @AppStorage("isGoalPublic") private var isGoalPublic = false
    @AppStorage("customGoal") private var customGoal = "test"
    
    
    @State private var showingAlert = false
    @State private var alertType = true
    @State private var scale = 1.0
    
    var body: some View {
        
        let shouldDisable = Date.isToday(Date.convertIntervalToDate(storedDate))
        
        VStack {
            
            HStack {
                VStack {
                    Text("Are you closer to your goal?")
                        .font(.title)
                        .scaleEffect(scale)
                        .onAppear {
                            let baseAnimation = Animation.easeInOut(duration: 2)
                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                            withAnimation(repeated) {
                                scale = 0.8
                            }
                        }
                    
                    if showCustomGoal && isGoalPublic {
                        Text(customGoal)
                            .padding(.top, 8)
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button { yesAction() } label: {
                    Text("Yes")
                }
                .modifier(HomeButton(shouldDisable: shouldDisable))
                
                Spacer()
                Button { noAction() } label: {
                    Text("No")
                }
                .modifier(HomeButton(shouldDisable: shouldDisable))
                
                Spacer()
            }
            Spacer()
        }
        .padding()
        .alert(isPresented:$showingAlert) {
            switch alertType {
                case true:
                    return yesAlert
                case false:
                    return noAlert
            }
        }
    }
    
    private var yesAlert: Alert {
        return Alert(title: Text("Great Progress"), message: Text("Congratulations on your progress!"), dismissButton: .default(Text("Ok")))
    }
    
    private var noAlert: Alert {
        Alert(title: Text("It's Okay"),
              message: Text("Even small steps count as progress. Keep going, and you'll achieve it soon!"),
              primaryButton: .default(Text("Ok")) {
            self.countOfNo += 1
            self.totalCount += 1
            self.storedDate = Date.convertDateToInterval(Date())
        },
              secondaryButton: .cancel()
        )
    }
    
    private func yesAction() {
        self.alertType = true
        self.countOfYes += 1
        self.totalCount += 1
        self.storedDate = Date.convertDateToInterval(Date())
        showingAlert.toggle()
    }
    
    private func noAction() {
        self.alertType = false
        
        showingAlert.toggle()
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  ContentView.swift
//  Motivation
//
//  Created by William Suryadi Tanil on 16/05/24.
//

import SwiftUI

struct ContentView: View {
    
    // Stat
    @AppStorage("countOfYes") private var countOfYes = 0
    @AppStorage("countOfNo") private var countOfNo = 0
    @AppStorage("totalCount") private var totalCount = 0
    @AppStorage("storedDate") var storedDate = Double(0)
    // Setting
    @AppStorage("showCustomGoal") private var showCustomGoal = false
    @AppStorage("isGoalPublic") private var isGoalPublic = false
    @AppStorage("customGoal") private var customGoal = "test"
    
    @State private var showingAlert = false
    @State private var alertType = true
    @State var scale = 1.0
    
    var body: some View {
        
        let shouldDisable = isToday(convertIntervalToDate(storedDate))
        VStack {
            
            HStack {
                Spacer()
                Button {
                    SettingView()
                } label: {
                    Text("Setting")
                }
            }
            
            Spacer()
            
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
//                    helperSection
                    if isGoalPublic {
                        Text(customGoal)
                    }
                    
                }
                
            }
            Spacer()
            HStack {
                Spacer()
                Button { yesAction() } label: {
                    Text("Yes")
                }
                .modifier(ButtonViewModifier(shouldDisable: shouldDisable))
                
                Spacer()
                Button { noAction() } label: {
                    Text("No")
                }
                .modifier(ButtonViewModifier(shouldDisable: shouldDisable))
                
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
    
    private func convertDateToInterval(_ date: Date) -> TimeInterval {
        date.timeIntervalSinceReferenceDate
    }
    
    private func convertIntervalToDate(_ timeInterval: TimeInterval) -> Date {
        Date(timeIntervalSinceReferenceDate: timeInterval)
    }
    
    private func isToday(_ date: Date) -> Bool {
        return Calendar.current.isDateInToday(date)
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
            self.storedDate = convertDateToInterval(Date())
        },
              secondaryButton: .cancel()
        )
    }
    
    private func yesAction() {
        self.alertType = true
        self.countOfYes += 1
        self.totalCount += 1
        self.storedDate = convertDateToInterval(Date())
        showingAlert.toggle()
    }
    
    private func noAction() {
        self.alertType = false
        
        showingAlert.toggle()
    }
    
    private var helperSection: some View {
        
        VStack {
            Text("yes: \(countOfYes) no: \(countOfNo) total: \(totalCount)")
            Text("isToday: \(isToday(convertIntervalToDate(storedDate)) ? "true" : "false") lastDate: \(convertIntervalToDate(storedDate))")
            Button {
                self.countOfNo = 0
                self.countOfYes = 0
                self.totalCount = 0
                self.storedDate = Double(0)
            } label: {
                Text("reset")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

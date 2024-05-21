//
//  ContentView.swift
//  Motivation
//
//  Created by William Suryadi Tanil on 16/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("countOfYes") private var countOfYes = 0
    @AppStorage("countOfNo") private var countOfNo = 0
    @AppStorage("totalCount") private var totalCount = 0
    @AppStorage("storedDate") var storedDate = Double(0)
    
    @State private var showingAlert = false
    @State private var alertType = true
    
    var body: some View {
        
        var shouldDisable = isToday(convertIntervalToDate(storedDate))
        VStack {
            Spacer()
            HStack {
                VStack {
                    Text("Are you closer to your goal?")
                    helperSection
                }
                
            }
            Spacer()
            HStack {
                Spacer()
                Button { yesAction() } label: {
                    Text("Yes")
                        .modifier(ButtonViewModifier(shouldDisable: shouldDisable))
                }
                
                Spacer()
                Button { noAction() } label: {
                    Text("No")
                        .modifier(ButtonViewModifier(shouldDisable: shouldDisable))
                }
                
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
        return Alert(title: Text("Title"), message: Text("Message"), dismissButton: .default(Text("Ok")))
    }
    
    private var noAlert: Alert {
        Alert(title: Text("Title"),
              message: Text("Message"),
              primaryButton: .default(Text("Yes")) {
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

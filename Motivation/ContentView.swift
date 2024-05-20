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
    @State private var showingAlert = false
    @State private var alertType = true
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    Text("Are you closer to your goal?")
                    Text("yes: \(countOfYes) no: \(countOfNo) total: \(totalCount)")
                    Button {
                        self.countOfNo = 0
                        self.countOfYes = 0
                        self.totalCount = 0
                    } label: {
                        Text("reset")
                    }

                }
                
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    yesAction()
                } label: {
                    Text("Yes")
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.black)
                        .background(Color.green)
                        .clipShape(Rectangle())
                }
                
                Spacer()
                Button {
                    noAction()
                } label: {
                    Text("No")
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.black)
                        .background(Color.green)
                        .clipShape(Rectangle())
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
    
    private var yesAlert: Alert {
        return Alert(title: Text("Title"), message: Text("Message"), dismissButton: .default(Text("Ok")))
    }
    
    private var noAlert: Alert {
        Alert(title: Text("Title"),
              message: Text("Message"),
              primaryButton: .default(Text("Yes")) {
            self.countOfNo += 1
            self.totalCount += 1
        },
              secondaryButton: .cancel()
        )
    }
    
    private func yesAction() {
        self.alertType = true
        self.countOfYes += 1
        self.totalCount += 1
        showingAlert.toggle()
    }
    
    private func noAction() {
        self.alertType = false
        
        showingAlert.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

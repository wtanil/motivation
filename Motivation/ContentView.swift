//
//  ContentView.swift
//  Motivation
//
//  Created by William Suryadi Tanil on 16/05/24.
//

import SwiftUI

struct ContentView: View {
    
    //    @AppStorage("lastConfirmedDate") private var lastConfirmedDate = Date()
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
//                    Text("yes: \(countOfYes) no: \(countOfNo) total: \(totalCount)")
                }
                
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    // do something
                    // word of
                    self.alertType = true
                    self.countOfYes += 1
                    self.totalCount += 1
                    showingAlert.toggle()
                } label: {
                    Text("Yes")
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.black)
                        .background(Color.green)
                        .clipShape(Rectangle())
                }
                
                Spacer()
                Button {
                    // do something
                    self.alertType = false
                    self.countOfNo += 1
                    self.totalCount += 1
                    showingAlert.toggle()
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
                    return Alert(title: Text("Title"), message: Text("Message"), dismissButton: .default(Text("Ok")))
                case false:
                    return Alert(title: Text("Title"),
                                 message: Text("Message"),
                                 primaryButton: .default(Text("Yes")) {
                        // do something
                    },
                                 secondaryButton: .cancel()
                    )
                    
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

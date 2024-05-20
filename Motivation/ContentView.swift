//
//  ContentView.swift
//  Motivation
//
//  Created by William Suryadi Tanil on 16/05/24.
//

import SwiftUI

struct ContentView: View {
    
    //    @AppStorage("lastConfirmedDate") private var lastConfirmedDate = Date()
    @State private var showingAlert = false
    @State private var alertType = true
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Are you closer to your goal?")
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    // do something
                    // word of
                    self.alertType = true
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

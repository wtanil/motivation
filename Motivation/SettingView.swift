//
//  SettingView.swift
//  Motivation
//
//  Created by William Tanil on 04/06/24.
//  Copyright (c) 2024 William Tanil. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    
    @AppStorage("showCustomGoal") private var showCustomGoal = false
    @AppStorage("isGoalPublic") private var isGoalPublic = false
    @AppStorage("customGoal") private var customGoal = ""
    @AppStorage("notificationType") private var notificationType = 0
    
    @State private var toTrigger = false
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack() {
                        Text("Hello, what do you want to change today?")
                            .font(.title)
                    }
                    
                    Spacer(minLength: 8)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            VStack(alignment: .leading) {
                                Text("Do you want to write your goal?")
                                HStack {
                                    Button {
                                        self.toTrigger.toggle()
                                        self.showCustomGoal = true
                                        
                                    } label: {
                                        Text("Yes")
                                    }
                                    
                                    .disabled(showCustomGoal)
                                    Button {
                                        self.toTrigger.toggle()
                                        self.showCustomGoal = false
                                        
                                    } label: {
                                        Text("No")
                                    }
                                    .disabled(!showCustomGoal)
                                }
                                
                                if showCustomGoal {
                                    VStack(alignment: .leading) {
                                        TextField("Write your goal here", text: $customGoal)
                                            .textFieldStyle(.roundedBorder)
                                        Text("Do you want to show your goal by default?")
                                        HStack {
                                            Button {
                                                self.toTrigger.toggle()
                                                self.isGoalPublic = true
                                                
                                            } label: {
                                                Text("Yes")
                                            }
                                            .disabled(isGoalPublic)
                                            Button {
                                                self.toTrigger.toggle()
                                                self.isGoalPublic = false
                                                
                                            } label: {
                                                Text("No")
                                            }
                                            .disabled(!isGoalPublic)
                                        }
                                    }
                                    .padding(.leading)
                                    
                                }
                            }
                            Spacer(minLength: 16)
                            
                            VStack(alignment: .leading) {
                                Text("How do you want to be reminded?")
                                VStack(alignment: .leading) {
                                    // Type 0
                                    Button {
                                        self.toTrigger.toggle()
                                        self.notificationType = 0
                                        
                                    } label: {
                                        Text("Don't notify me.")
                                    }
                                    .disabled(notificationType == 0)
                                    // Type 1
                                    Button {
                                        self.toTrigger.toggle()
                                        self.notificationType = 1
                                        
                                    } label: {
                                        Text("Notify me once a day, at night.")
                                    }
                                    .disabled(notificationType == 1)
                                    // Type 2
                                    Button {
                                        self.toTrigger.toggle()
                                        self.notificationType = 2
                                        
                                    } label: {
                                        Text("Notify me twice a day, at noon and night.")
                                    }
                                    .disabled(notificationType == 2)
                                }
                            }
                        }
                        Spacer()
                    }
                }
                .padding()
                
            }
        }
        
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

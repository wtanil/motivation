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
                                    Button { self.showCustomGoal = true } label: {
                                        Text("Yes")
                                    }
                                    Button { self.showCustomGoal = false } label: {
                                        Text("No")
                                    }
                                }
                                if showCustomGoal {
                                    TextField("Write your goal here", text: $customGoal)
                                    Text("-Do you want to show your goal by default?")
                                    HStack {
                                        Button { self.isGoalPublic = true } label: {
                                            Text("Yes")
                                        }
                                        Button { self.isGoalPublic = false } label: {
                                            Text("No")
                                        }
                                    }
                                }
                            }
                            
                            
                            
                            
                            Text("How do you want to be reminded?")
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

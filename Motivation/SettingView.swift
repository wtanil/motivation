//
//  SettingView.swift
//  Motivation
//
//  Created by William Tanil on 04/06/24.
//  Copyright (c) 2024 William Tanil. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        
        VStack {
            Text("Hi, what do you want to change today?")
            Text("Do you want to write your goal?")
            Text("-Write your goal here")
            Text("-Do you want to show your goal by default?")
            Text("How do you want to be reminded?")
            
            
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

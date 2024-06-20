//
//  SettingTextFieldViewModifier.swift
//  Motivation
//
//  Created by William Tanil on 20/06/24.
//  Copyright (c) 2024 William Tanil. All rights reserved.
//

import Foundation

import SwiftUI

struct SettingTextField: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.green)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white)
            )
    }
}

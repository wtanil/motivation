//
//  SettingButtonViewModifier.swift
//  Motivation
//
//  Created by William Tanil on 13/06/24.
//  Copyright (c) 2024 William Tanil. All rights reserved.
//

import Foundation
import SwiftUI

struct SettingButton: ViewModifier {
    
    let shouldDisable: Bool
    
    func body(content: Content) -> some View {
        content
            .tint(.green)
            .buttonStyle(.bordered)
            .controlSize(.regular)
            .disabled(shouldDisable ? true : false)
        
    }
}

//
//  ButtonViewModifier.swift
//  Motivation
//
//  Created by William Suryadi Tanil on 20/05/24.
//

import Foundation
import SwiftUI

struct ButtonViewModifier: ViewModifier {
    
    let shouldDisable: Bool
    
    func body(content: Content) -> some View {
        content
            .tint(.green)
            .buttonStyle(.bordered)
            .controlSize(.large)
            .disabled(shouldDisable ? true : false)
        
    }
}

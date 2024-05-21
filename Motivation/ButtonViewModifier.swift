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
            .frame(width: 100, height: 100)
            .foregroundColor(Color.black)
            .background(shouldDisable ? Color.gray : Color.green)
            .clipShape(Rectangle())
            .disabled(shouldDisable ? true : false)
    }
}

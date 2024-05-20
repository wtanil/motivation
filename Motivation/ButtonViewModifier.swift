//
//  ButtonViewModifier.swift
//  Motivation
//
//  Created by William Suryadi Tanil on 20/05/24.
//

import Foundation
import SwiftUI

struct ButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 100)
            .foregroundColor(Color.black)
            .background(Color.green)
            .clipShape(Rectangle())
    }
}

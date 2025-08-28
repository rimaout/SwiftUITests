//
//  CustomModifiers.swift
//  Apperizers
//
//  Created by Matteo on 28/08/25.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
    content
        .fontWeight(.bold)
        .buttonStyle(.bordered)
        .controlSize(.large)
        .tint(Color.brandPrimary)
        
    }
}

//
//  XDismissButton.swift
//  Apperizers
//
//  Created by Matteo on 23/08/25.
//

import SwiftUI

struct XDismissButton: View {

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundStyle(.black)
        }
    }
}

//
//  AppetizerButton.swift
//  Apperizers
//
//  Created by Matteo on 23/08/25.
//

import SwiftUI

//NOTE: NOT USED IN THE PROJECT ANYMORE, it is still here only for learning purposes.

struct AppetizerButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 60)
            .foregroundStyle(.white)
            .background(Color.brandPrimary)
            .clipShape(.buttonBorder)
        //Note: The following replaces the cornerRadius(_:) view modifier.
        //.clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    AppetizerButton(title: "Test Title")
}

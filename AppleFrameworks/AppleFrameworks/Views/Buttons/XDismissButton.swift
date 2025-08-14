//
//  XDismissButton.swift
//  AppleFrameworks
//
//  Created by Matteo on 13/08/25.
//

import SwiftUI

struct XDismissButton: View {
    @Binding var isShowingModal: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                isShowingModal = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label)) //Color(.lable) is used to get withe in light mode and black in darkmode
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }.padding()
    }
}

#Preview {
    XDismissButton(isShowingModal: .constant(false))
}

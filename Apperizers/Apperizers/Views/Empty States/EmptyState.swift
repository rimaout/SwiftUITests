//
//  EmptyState.swift
//  Apperizers
//
//  Created by Matteo on 26/08/25.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let message: String

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    
                
                    .frame(height: 150)

                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal ,35)
                    .padding(.top, 10)
                
            }.offset(y: -45)
        }
    }
}

#Preview {
    EmptyState(imageName: "folder", message: "This is a test message.\n I'm making it a little long for testing.")
}

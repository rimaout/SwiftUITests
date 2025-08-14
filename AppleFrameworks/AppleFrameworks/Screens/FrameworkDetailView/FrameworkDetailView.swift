//
//  FrameworkDetailView.swift
//  AppleFrameworks
//
//  Created by Matteo on 24/07/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    @State private var isShowingSafariView = false
    
    private var destinationURL: URL {
        URL(string: framework.urlString) ?? URL(string: "https://www.apple.com")!
    }
    
    var body: some View {
        
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90, alignment: .center)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
            
            Text(framework.description)
                .font(.body)
                .padding()
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariView(url: destinationURL)
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}

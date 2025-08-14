//
//  FrameworkDetailView.swift
//  AppleFrameworks
//
//  Created by Matteo on 24/07/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    @Binding var isShowingDetailView:Bool
    @State private var isShowingSafariView = false
    
    private var destinationURL: URL {
        URL(string: framework.urlString) ?? URL(string: "https://www.apple.com")!
    }
    
    var body: some View {
        
        VStack {
            XDismissButton(isShowingModal: $isShowingDetailView)
            
            Spacer()
            
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
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.blue)
            
            //additional settings examples:
            //.foregroundColor(.red)
            //.buttonBorderShape(.roundedRectangle(radius:  20))
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariView(url: destinationURL)
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework,
                        isShowingDetailView: .constant(false) //used to hardcode bindings in a view preview
    )
}

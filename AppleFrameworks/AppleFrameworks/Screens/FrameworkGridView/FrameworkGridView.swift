//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Matteo on 24/07/25.
//

import SwiftUI

struct FrameworkGridView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    //TODO: 3 collumns, .flexible() without any agrguments will automatical ...
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) {
                        framework in
                        NavigationLink(value: framework) {
                            FrameworkTitleView(framework: framework)
                        } 
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .navigationDestination(for: Framework.self) {
                framework in FrameworkDetailView(framework: framework)
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}

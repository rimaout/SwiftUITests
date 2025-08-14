//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Matteo on 24/07/25.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
     
    
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
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                                    isShowingDetailView: $viewModel.isShowingDetailView
                )
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}

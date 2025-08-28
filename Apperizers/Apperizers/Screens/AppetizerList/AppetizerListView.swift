//
//  AppetizerListView.swift
//  Apperizers
//
//  Created by Matteo on 18/08/25.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerCellView(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("🍟 Appetizers")
                .disabled(viewModel.isShowingDetail) // Disable interaction with list (scrolling and tappping is the modal (AppetizerDetailCardView) is active
            }
            .onAppear {
                viewModel.getAppetizers() // Initial data fetch
            }
            .refreshable {
                viewModel.getAppetizers() // Pull-to-refresh action
            }
            
            .blur(radius: viewModel.isShowingDetail ? 20 : 0) // blur if the modal (AppetizerDetailCardView) is active
            
            if viewModel.isShowingDetail {
                AppetizerDetailCardView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}

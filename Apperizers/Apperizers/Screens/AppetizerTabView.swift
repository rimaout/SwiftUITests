//
//  ContentView.swift
//  Apperizers
//
//  Created by Matteo on 18/08/25.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            AccountView().tabItem {
                Image(systemName: "person")
                Text("Account")
            }
            
            OrderView().tabItem {
                Image(systemName: "bag")
                Text("Order")
            }
        }.accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}

//
//  ApperizersApp.swift
//  Apperizers
//
//  Created by Matteo on 18/08/25.
//

import SwiftUI

@main
struct ApperizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order) //injecting the orden in appetizerView
        }
    }
}

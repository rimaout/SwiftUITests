//
//  FrameworkGridViewModel.swift
//  AppleFrameworks
//
//  Created by Matteo on 12/08/25.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
        //each time the selectedFramework is set isShowingDetailView = true
    }
    
    @Published var isShowingDetailView = false
}

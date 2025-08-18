//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Matteo on 18/08/25.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
   
    @Published var scannerCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannerCode.isEmpty ? "Not Yet Scanned" : scannerCode
    }
    
    var statusTextColor: Color {
        scannerCode.isEmpty ? .red : .blue
    }
}

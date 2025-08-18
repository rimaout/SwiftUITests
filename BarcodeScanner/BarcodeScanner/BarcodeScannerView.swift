//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Matteo on 14/08/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera. We are unable to capture the input.",
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidScannedType = AlertItem(title: "Invalid Scan Type",
                                              message: "The value s canned is not valid. This app scans EAN-8 and EAN-13.",
                                              dismissButton: .default(Text("Ok")))
}

struct BarcodeScannerView: View {
    
    @State private var scannerCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationStack() {
            VStack {
                
                Spacer().frame(height: 50)
                
                ScannerView(scannedCode: $scannerCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(20)
                    .padding(20)
                
                Spacer()
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                    .padding(.bottom)
                
                Text(scannerCode.isEmpty ? "Not Yet Scanned" : scannerCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(scannerCode.isEmpty ? .red : .blue)
                
                Spacer()
            }
            .navigationTitle("Barcode Scaner")
            .alert(item: $alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}

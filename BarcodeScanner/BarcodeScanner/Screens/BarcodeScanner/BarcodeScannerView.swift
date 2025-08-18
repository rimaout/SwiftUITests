//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Matteo on 14/08/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    // NOTE:
    //  - @StateObject is used when we are creating a new object
    //  - @ObservedObject is used when we are passing a already existing object
    
    var body: some View {
        NavigationStack() {
            VStack {
                
                Spacer().frame(height: 50)
                
                ScannerView(scannedCode: $viewModel.scannerCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(20)
                    .padding(20)
                
                Spacer()
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                    .padding(.bottom)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                
                Spacer()
            }
            .navigationTitle("Barcode Scaner")
            .alert(item: $viewModel.alertItem) { alertItem in
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

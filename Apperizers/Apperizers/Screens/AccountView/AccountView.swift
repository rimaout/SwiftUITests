//
//  AccountView.swift
//  Apperizers
//
//  Created by Matteo on 18/08/25.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.firstName)
                        .textContentType(.name)
                        .textInputAutocapitalization(.words)
                    
                    TextField("Last Name", text: $viewModel.lastName)
                        .textContentType(.name)
                        .textInputAutocapitalization(.words)
                    
                    TextField("Email", text: $viewModel.email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                    
                    DatePicker("Birtday", selection: $viewModel.birthdate, displayedComponents: .date)
                    
                    Button("Save Changes") {
                        viewModel.saveChanges()
                    }
                }
                
                Section(header: Text("Special Diet")) {
                    Toggle("Lactose Intolerance", isOn: $viewModel.lactoseIntolerance)
                    Toggle("Celiac", isOn: $viewModel.celiac)
                }.toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("😃 Account")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton:  alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}

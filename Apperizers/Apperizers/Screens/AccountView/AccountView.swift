//
//  AccountView.swift
//  Apperizers
//
//  Created by Matteo on 18/08/25.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    @FocusState private var focusedTextField: FormTextField?
    enum FormTextField {
        case firstName, lastName, email
    }
    
    // Manage keyboard focus between form fields using FocusState:
    // - .focused binds a field to the FocusState enum value when the user taps the field.
    // - .onSubmit defines what happens when the user taps the keyboard's submit/return key.
    // - .submitLabel customizes the label shown on the keyboard's submit button.
    // This lets the return key move to the next field (or dismiss the keyboard on the last field).
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .textContentType(.name)
                        .textInputAutocapitalization(.words)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }   // move to Last Name
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .textContentType(.name)
                        .textInputAutocapitalization(.words)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }      // move to Email
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }         // last field: dismiss keyboard
                        .submitLabel(.continue)
                    
                    DatePicker("Birtday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    
                    Button("Save Changes") {
                        viewModel.saveChanges()
                    }
                }
                
                Section(header: Text("Special Diet")) {
                    Toggle("Lactose Intolerance", isOn: $viewModel.user.lactoseIntolerance)
                    Toggle("Celiac", isOn: $viewModel.user.celiac)
                }.toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") { focusedTextField = nil }
                }
            }
        }
        .navigationTitle("😃 Account")
        .onAppear {
            viewModel.retirveUser()
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

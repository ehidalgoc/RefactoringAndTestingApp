//
//  SwiftUIView.swift
//  RefactoringAndTesting
//
//  Created by BPIMA_ALW1090 on 12/9/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    
    private let ageFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimum = 0
        formatter.maximum = 120
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    // Create an array for age selection from 0 to 100
    private let ageRange = Array(0...100)
    
    @State private var navigateToLogin = false
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Details")) {
                    TextField("First Name", text: $viewModel.userRegistrationDetails.firstName)
                        .disableAutocorrection(true)
                    
                    TextField("Last Name", text: $viewModel.userRegistrationDetails.lastName)
                        .disableAutocorrection(true)
                    
                    TextField("Email", text: $viewModel.userRegistrationDetails.email)
                        .disableAutocorrection(true)
                        .textCase(.lowercase)
                    
                    SecureField("Password", text: $viewModel.userRegistrationDetails.password)
                    
                    // Picker for age selection
                    HStack {
                        Text("Age")
                        Picker("Age", selection: $viewModel.userRegistrationDetails.age) {
                            ForEach(ageRange, id: \.self) { age in
                                Text("\(age)")
                                    .tag(age)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(height: 150) // Adjust height for better appearance
                    }
                }
                
                Section {
                    Button(action: {
                        viewModel.registerUser()
                        if viewModel.isRegistrationSuccessful {
                            // Show the success message briefly before navigation
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                navigateToLogin = true
                            }
                        }
                    }) {
                        Text("Register")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                NavigationLink(
                    destination: LoginView(),
                    isActive: $navigateToLogin,
                    label: {
                        EmptyView() // We don't need to show any button here, navigation happens automatically
                    }
                )
                
                if !viewModel.errorMessage.isEmpty {
                    Section {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                }
                
                if viewModel.isRegistrationSuccessful {
                    Section {
                        Text("Registration Successful!")
                            .foregroundColor(.green)
                    }
                }
                
                
            }
            .navigationTitle("User Registration")
        }
    }
}



struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(RegistrationViewModel())
    }
}

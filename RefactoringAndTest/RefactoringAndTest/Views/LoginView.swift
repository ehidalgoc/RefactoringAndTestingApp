//
//  LoginView.swift
//  RefactoringAndTest
//
//  Created by BPIMA_ALW1090 on 12/9/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @State private var isLoginSuccessful = false
    @State private var isNavigateToRegistration = false
    @State private var navigateToWelcome = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Login Details")) {
                    TextField("Email", text: $loginViewModel.userAuthentication.email)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .textCase(.lowercase)
                    
                    SecureField("Password", text: $loginViewModel.userAuthentication.password)
                }
                
                Section {
                    Button(action: {
                        // Call backend API to validate login
                        loginViewModel.loginAuthentication()
                        if loginViewModel.isAuthenticated {
                           navigateToWelcome = true // Trigger navigation
                       }
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                
                NavigationLink(
                    destination: WelcomeView(),
                                   isActive: $navigateToWelcome,
                                   label: {
                                       EmptyView() // We don't need to show any button here, navigation happens automatically
                                   }
                               )
                
                
                Section {
                    NavigationLink(destination: RegistrationView()) {
                        Text("Don't have an account? Register here.")
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                if !loginViewModel.errorMessage.isEmpty {
                    Section {
                        Text(loginViewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Login")
        }
    }
}

#Preview {
    LoginView()
}

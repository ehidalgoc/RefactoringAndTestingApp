//
//  LoginViewModel.swift
//  RefactoringAndTest
//
//  Created by BPIMA_ALW1090 on 12/9/24.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var userAuthentication: User = User(firstName: "", lastName: "", email: "", password: "", age: 0)
    @Published var errorMessage: String = ""
    private let userRepository = UserRepository()
    @Published var isAuthenticated: Bool = false
    
    private let userValidator = UserValidator()
    
    func loginAuthentication() -> Bool {
        var isAValidUser: Bool = false
        isAuthenticated = false
        guard userValidator.isValidToAuthenticateAnUser(userRequest: userAuthentication) else {
            errorMessage = "Fill all the fields"
            return isAValidUser
        }
        
        guard userValidator.isAValidEmail(email: userAuthentication.email) else {
            errorMessage = "Input a rigth format email"
            return isAValidUser
        }
        
        guard userValidator.isAValidPassword(password: userAuthentication.password) else {
            errorMessage = "Input a valid password"
            return isAValidUser
        }
        
        let authenticateUser = userRepository.authenticateUser(email: userAuthentication.email, password: userAuthentication.password)
       
        if authenticateUser {
            errorMessage = "Welcome"
            isAuthenticated = true
        } else {
            errorMessage = "User not found. Please try again or register as a new user"
        }
        
        return isAuthenticated
    }
}

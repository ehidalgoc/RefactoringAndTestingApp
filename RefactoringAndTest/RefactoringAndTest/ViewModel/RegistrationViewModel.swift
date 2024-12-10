//
//  RegistrationViewModel.swift
//  RefactoringAndTesting
//
//  Created by BPIMA_ALW1090 on 12/9/24.
//

import Foundation

// MARK: - ViewModel
class RegistrationViewModel: ObservableObject {
    @Published var userRegistrationDetails: User = User(firstName: "", lastName: "", email: "", password: "", age: 0)
    @Published var errorMessage: String = ""
    @Published var isRegistrationSuccessful: Bool = false
    private let userRepository = UserRepository() // Create an instance
    
    private let userValidator = UserValidator() // Create an instance
    
    // Create an array for age selection from 0 to 100
    private let ageRange = Array(0...100)
    
    func registerUser() -> Bool{
        var isAValidUser: Bool = false
        guard userValidator.isValidToRegisterAnUser(userRequest: userRegistrationDetails) else {
            errorMessage = "Fill all the fields"
            return isAValidUser
        }
        
        guard userValidator.isAValidEmail(email: userRegistrationDetails.email) else {
            errorMessage = "Input a rigth format email"
            return isAValidUser
        }
        
        guard userValidator.isAValidPassword(password: userRegistrationDetails.password) else {
            errorMessage = "Input a valid password"
            return isAValidUser
        }
        
        guard userValidator.isAValidAge(age: userRegistrationDetails.age) else {
            errorMessage = "Input a valid age"
            return isAValidUser
        }
        
        // Simulate backend interaction
        let itWasRegister = userRepository.registerUser(userRequest: userRegistrationDetails)
        
        if itWasRegister {
            errorMessage = "User saved successfully!"
            isAValidUser = true
            isRegistrationSuccessful = true
        } else {
            errorMessage = "User already exists."
        }
        
        return isAValidUser
        
    }
}

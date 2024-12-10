//
//  UserValidator.swift
//  RefactoringAndTesting
//
//  Created by BPIMA_ALW1090 on 12/9/24.
//

class UserValidator {
    /// Validates the registration details of a user.
    /// Ensures all required fields are non-empty.
    func isValidToRegisterAnUser(userRequest: User) ->Bool {
       var isValid = true
        if !isValueNotEmpty(value: userRequest.firstName) ||
            !isValueNotEmpty(value: userRequest.lastName) ||
            !isValueNotEmpty(value: userRequest.email) ||
            !isValueNotEmpty(value: userRequest.password) {
            print("All fields must be filled.")
            isValid = false
        }
        
        return isValid
    }
    
    func isValidToAuthenticateAnUser(userRequest: User) ->Bool {
       var isValid = true
        if !isValueNotEmpty(value: userRequest.email) ||
            !isValueNotEmpty(value: userRequest.password) {
            print("All fields must be filled.")
            isValid = false
        }
        
        return isValid
    }


    /// Checks if a string value is empty or not.
    /// - Parameter value: The string value to check.
    /// - Returns: `true` if the string is not empty; otherwise, `false`.
    func isValueNotEmpty(value: String) -> Bool {
        return !value.isEmpty
    }

    /// Custom error type for validation.
    /// Provides a descriptive message for any validation error.
    struct ValidationError: Error {
        let message: String
    }

    /// Validates if the provided email address is in a valid format.
    /// - Parameter email: The email string to validate.
    /// - Returns: `true` if the email contains "@"; otherwise, `false`.
    func isAValidEmail(email: String) -> Bool {
        return email.contains("@")
    }

    /// Validates if the provided password meets the criteria.
    /// - Parameter password: The password string to validate.
    /// - Returns: `true` if the password has at least 6 characters; otherwise, `false`.
    func isAValidPassword(password: String) -> Bool {
        return password.count >= 6
    }

    /// Validates if the provided age is within the allowed range.
    /// - Parameter age: The age value to validate.
    /// - Returns: `true` if the age is 18 or above; otherwise, `false`.
    func isAValidAge(age: Int) -> Bool {
        return age >= 18
    }

    
}

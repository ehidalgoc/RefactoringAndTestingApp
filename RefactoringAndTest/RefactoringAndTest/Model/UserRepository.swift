//
//  UserManager.swift
//  RefactoringAndTesting
//
//  Created by BPIMA_ALW1090 on 12/9/24.
//

import Foundation

class UserRepository {
    
    
    func registerUser(userRequest: User) -> Bool{
        
        // Save user to database
        let user = User(firstName: userRequest.firstName, lastName: userRequest.lastName, email: userRequest.email, password: userRequest.password, age: userRequest.age)
        return Database.saveUser(user: user)
        
    }
    
    func sendEmailService(email: String) -> Bool {
        print("Email sent to \(email)")
        // Send welcome email
        return EmailService.sendWelcomeEmail(email: email)
    }
    
    func authenticateUser(email: String, password: String) -> Bool {
        guard let user =  Database.getUserByEmail(email: email) else {
            return false
        }
        
        return user.password == password
    }
    
}

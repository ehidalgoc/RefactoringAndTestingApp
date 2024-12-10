//
//  Database.swift
//  RefactoringAndTesting
//
//  Created by BPIMA_ALW1090 on 12/9/24.
//

import Foundation

class Database {
    private static var users: [User] = []

    static func saveUser(user: User) -> Bool{
        users.append(user)
        return true
    }

    static func getUserByEmail(email: String) -> User? {
        return users.first { $0.email == email }
    }
}

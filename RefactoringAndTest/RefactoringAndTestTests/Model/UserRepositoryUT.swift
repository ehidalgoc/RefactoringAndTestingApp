//
//  UserValidatorUT.swift
//  RefactoringAndTestTests
//
//  Created by BPIMA_ALW1090 on 12/10/24.
//


import XCTest
@testable import RefactoringAndTest

final class UserRepositoryUT: XCTestCase {
    
    
    var viewModel: UserRepository!
    
    
    override func setUpWithError() throws {
        super.setUp()
        viewModel = UserRepository()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /**func testWhenRegisterUserGivenAllParametersThenReturnFalse() throws {
        var isAValidUser: Bool = false
        // Given
        let user: User = User(firstName: "", lastName: "", email: "email@email.com", password: "password", age: 0)
        
        // When
        isAValidUser = viewModel.registerUser(userRequest: user)
        
        // Then
        XCTAssertFalse(isAValidUser)
    }**/
    
    func testWhenRegisterUserGivenAllParametersThenReturnTrue() throws {
        var isAValidUser: Bool = false
        // Given
        let user: User = User(firstName: "firstName", lastName: "LastName", email: "email@email.com", password: "password", age: 0)
        
        // When
        isAValidUser = viewModel.registerUser(userRequest: user)
        
        // Then
        XCTAssertTrue(isAValidUser)
    }
    
    
    func testWhenSendEmailServiceGivenAEmailThenReturnTrue() throws {
        var isAValidUser: Bool = false
        // Given
        let user: User = User(firstName: "firstName", lastName: "LastName", email: "email@email.com", password: "password", age: 0)
        
        // When
        isAValidUser = viewModel.sendEmailService(email: user.email)
        
        // Then
        XCTAssertTrue(isAValidUser)
    }

    
    func testWhenAuthenticateUserGivenMatchParametersThenReturnTrue() throws {
        var isAValidUser: Bool = false
        // Given
        let user: User = User(firstName: "firstName", lastName: "LastName", email: "email@email.com", password: "password", age: 0)
        
                
        // When
        isAValidUser = viewModel.registerUser(userRequest: user)
        
        
        // When
        isAValidUser = viewModel.authenticateUser(email: user.email, password: user.password)
        
        // Then
        XCTAssertTrue(isAValidUser)
    }
    
    func testWhenAuthenticateUserGivenADifferentEmailThenReturnFalse() throws {
        var isAValidUser: Bool = false
        // Given
        let user: User = User(firstName: "firstName", lastName: "LastName", email: "email@email.com", password: "password", age: 0)
        
                
        // When
        isAValidUser = viewModel.registerUser(userRequest: user)
        
        
        // When
        isAValidUser = viewModel.authenticateUser(email: "email2@email.com", password: user.password)
        
        // Then
        XCTAssertFalse(isAValidUser)
    }
    
}

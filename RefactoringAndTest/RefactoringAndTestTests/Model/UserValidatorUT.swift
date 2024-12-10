//
//  UserValidatorUT.swift
//  RefactoringAndTestTests
//
//  Created by BPIMA_ALW1090 on 12/10/24.
//


import XCTest
@testable import RefactoringAndTest

final class UserValidatorUT: XCTestCase {

    
    var viewModel: UserValidator!

    
    override func setUpWithError() throws {
        super.setUp()
        viewModel = UserValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenisValidToRegisterAnUserGivenFirstNameNullThenReturnFalse() throws {
        var isAValidUser: Bool = false
        // Given
        let user: User = User(firstName: "", lastName: "LastName", email: "email@email.com", password: "password", age: 0)
 
        // When
        isAValidUser = viewModel.isValidToRegisterAnUser(userRequest: user)
 
        // Then
        XCTAssertFalse(isAValidUser)
    }
    
    func testWhenisValidToRegisterAnUserGivenLastNameNullThenReturnFalse() throws {
        var isAValidUser: Bool = false
        // Given
        let user: User = User(firstName: "firsName", lastName: "", email: "email@email.com", password: "password", age: 0)
 
        // When
        isAValidUser = viewModel.isValidToRegisterAnUser(userRequest: user)
 
        // Then
        XCTAssertFalse(isAValidUser)
    }
    
    func testWhenisValidToRegisterAnUserGivenEmailNullThenReturnFalse() throws {
        var isAValidUser: Bool = false
        // Given
        let user: User = User(firstName: "firsName", lastName: "lastName", email: "", password: "password", age: 0)
 
        // When
        isAValidUser = viewModel.isValidToRegisterAnUser(userRequest: user)
 
        // Then
        XCTAssertFalse(isAValidUser)
    }

    func testWhenisValidToRegisterAnUserGivenPasswordNullThenReturnFalse() throws {
        var isAValidUser: Bool = false
        // Given
        let user: User = User(firstName: "firsName", lastName: "lastName", email: "email", password: "", age: 0)
 
        // When
        isAValidUser = viewModel.isValidToRegisterAnUser(userRequest: user)
 
        // Then
        XCTAssertFalse(isAValidUser)
    }
    
    
    func testWhenisValidToRegisterAnUserGivenAllTheParametersThenReturnTrue() throws {
        var isAValidUser: Bool = false
        // Given
        let user: User = User(firstName: "firsName", lastName: "lastName", email: "email", password: "password", age: 0)
 
        // When
        isAValidUser = viewModel.isValidToRegisterAnUser(userRequest: user)
 
        // Then
        XCTAssertTrue(isAValidUser)
    }
    
    func testWhenisAValidEmailGivenEmailWithoutArrobaThenReturnFalse() throws {
        var isAValidEmail: Bool = false
        // Given
        let user: User = User(firstName: "firsName", lastName: "lastName", email: "email", password: "password", age: 0)
 
        // When
        isAValidEmail = viewModel.isAValidEmail(email: user.email)
 
        // Then
        XCTAssertFalse(isAValidEmail)
    }
    
    
    func testWhenisAValidEmailGivenEmailWithArrobaThenReturnTrue() throws {
        var isAValidEmail: Bool = false
        // Given
        let user: User = User(firstName: "firsName", lastName: "lastName", email: "email@email", password: "password", age: 0)
 
        // When
        isAValidEmail = viewModel.isAValidEmail(email: user.email)
 
        // Then
        XCTAssertTrue(isAValidEmail)
    }
    
    
    func testWhenisAValidPasswordGivenAShortPasswordThenReturnFalse() throws {
        var isAValidPassword: Bool = false
        // Given
        let user: User = User(firstName: "firsName", lastName: "lastName", email: "email@email", password: "pass", age: 0)
 
        // When
        isAValidPassword = viewModel.isAValidPassword(password: user.password)
 
        // Then
        XCTAssertFalse(isAValidPassword)
    }

    
    func testWhenisAValidPasswordGivenALongPasswordThenReturnTrue() throws {
        var isAValidPassword: Bool = false
        // Given
        let user: User = User(firstName: "firsName", lastName: "lastName", email: "email@email", password: "password", age: 0)
 
        // When
        isAValidPassword = viewModel.isAValidPassword(password: user.password)
 
        // Then
        XCTAssertTrue(isAValidPassword)
    }

    func testWhenisAValidAgeGivenAnAngeLessThan18ThenReturnFalse() throws {
        var isAValidAge: Bool = false
        // Given
        let user: User = User(firstName: "firsName", lastName: "lastName", email: "email@email", password: "pass", age: 0)
 
        // When
        isAValidAge = viewModel.isAValidAge(age: user.age)
 
        // Then
        XCTAssertFalse(isAValidAge)
    }

    
    func testWhenisAValidAgeGivenARightAgeThenReturnTrue() throws {
        var isAValidAge: Bool = false
        // Given
        let user: User = User(firstName: "firsName", lastName: "lastName", email: "email@email", password: "password", age: 18)
 
        // When
        isAValidAge = viewModel.isAValidPassword(password: user.password)
 
        // Then
        XCTAssertTrue(isAValidAge)
    }

}

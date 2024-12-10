//
//  LoginViewModel.swift
//  RefactoringAndTestTests
//
//  Created by BPIMA_ALW1090 on 12/10/24.
//

import XCTest
@testable import RefactoringAndTest

final class LoginViewModelUT: XCTestCase {
    
    var viewModel: LoginViewModel!
    var viewModelRepository: UserRepository!

    override func setUpWithError() throws {
        super.setUp()
        viewModel = LoginViewModel()
        viewModelRepository = UserRepository()
        viewModel.userAuthentication = User(firstName: "", lastName: "", email: "", password: "", age: 0)
    }

    override func tearDownWithError() throws {
        
    }

    func testWhenLoginAuthenticationGivenAllParameterersNullThenReturnFalse() throws {
        
        viewModel.userAuthentication = User(firstName: "", lastName: "", email: "", password: "", age: 0)
        
        let isValidUser = viewModel.loginAuthentication()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Fill all the fields")
    }
    
    func testWhenLoginAuthenticationGivenEmailNullThenReturnFalse() throws {
        
        viewModel.userAuthentication = User(firstName: "firstName", lastName: "lastName", email: "", password: "password", age: 0)
        
        let isValidUser = viewModel.loginAuthentication()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Fill all the fields")
    }
    
    func testWhenLoginAuthenticationGivenPasswordNullThenReturnFalse() throws {
        
        viewModel.userAuthentication = User(firstName: "firstName", lastName: "lastName", email: "email", password: "", age: 0)
        
        let isValidUser = viewModel.loginAuthentication()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Fill all the fields")
    }
    
    func testWhenLoginAuthenticationGivenAWrongEmailThenReturnFalse() throws {
        
        viewModel.userAuthentication = User(firstName: "firstName", lastName: "lastName", email: "email", password: "password", age: 0)
        
        let isValidUser = viewModel.loginAuthentication()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Input a rigth format email")
    }
    
    
    func testWhenLoginAuthenticationGivenAShortPasswordThenReturnFalse() throws {
        
        viewModel.userAuthentication = User(firstName: "firstName", lastName: "lastName", email: "email@email", password: "pass", age: 0)
        
        let isValidUser = viewModel.loginAuthentication()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Input a valid password")
    }
    
    func testWhenLoginAuthenticationGivenNotMatchEmailThenReturnTrue() throws {
        
        viewModel.userAuthentication = User(firstName: "firstName", lastName: "lastName", email: "email@email1.com", password: "password", age: 0)
        
        // Given
        let user: User = User(firstName: "firstName", lastName: "LastName", email: "email@email2.com", password: "password", age: 18)
        
        // When
        viewModelRepository.registerUser(userRequest: user)
        
        let isValidUser = viewModel.loginAuthentication()
        
        XCTAssertTrue(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"User not found. Please try again or register as a new user")
    }
    
    func testWhenLoginAuthenticationGivenNotMatchPasswordThenReturnTrue() throws {
        
        viewModel.userAuthentication = User(firstName: "firstName", lastName: "lastName", email: "email@email1.com", password: "password1", age: 0)
        
        // Given
        let user: User = User(firstName: "firstName", lastName: "LastName", email: "email@email1.com", password: "password2", age: 18)
        
        // When
        viewModelRepository.registerUser(userRequest: user)
        
        let isValidUser = viewModel.loginAuthentication()
        
        XCTAssertTrue(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"User not found. Please try again or register as a new user")
    }
    
    func testWhenLoginAuthenticationGivenARigthUserAndPasswordThenReturnTrue() throws {
        
        viewModel.userAuthentication = User(firstName: "firstName", lastName: "lastName", email: "email@email.com", password: "password", age: 0)
        
        // Given
        let user: User = User(firstName: "firstName", lastName: "LastName", email: "email@email.com", password: "password", age: 18)
        
        // When
        viewModelRepository.registerUser(userRequest: user)
        
        let isValidUser = viewModel.loginAuthentication()
        
        XCTAssertTrue(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Welcome")
    }
    
}

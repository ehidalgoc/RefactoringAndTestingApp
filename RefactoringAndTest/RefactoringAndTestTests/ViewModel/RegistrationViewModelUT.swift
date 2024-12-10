//
//  RegistrationViewModelUT.swift
//  RefactoringAndTestTests
//
//  Created by BPIMA_ALW1090 on 12/10/24.
//

import XCTest
@testable import RefactoringAndTest

final class RegistrationViewModelUT: XCTestCase {

    var viewModel: RegistrationViewModel!
    
    override func setUpWithError() throws {
        super.setUp()
        viewModel = RegistrationViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenRegisterUserGivenAllParameterersNullThenReturnFalse() throws {
        
        viewModel.userRegistrationDetails = User(firstName: "", lastName: "", email: "", password: "", age: 0)
        
        let isValidUser = viewModel.registerUser()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Fill all the fields")
    }
    
    func testWhenRegisterUserGivenFirstNameNullThenReturnFalse() throws {
        
        viewModel.userRegistrationDetails = User(firstName: "", lastName: "lastName", email: "email", password: "password", age: 0)
        
        let isValidUser = viewModel.registerUser()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Fill all the fields")
    }
    
    func testWhenRegisterUserGivenLastNameNullThenReturnFalse() throws {
        
        viewModel.userRegistrationDetails = User(firstName: "firstName", lastName: "", email: "email", password: "password", age: 0)
        
        let isValidUser = viewModel.registerUser()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Fill all the fields")
    }
    
    func testWhenRegisterUserGivenEmailNullThenReturnFalse() throws {
        
        viewModel.userRegistrationDetails = User(firstName: "firstName", lastName: "lastName", email: "", password: "password", age: 0)
        
        let isValidUser = viewModel.registerUser()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Fill all the fields")
    }
    
    func testWhenRegisterUserGivenPasswordNullThenReturnFalse() throws {
        
        viewModel.userRegistrationDetails = User(firstName: "firstName", lastName: "lastName", email: "email", password: "", age: 0)
        
        let isValidUser = viewModel.registerUser()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Fill all the fields")
    }
    
    func testWhenRegisterUserGivenAWrongEmailThenReturnFalse() throws {
        
        viewModel.userRegistrationDetails = User(firstName: "firstName", lastName: "lastName", email: "email", password: "password", age: 0)
        
        let isValidUser = viewModel.registerUser()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Input a rigth format email")
    }
    
    
    func testWhenRegisterUserGivenAShortPasswordThenReturnFalse() throws {
        
        viewModel.userRegistrationDetails = User(firstName: "firstName", lastName: "lastName", email: "email@email", password: "pass", age: 0)
        
        let isValidUser = viewModel.registerUser()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Input a valid password")
    }
    
    
    func testWhenRegisterUserGivenAInvalidAgeThenReturnFalse() throws {
        
        viewModel.userRegistrationDetails = User(firstName: "firstName", lastName: "lastName", email: "email@email", password: "password", age: 0)
        
        let isValidUser = viewModel.registerUser()
        
        XCTAssertFalse(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"Input a valid age")
    }
    
    
    
    func testWhenRegisterUserGivenATheRigthParametersThenReturnTrue() throws {
        
        viewModel.userRegistrationDetails = User(firstName: "firstName", lastName: "lastName", email: "email@email", password: "password", age: 18)
        
        let isValidUser = viewModel.registerUser()
        
        XCTAssertTrue(isValidUser)
        XCTAssertEqual(viewModel.errorMessage,"User saved successfully!")
    }
   

}

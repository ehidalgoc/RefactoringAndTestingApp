A LOGIN AND REGISTER FORMS

Refactored Code:

    Provide the complete refactored codebase, ensuring that all identified code smells have been addressed.


The registerUser method, was moved in terms to validate each corresponding value.


/Users/bpima_alw1090/Documents/Trainings/IOS/Training/RefactoringAndTest/RefactoringAndTestTests/Model
/Users/bpima_alw1090/Documents/Trainings/IOS/Training/RefactoringAndTest/RefactoringAndTestTests/Model/UserRepositoryUT.swift
/Users/bpima_alw1090/Documents/Trainings/IOS/Training/RefactoringAndTest/RefactoringAndTestTests/Model/UserValidatorUT.swift


In the UserValidator class, were adding the follow functions, each of them using to the data validation.

For the loginView: 

    func isValidToRegisterAnUser(userRequest: User) ->Bool
    func isValueNotEmpty(value: String) -> Bool
    struct ValidationError: Error
    func isAValidEmail(email: String) -> Bool 
    func isAValidPassword(password: String) -> Bool
    func isAValidAge(age: Int) -> Bool 


For the user register I use the following methods:

The isValidEmail and isValidPassword method had been being used in order to not duplicate the most code as possible.

 func isValidToAuthenticateAnUser(userRequest: User) ->Bool
 func isAValidEmail(email: String) -> Bool 
 func isAValidPassword(password: String) -> Bool

     

Unit Tests:

These were the Unit Test created to cover the LoginViewModel

func testWhenLoginAuthenticationGivenAllParameterersNullThenReturnFalse()
    
    func testWhenLoginAuthenticationGivenEmailNullThenReturnFalse()
    
    func testWhenLoginAuthenticationGivenPasswordNullThenReturnFalse()
    
    func testWhenLoginAuthenticationGivenAWrongEmailThenReturnFalse()
    
    func testWhenLoginAuthenticationGivenAShortPasswordThenReturnFalse()
    
    func testWhenLoginAuthenticationGivenNotMatchEmailThenReturnTrue()
    
    func testWhenLoginAuthenticationGivenNotMatchPasswordThenReturnTrue()
    
    func testWhenLoginAuthenticationGivenARigthUserAndPasswordThenReturnTrue()

There were the Unit Test to cover the RegistrationViewModel

    func testWhenRegisterUserGivenAllParameterersNullThenReturnFalse()
    
    func testWhenRegisterUserGivenFirstNameNullThenReturnFalse()
    
    func testWhenRegisterUserGivenLastNameNullThenReturnFalse() 
    
    func testWhenRegisterUserGivenEmailNullThenReturnFalse()
    
    func testWhenRegisterUserGivenPasswordNullThenReturnFalse()
    
    func testWhenRegisterUserGivenAWrongEmailThenReturnFalse()
    
    func testWhenRegisterUserGivenAShortPasswordThenReturnFalse()

    func testWhenRegisterUserGivenAInvalidAgeThenReturnFalse() 
    
    func testWhenRegisterUserGivenATheRigthParametersThenReturnTrue()



There were the Unit Test to cover the UserValidator Util

    func testWhenisValidToRegisterAnUserGivenFirstNameNullThenReturnFalse()
    
    func testWhenisValidToRegisterAnUserGivenLastNameNullThenReturnFalse()
    
    func testWhenisValidToRegisterAnUserGivenEmailNullThenReturnFalse() 

    func testWhenisValidToRegisterAnUserGivenPasswordNullThenReturnFalse()
    
    func testWhenisValidToRegisterAnUserGivenAllTheParametersThenReturnTrue()
    
    func testWhenisAValidEmailGivenEmailWithoutArrobaThenReturnFalse()
    
    func testWhenisAValidEmailGivenEmailWithArrobaThenReturnTrue()=
    
    func testWhenisAValidPasswordGivenAShortPasswordThenReturnFalse()

    func testWhenisAValidPasswordGivenALongPasswordThenReturnTrue()

    func testWhenisAValidAgeGivenAnAngeLessThan18ThenReturnFalse()

    func testWhenisAValidAgeGivenARightAgeThenReturnTrue()

There were the Unit Test to cover the UserRepository

    func testWhenRegisterUserGivenAllParametersThenReturnTrue() 
    
    func testWhenSendEmailServiceGivenAEmailThenReturnTrue()
    
    func testWhenAuthenticateUserGivenMatchParametersThenReturnTrue()
    
    func testWhenAuthenticateUserGivenADifferentEmailThenReturnFalse()


Code Review Report:

    Submit a brief report summarizing the changes you made during refactoring.

This is a simple app with a loginPage, and a RegisterForm to add an user, include some code to validate empty values, some specific formats as the email o length of the password, validate if an user exist, between others.

    Include how each refactoring technique was applied to address specific code smells.
    Use and object instead of pass all the parameters separated.

    We use and object instead of pass all the parameters in the save of the User.
	

    Highlight how SOLID principles were adhered to in the refactored code.


S-- There are separate package structures that allow to identify and split the functionality depend on if is database, validations, controllers, models, viewModels and Views. 
O--Not applied
L--Not applied
I-- There are separate package structures that allow to identify and split the functionality depend on if is database, validations, controllers, models, viewModels and Views. 
D--Not applied








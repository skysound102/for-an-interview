//
//  LikePhotoTests.swift
//  LikePhotoTests
//
//  Created by Артем on 02.07.2023.
//

import XCTest
@testable import LikePhoto
final class LikePhotoTests: XCTestCase {

    var fieldValidator : ViewController!
    
    override func setUpWithError() throws {
        fieldValidator = ViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        fieldValidator = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        fieldValidator.nameField.text! = "Павел"
        fieldValidator.passwordField.text! = "133"
        fieldValidator.find(value: fieldValidator.nameField.text!, searchValue2: fieldValidator.passwordField.text!, in:  Base.shared.baseArray)
        
        XCTAssertEqual(fieldValidator.nameField.text!, fieldValidator.person)
   
  
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
       
        
        
    
    }
    func testExample2() throws {
        fieldValidator.nameField.text! = "Павел2"
        fieldValidator.passwordField.text! = "1332"
        fieldValidator.find(value: fieldValidator.nameField.text!, searchValue2: fieldValidator.passwordField.text!, in:  Base.shared.baseArray)
        
        XCTAssertNotEqual(fieldValidator.nameField.text!, fieldValidator.person)
  
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
       
        
        
    
    }
    
    func testExample3() throws {
   
        let button = fieldValidator.buttonLogIn
        button.addAction(UIAction(handler: { [weak self] _ in
            
            self!.fieldValidator.find(value:  self!.fieldValidator.nameField.text!, searchValue2:  self!.fieldValidator.passwordField.text!, in: Base.shared.baseArray)
 
        }), for: .touchUpInside)


        XCTAssertEqual(fieldValidator.nameField.text!, fieldValidator.person)
    }

    
    
    func testExample4() throws {

        let backImage = UIImage(named: "")  ?? UIImage()
        fieldValidator.view.backgroundColor = UIColor(patternImage: backImage)

        XCTAssert(backImage == UIImage())
    }
    
    



    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

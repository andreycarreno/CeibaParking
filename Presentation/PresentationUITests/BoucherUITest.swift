//
//  BoucherUITest.swift
//  PresentationUITests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 2/09/21.
//

import XCTest

class BoucherUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFinalizeParkingByMotorcycle(){
        let app = XCUIApplication()
        
        _ = HomeScreenObject(app: app).tapBoucherButton()
        
        _ = BoucherScreenObject(app: app)
            .tapTypeVehicleTextField()
            .tapPickerWheels("Moto")
            .tapSearchPlateTextField("abc123")
            .tapFinalizeButton()
        
    }
    
    func testFinalizeParkingByCar(){
        // Arrange
        let app = XCUIApplication()
        
        // Act
        _ = HomeScreenObject(app: app).tapBoucherButton()
        // Assert
        _ = BoucherScreenObject(app: app)
            .tapTypeVehicleTextField()
            .tapPickerWheelsDown("Moto")
            .tapSearchPlateTextField("abb123")
            .tapFinalizeButton()
        
    }
}

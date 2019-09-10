//
//  DemoUITests.swift
//  DemoUITests
//
//  Created by Martin Kim Dung-Pham on 08.09.19.
//  Copyright © 2019 Martin Kim Dung-Pham. All rights reserved.
//

import XCTest
import StubbornNetwork

class DemoUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()

        app.launchEnvironment["TESTING"] = "TESTING"
        app.launchEnvironment["STUB_NAME"] = self.name

        let processInfo = ProcessInfo()
        app.launchEnvironment["STUB_PATH"] = processInfo.environment["PROJECT_DIR"]
        app.launch()
    }

    func testBytesText() {
        let bytesText = app.staticTexts["417 bytes"]
        wait(forElement:bytesText, timeout:2)
    }

    func testMoreBytesText() {
        let bytesText = app.staticTexts["417 bytes"]
        wait(forElement:bytesText, timeout:2)
    }

}

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

        /// tell the app that we are executing tests right now
        app.launchEnvironment["TESTING"] = "TESTING"

        /// ... each stub's name will be the name of the test case
        app.launchEnvironment["STUB_NAME"] = self.name

        ///  .. and path to the stubs will be set to the project's directory
        let processInfo = ProcessInfo()
        app.launchEnvironment["STUB_PATH"] = "\(processInfo.environment["PROJECT_DIR"] ?? "")/stubs"
        app.launch()
    }

    func testBytesText() {
        /// In the test itself everything happens like with an untampered URLSession
        let bytesText = app.staticTexts["417 bytes"]
        wait(forElement:bytesText, timeout:2)
    }

    func testMoreBytesText() {
        /// Multiple tests will create multiple json files at the given path.
        let bytesText = app.staticTexts["417 bytes"]
        wait(forElement:bytesText, timeout:2)
    }

}

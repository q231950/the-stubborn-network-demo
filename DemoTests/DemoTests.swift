//
//  DemoTests.swift
//  DemoTests
//
//  Created by Martin Kim Dung-Pham on 08.09.19.
//  Copyright © 2019 Martin Kim Dung-Pham. All rights reserved.
//

import XCTest
@testable import Demo
import StubbornNetwork
import Combine

class DemoTests: XCTestCase {

    var completion: AnyCancellable!

    func testExample() {
        let exp = expectation(description: "Wait for publisher")

        /// given
        let session = StubbornNetwork.makeEphemeralSession({ (stubbedSession) in // we make an ephemeral URLSession
            stubbedSession.stub(NetworkClient.request, data: self.stubData, response: HTTPURLResponse(), error: nil) // and stub individual requests within this closure
        })
        let networkClient = NetworkClient(urlSession: session) // pass the session, fail it for the actual request.

        /// when
        networkClient.post()

        /// then
        completion = networkClient.objectDidChange.sink { networkClient in
            XCTAssertEqual(networkClient.text, "417 bytes")
            exp.fulfill()
        }

        wait(for: [exp], timeout: 0.001)
    }

    var stubData: Data {
        get {
            return
                """
                {\"args\":{},\"data\":{\"message\":\"Hello world!\"},\"files\":{},\"form\":{},\"headers\":{\"x-forwarded-proto\":\"https\",\"host\":\"postman-echo.com\",\"content-length\":\"30\",\"accept\":\"*/*\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"en-us\",\"content-type\":\"application/json\",\"user-agent\":\"Demo/1 CFNetwork/1098.7 Darwin/19.0.0\",\"x-forwarded-port\":\"443\"},\"json\":{\"message\":\"Hello world!\"},\"url\":\"https://postman-echo.com/post\"}
                """.data(using: .utf8)!
        }
    }
}

//
//  NetworkClient.swift
//  Demo
//
//  Created by Martin Kim Dung-Pham on 08.09.19.
//  Copyright © 2019 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation
import Combine

class NetworkClient: ObservableObject {
    var objectWillChange = PassthroughSubject<NetworkClient, Never>()
    var text: String = "" {
        willSet {
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }

    var title: String = "" {
        willSet {
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }

    let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func post() {
        title = "Posting to `https://postman-echo.com`"
        text = "loading..."

        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            self.text = data.text
        }
        dataTask.resume()
    }

    var request: URLRequest {
        get {
            var request = URLRequest(url: URL(string: "https://postman-echo.com/post")!)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = ["Content-Type":"application/json"]
            request.httpBody = """
                {"message":"Hello world!"}
            """.data(using: .utf8)
            return request
        }
    }
}

extension Data {
    var text: String {
        get {
            let numberFormatter = ByteCountFormatter()
            numberFormatter.allowedUnits = [.useMB, .useKB, .useBytes]
            return numberFormatter.string(fromByteCount: Int64(self.count))
        }
    }
}

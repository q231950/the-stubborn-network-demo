//
//  ContentView.swift
//  Demo
//
//  Created by Martin Kim Dung-Pham on 08.09.19.
//  Copyright © 2019 Martin Kim Dung-Pham. All rights reserved.
//

import SwiftUI
import StubbornNetwork

struct ContentView: View {
    @ObservedObject var networkClient: NetworkClient
    var body: some View {
        VStack(content: {
            BuggoBearView()
            Text(networkClient.title).fontWeight(.bold)
            Text(networkClient.text)
        }).onAppear {
            self.networkClient.post()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        let urlSession = URLSession(configuration: .ephemeral)
        let urlSession = StubbornNetwork.stubbed { (session) in
//            session.recordMode = .recording

            let path = URL(string: ProcessInfo().environment["PROJECT_DIR"]!)!
            session.setupStubSource(name: "ContentView_Previews", path: path)
        }
        let networkClient = NetworkClient(urlSession: urlSession)

        return ContentView(networkClient: networkClient)
    }
}

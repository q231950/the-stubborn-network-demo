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
            /// 1. The `post()` method is called when the VStack appears
            self.networkClient.post()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        let urlSession = StubbornNetwork.makePersistentSession(withName: "ContentView_Previews", path: "\(ProcessInfo().environment["PROJECT_DIR"] ?? "")/stubs", { (session) in
            /// 2. `.playback` is the default
            session.recordMode = .playback
        })

        let networkClient = NetworkClient(urlSession: urlSession)

        return ContentView(networkClient: networkClient)
    }
}

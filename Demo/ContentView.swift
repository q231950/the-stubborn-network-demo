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

        let urlSession = StubbornNetwork.makePersistentSession(withName: "ContentView_Previews", path: "\(ProcessInfo().environment["PROJECT_DIR"] ?? "")/stubs")
        /// `.playback` is the default, so after recording you can remove the following line or set it to .playback
        urlSession.recordMode = .recording

        let networkClient = NetworkClient(urlSession: urlSession)

        return ContentView(networkClient: networkClient)
    }
}

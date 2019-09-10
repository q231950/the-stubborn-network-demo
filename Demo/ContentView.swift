//
//  ContentView.swift
//  Demo
//
//  Created by Martin Kim Dung-Pham on 08.09.19.
//  Copyright © 2019 Martin Kim Dung-Pham. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkClient: NetworkClient
    var body: some View {
        VStack(content: {
            Text(networkClient.title).fontWeight(.bold)
            Text(networkClient.text)
        }).onAppear {
            self.networkClient.post()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let urlSession = URLSession(configuration: .ephemeral)
        let networkClient = NetworkClient(urlSession: urlSession)

        return ContentView(networkClient: networkClient)
    }
}

//
//  SceneDelegate.swift
//  Demo
//
//  Created by Martin Kim Dung-Pham on 08.09.19.
//  Copyright © 2019 Martin Kim Dung-Pham. All rights reserved.
//

import UIKit
import SwiftUI
import StubbornNetwork

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let urlSession: URLSession
        let processInfo = ProcessInfo()

        if processInfo.testing == false {
            urlSession = URLSession(configuration: .ephemeral)
        } else {
            /// The session is persistent, which means that stubs are stored
            let session = StubbornNetwork.makePersistentSession()

            /// `.playback` is the default, so after recording you can remove the following line or set it to .playback
            session.recordMode = .recording
            urlSession = session
        }

        let networkClient = NetworkClient(urlSession: urlSession)

        let contentView = ContentView(networkClient: networkClient)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

extension ProcessInfo {
    var testing: Bool {
        get {
            return environment["TESTING"] != nil
        }
    }
}


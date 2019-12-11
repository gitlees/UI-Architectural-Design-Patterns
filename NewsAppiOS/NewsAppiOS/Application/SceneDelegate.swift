//
//  SceneDelegate.swift
//  NewsAppiOS
//
//  Created by Stas Lee on 12/1/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import UIKit
import Feed
import MVC
import MVP

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private let remoteURL = URL(string: "https://newsapi.org/v2/top-headlines?apiKey=bf8715ec9ea14cdc82fe6ceea6d96a06&country=us")!
    private lazy var remoteClient = makeRemoteClient()
    private lazy var remoteFeedLoader = RemoteFeedLoader(url: remoteURL, client: remoteClient)
    private lazy var remoteImageLoader = RemoteFeedImageDataLoader(client: remoteClient)
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = makeRootViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    private func makeRootViewController() -> UIViewController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [mvc(), mvp()]
        return tabBar
    }

    private func mvc() -> UIViewController {

        let view = UINavigationController(
            rootViewController: MVC.FeedUIComposer.feedComposedWith(
                feedLoader: remoteFeedLoader,
                imageLoader: remoteImageLoader))
        view.tabBarItem.title = "MVC"
        return view
    }
    
    private func mvp() -> UIViewController {

        let view = UINavigationController(
            rootViewController: MVP.FeedUIComposer.feedComposedWith(
                feedLoader: remoteFeedLoader,
                imageLoader: remoteImageLoader))
        view.tabBarItem.title = "MVP"
        return view
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
    
    private func makeRemoteClient() -> HTTPClient {
        return URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
    }


}


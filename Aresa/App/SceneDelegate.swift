//
//  SceneDelegate.swift
//  Aresa
//
//  Created by aamaulana10 on 25/03/21.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
        
    let homeUseCase      = Injection.init().provideHome()
//    let favouriteUseCase = Injection.init().provideFavourite()
//    let userUseCase      = Injection.init().provideUser()

    let homePresenter      = HomePresenter(homeUseCase: homeUseCase)
//    let favouritePresenter = FavouritePresenter(favouriteUseCase: favouriteUseCase)
//    let profilePresenter   = ProfilePresenter(usecase: userUseCase)
    
    let contentView = ContentView()
      .environmentObject(homePresenter)

    // Use a UIHostingController as window root view controller.
    if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
    }
  }

  func sceneDidDisconnect(_ scene: UIScene) {}

  func sceneDidBecomeActive(_ scene: UIScene) {}

  func sceneWillResignActive(_ scene: UIScene) {}

  func sceneWillEnterForeground(_ scene: UIScene) {}

  func sceneDidEnterBackground(_ scene: UIScene) {}

}

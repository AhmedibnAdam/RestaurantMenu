//
//  SceneDelegate.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
           window = UIWindow(frame: windowScene.coordinateSpace.bounds)
           window?.windowScene = windowScene
           let vc = CategoriesConfiguration.setup()
           window?.setRootViewController(vc)
           window?.makeKeyAndVisible()
    }



}


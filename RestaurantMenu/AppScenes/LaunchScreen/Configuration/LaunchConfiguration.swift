//
//  LaunchConfiguration.swift
//  RestaurantMenu
//
//  Created by Adam on 24/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import UIKit

class LaunchConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = LaunchViewController()
        let router = LaunchRouter(view: controller)
        let presenter = LaunchPresenter(view: controller)
        let worker = LaunchWorker()
        let interactor = LaunchInteractor(presenter: presenter, worker: worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}

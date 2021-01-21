//
//  ProductsConfiguration.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import UIKit

class ProductsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ProductsViewController()
        let router = ProductsRouter(view: controller)
        let presenter = ProductsPresenter(view: controller)
        let worker = ProductsWorker()
        let interactor = ProductsInteractor(presenter: presenter, worker: worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}

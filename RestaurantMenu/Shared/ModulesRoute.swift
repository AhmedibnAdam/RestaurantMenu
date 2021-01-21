//
//  ModulesRoute.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam/

import Foundation
import UIKit

enum ModulesRoute: IRouter {
    case categories
    case products
}

extension ModulesRoute {
    var module: UIViewController? {
        switch self {
        case .categories:
            return CategoriesConfiguration.setup()
        case .products:
            return ProductsConfiguration.setup()
        }
    }
}

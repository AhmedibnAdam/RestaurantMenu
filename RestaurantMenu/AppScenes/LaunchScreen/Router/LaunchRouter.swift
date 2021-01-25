//
//  LaunchRouter.swift
//  RestaurantMenu
//
//  Created by Adam on 24/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ILaunchRouter: class {
	func navigateToCategories()
}

class LaunchRouter: ILaunchRouter {	
	weak var view: LaunchViewController?
	
	init(view: LaunchViewController?) {
		self.view = view
	}
    func navigateToCategories(){
        view?.navigate(type: .modalWithNavigation, module: ModulesRoute.categories, completion: nil)
    }
}

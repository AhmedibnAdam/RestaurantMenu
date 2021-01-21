//
//  CategoriesRouter.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ICategoriesRouter: class {
	// do someting...
}

class CategoriesRouter: ICategoriesRouter {	
	weak var view: CategoriesViewController?
	
	init(view: CategoriesViewController?) {
		self.view = view
	}
}

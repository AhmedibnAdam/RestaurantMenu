//
//  CategoriesPresenter.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ICategoriesPresenter: class {
	// do someting...
}

class CategoriesPresenter: ICategoriesPresenter {	
	weak var view: ICategoriesViewController?
	
	init(view: ICategoriesViewController?) {
		self.view = view
	}
}

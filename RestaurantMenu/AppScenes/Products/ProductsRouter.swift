//
//  ProductsRouter.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IProductsRouter: class {
	// do someting...
}

class ProductsRouter: IProductsRouter {	
	weak var view: ProductsViewController?
	
	init(view: ProductsViewController?) {
		self.view = view
	}
}

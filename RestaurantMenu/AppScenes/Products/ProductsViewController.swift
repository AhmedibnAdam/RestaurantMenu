//
//  ProductsViewController.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IProductsViewController: class {
	var router: IProductsRouter? { get set }
}

class ProductsViewController: UIViewController {
	var interactor: IProductsInteractor?
	var router: IProductsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ProductsViewController: IProductsViewController {
	// do someting...
}

extension ProductsViewController {
	// do someting...
}

extension ProductsViewController {
	// do someting...
}

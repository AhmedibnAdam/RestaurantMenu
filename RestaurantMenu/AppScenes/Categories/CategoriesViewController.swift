//
//  CategoriesViewController.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ICategoriesViewController: class {
	var router: ICategoriesRouter? { get set }
}

class CategoriesViewController: UIViewController {
	var interactor: ICategoriesInteractor?
	var router: ICategoriesRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension CategoriesViewController: ICategoriesViewController {
	// do someting...
}

extension CategoriesViewController {
	// do someting...
}

extension CategoriesViewController {
	// do someting...
}

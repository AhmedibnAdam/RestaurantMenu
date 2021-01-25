//
//  LaunchPresenter.swift
//  RestaurantMenu
//
//  Created by Adam on 24/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ILaunchPresenter: class {
    func showProducts(products: ProductsModel.Response)
    func showCategories(cats: CategoriesModel.Categories)
    func showProducts()
    func showCategories()
    func handleError()
}

class LaunchPresenter: ILaunchPresenter {

    weak var view: ILaunchViewController?
	
	init(view: ILaunchViewController?) {
		self.view = view
	}
    func showProducts(products: ProductsModel.Response) {
        view?.showProducts(products:products)
    }
    func showProducts() {
    }
    func showCategories(cats: CategoriesModel.Categories) {
        view?.showCategories(cats: cats)
    }
    func showCategories(){
        view?.showCategories()
    }
    func handleError() {
        view?.handleError()
    }
}

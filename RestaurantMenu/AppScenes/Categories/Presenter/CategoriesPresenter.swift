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
    func showCats(cats: CategorieRealmsModel)
    func showProducts(products: ProductsRealmsModel)
}

class CategoriesPresenter: ICategoriesPresenter {
 

	weak var view: ICategoriesViewController?
	
	init(view: ICategoriesViewController?) {
		self.view = view
	}
    func showCats(cats: CategorieRealmsModel) {
        view?.showCategories(categories: cats)
    }
    func showProducts(products: ProductsRealmsModel){
        view?.showProducts(products: products)
    }
    
}

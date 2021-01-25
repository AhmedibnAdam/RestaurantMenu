//
//  LaunchViewController.swift
//  RestaurantMenu
//
//  Created by Adam on 24/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ILaunchViewController: class {
	var router: ILaunchRouter? { get set }
    func showProducts(products: ProductsModel.Response)
    func showCategories(cats: CategoriesModel.Categories)
    func showCategories()
   
}

class LaunchViewController: UIViewController {
	var interactor: ILaunchInteractor?
	var router: ILaunchRouter?

 
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategories()
        getProducts()
    }
    fileprivate func getCategories() {
        interactor?.getCategories()
    }
    fileprivate func getProducts() {
        interactor?.getProducts()
    }
  
    
}

extension LaunchViewController: ILaunchViewController {

    func showProducts(products : ProductsModel.Response) {
        persistProducts(products: products)
    }
    func showCategories(cats: CategoriesModel.Categories) {
        persisCategories(categories: cats)
    }
    func showCategories() {
        router?.navigateToCategories()
    }

    fileprivate func persistProducts(products: ProductsModel.Response) {
        interactor?.addListOfProductsToCash(cat: products)
    }
    fileprivate func persisCategories(categories: CategoriesModel.Categories) {
        interactor?.addListOfCategoriesToCash(cat: categories)
    }
}

extension LaunchViewController {
	// do someting...
}

extension LaunchViewController {
	// do someting...
}

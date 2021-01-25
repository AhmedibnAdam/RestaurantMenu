//
//  CategoriesInteractor.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ICategoriesInteractor: class {
	var parameters: [String: Any]? { get set }
    func getCategoriesFromRealm()
    func getProductsFromRealm()
}

class CategoriesInteractor: ICategoriesInteractor {
    func getCategories() {
        
    }
    
    var presenter: ICategoriesPresenter?
    var worker: ICategoriesWorker?
    var parameters: [String: Any]?

    init(presenter: ICategoriesPresenter, worker: ICategoriesWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
    func getCategoriesFromRealm(){
        worker?.getCats(complition: { (error, success, data) in
            if success {
                guard let catsData = data else {
                    return
                }
                self.presenter?.showCats(cats: catsData)
            }
        })
    }
    func getProductsFromRealm(){
        worker?.getProducts(complition: { (error, success, data) in
            if success {
                guard let productsData = data else {
                    return
                }
                self.presenter?.showProducts(products: productsData)
            }
        })
    }
}

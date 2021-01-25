//
//  LaunchInteractor.swift
//  RestaurantMenu
//
//  Created by Adam on 24/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ILaunchInteractor: class {
	var parameters: [String: Any]? { get set }
    func getProducts()
    func getCategories()
    func addListOfProductsToCash(cat: ProductsModel.Response)
    func addListOfCategoriesToCash(cat: CategoriesModel.Categories)
}

class LaunchInteractor: ILaunchInteractor {

    var presenter: ILaunchPresenter?
    var worker: ILaunchWorker?
    var parameters: [String: Any]?

    init(presenter: ILaunchPresenter, worker: ILaunchWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
    func getProducts() {
        worker?.getProducts(complition: { (error, success, responce) in
            if success {
                self.presenter?.showProducts(products: responce!)
            }
            else{
                
            }
        })
    }
    func getCategories(){
        worker?.getCategories(complition: { (error, success, responce) in
            if success {
                self.presenter?.showCategories(cats: responce!)
            }
            else{
                
            }
        })
    }
    
    func addListOfProductsToCash(cat: ProductsModel.Response) {
        worker?.addListToCash(cat)
        presenter?.showProducts()
    }
    func addListOfCategoriesToCash(cat: CategoriesModel.Categories){
        worker?.addCatsToCash(cat)
        presenter?.showCategories()
    }
 
}

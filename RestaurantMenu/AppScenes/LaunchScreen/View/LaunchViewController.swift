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
import RealmSwift

protocol ILaunchViewController: class {
	var router: ILaunchRouter? { get set }
    func showProducts(products: ProductsModel.Response)
    func showCategories(cats: CategoriesModel.Categories)
    func showCategories()
    func handleError()
}

class LaunchViewController: UIViewController {
	var interactor: ILaunchInteractor?
	var router: ILaunchRouter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
            getCategories()
    }
    
    fileprivate func getCategories() {
        interactor?.getCategories()
    }
    
    fileprivate func getProducts() {
        interactor?.getProducts()
    }
  
}

extension LaunchViewController: ILaunchViewController {
    
    func showCategories(cats: CategoriesModel.Categories) {
        persisCategories(categories: cats)
        getProducts()
    }

    func showProducts(products : ProductsModel.Response) {
        persistProducts(products: products)
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
    func handleError() {
        Utilites.showAlert(alertTitle: "Alert", alertMessage: "Connection error , Re-downloading caregories ...", cancelTitle: "Cancel", otherTitle: "Re-download", VC: self) { (ok) in
            if (ok != 0) {
                guard RealmManager.shared.getObjectOf(type: CategorieRealmsModel.self).last != nil else {
                    self.getCategories()
                    return
                }
                self.showCategories()
            }
            else{
                guard RealmManager.shared.getObjectOf(type: CategorieRealmsModel.self).last != nil else {
                    self.getCategories()
                    return
                }
                self.showCategories()
            }
        }
        
    }
}


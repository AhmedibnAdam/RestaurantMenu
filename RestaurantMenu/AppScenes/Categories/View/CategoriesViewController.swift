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
import Kingfisher
import RealmSwift

protocol ICategoriesViewController: class {
    var router: ICategoriesRouter? { get set }
    func showCategories(categories: CategorieRealmsModel)
    func showProducts(products: ProductsRealmsModel)
}

class CategoriesViewController: UIViewController {
    var interactor: ICategoriesInteractor?
    var router: ICategoriesRouter?
    let cellID = "CategoriesCollectionViewCell"
    var realmCats: CategorieRealmsModel?
    var realmProducts: ProductsRealmsModel?
    var productsForCategory = List<ProductsDatum>()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        registerCollectionCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCategories()
        getProducts()
    }
    fileprivate func getCategories() {
        interactor?.getCategoriesFromRealm()
    }
    fileprivate func getProducts()  {
        interactor?.getProductsFromRealm()
    }
    func getProductsForCategory(cat:CategorieDatum) {
        
        let products = self.realmProducts?.data.filter({$0.category?.name == cat.name})
        for p in products! {
            productsForCategory.append(p)
        }
    }
}
extension CategoriesViewController {
    func setupNavigationBar() {
        navigationItem.title = "Categories"
    }
    func registerCollectionCell() {
        let cell = UINib(nibName: cellID, bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: cellID)
    }
}

extension CategoriesViewController: ICategoriesViewController {
    func showCategories(categories: CategorieRealmsModel) {
        print(categories)
        self.realmCats = categories
        self.collectionView.reloadData()
    }
    func showProducts(products: ProductsRealmsModel){
        self.realmProducts = products
    }
}

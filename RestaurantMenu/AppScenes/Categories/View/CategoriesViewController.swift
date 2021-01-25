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
extension CategoriesViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realmCats?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CategoriesCollectionViewCell
        let cat = realmCats?.data[indexPath.row]
        cell.title.text = cat?.name
        let url = URL(string: cat!.image)
        cell.img.kf.setImage(with: url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wifth = (collectionView.bounds.width - 30 )/3.0
        let yourHeight = wifth

        return CGSize(width: wifth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cat = self.realmCats?.data[indexPath.row]
        getProductsForCategory(cat: cat!)
        if (self.productsForCategory.count > 0) {
        
            router?.navigateToProducts(parameters: ["productsForCategory": productsForCategory])
        
        } else {
            
            Utils.showErrorAlert(message: Utils.getStringWithTag(tag: "No products found for this category"), VC: self)
        }
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



extension CategoriesViewController {
	// do someting...
}

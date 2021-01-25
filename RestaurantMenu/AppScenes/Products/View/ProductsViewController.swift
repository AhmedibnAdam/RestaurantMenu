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
import RealmSwift

protocol IProductsViewController: class {
	var router: IProductsRouter? { get set }
}

class ProductsViewController: UIViewController {
    var interactor: IProductsInteractor?
    var router: IProductsRouter?
    
    var productsForCategory = List<ProductsDatum>()
    let cellID = "CategoriesCollectionViewCell"
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(title: "back", style: .done, target: self, action: #selector(backBtntapped))
    }()
    
    @objc func backBtntapped() {
        router?.backToCategories()
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        registerCollectionCell()
    }
    func presentProductDetails(fromVC:UIViewController,product:ProductsDatum) {
        
        let vc = Utilites.getStoryboard(StoryboardId: "Main").instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
         
         vc.modalPresentationStyle = .custom
         vc.product = product
         fromVC.present(vc, animated: false, completion: nil)
         
     }
}

extension ProductsViewController: IProductsViewController {
	// do someting...
}

extension ProductsViewController {
    func setupNavigationBar() {
        navigationItem.title = productsForCategory[0].category?.name
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func registerCollectionCell() {
        let cell = UINib(nibName: cellID, bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: cellID)
       
    }
}


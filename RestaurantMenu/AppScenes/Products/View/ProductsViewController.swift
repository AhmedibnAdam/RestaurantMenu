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
}

extension ProductsViewController: IProductsViewController {
	// do someting...
}

extension ProductsViewController {
    func setupNavigationBar() {
        navigationItem.title = "Social Page"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func registerCollectionCell() {
        let cell = UINib(nibName: cellID, bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: cellID)
       
    }
}

extension ProductsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsForCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CategoriesCollectionViewCell
        let product = productsForCategory[indexPath.row]
        cell.title.text = product.name
        let url = URL(string: product.image)
        cell.img.kf.setImage(with: url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wifth = (collectionView.bounds.width - 30 )/3.0
        let yourHeight = wifth

        return CGSize(width: wifth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

    }
   
}

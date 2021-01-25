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
    
    var productsControllers = [UIViewController]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewPages()
        setupNavigationBar()
        registerCollectionCell()
    }
    fileprivate func setUpViewPages() {
        let vc = ProductsViewController()
        productsControllers.append(vc)
        
        let vc2 = ProductsViewController()
        productsControllers.append(vc2)
    }
    func presentPageVC(){
        guard let first = productsControllers.first else{
            return
        }
        let vc = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        vc.delegate = self
        vc.dataSource = self
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
    }
    
    func presentProductDetails(fromVC:UIViewController,product:ProductsDatum) {
        
        let vc = Utilites.getStoryboard(StoryboardId: "Main").instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
         
         vc.modalPresentationStyle = .custom
         vc.product = product
         fromVC.present(vc, animated: false, completion: nil)
         
     }
}

extension ProductsViewController: IProductsViewController {
	
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
extension ProductsViewController: UIPageViewControllerDelegate , UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = productsControllers.firstIndex(of: viewController), index > 0  else {
            return nil
        }
        let bafore = index - 1
        return productsControllers[bafore]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = productsControllers.firstIndex(of: viewController), index <  productsControllers.count - 1  else {
            return nil
        }
        let after = index + 1
        return productsControllers[after]
    }
}

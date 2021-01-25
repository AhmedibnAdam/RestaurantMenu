//
//  ProductsInteractor.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IProductsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class ProductsInteractor: IProductsInteractor {
    var presenter: IProductsPresenter?
    var worker: IProductsWorker?
    var parameters: [String: Any]?

    init(presenter: IProductsPresenter, worker: IProductsWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
}

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
}

class CategoriesInteractor: ICategoriesInteractor {
    var presenter: ICategoriesPresenter?
    var worker: ICategoriesWorker?
    var parameters: [String: Any]?

    init(presenter: ICategoriesPresenter, worker: ICategoriesWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
}

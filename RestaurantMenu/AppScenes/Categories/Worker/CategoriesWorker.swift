//
//  CategoriesWorker.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation

protocol ICategoriesWorker: class {
    func getCats(complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: CategorieRealmsModel?)->Void)
    func getProducts(complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: ProductsRealmsModel?)->Void)
}

class CategoriesWorker: ICategoriesWorker {
 
    func getCats(complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: CategorieRealmsModel?)->Void){
            guard let retrivedData = RealmManager.shared.getObjectOf(type: CategorieRealmsModel.self).last else {return}
            print(retrivedData)
            complition(nil, true, retrivedData)
    }
    func getProducts(complition: @escaping (Error?, Bool, ProductsRealmsModel?) -> Void) {
        guard let retrivedData = RealmManager.shared.getObjectOf(type: ProductsRealmsModel.self).last else {return}
        print(retrivedData)
        complition(nil, true, retrivedData)
    }
    
}

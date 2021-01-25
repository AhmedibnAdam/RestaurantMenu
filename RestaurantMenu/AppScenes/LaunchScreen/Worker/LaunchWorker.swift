//
//  LaunchWorker.swift
//  RestaurantMenu
//
//  Created by Adam on 24/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation

protocol ILaunchWorker: class {
    func getProducts( complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: ProductsModel.Response?)->Void)
    func getCategories( complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: CategoriesModel.Categories?)->Void)
    func addCatsToCash(_ cat: CategoriesModel.Categories)
    func addListToCash(_ cat: ProductsModel.Response)
}

class LaunchWorker: ILaunchWorker {
    func getProducts(complition: @escaping (Error?, Bool, ProductsModel.Response?) -> Void) {
        NetworkService.share.request(endpoint: LaunchEndpoint.products, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(ProductsModel.Response.self, from: response)
                print(data)
                complition(nil, true, data)
                
            } catch let error {
                print(error)
                complition(nil, false, nil)
            }
            
        }) { (error) in
            print(error as Any)
             complition(nil, false, nil)
        }
    }
    
    func getCategories( complition :  @escaping (_ error:Error? ,_ success: Bool,_ data: CategoriesModel.Categories?)->Void){
        NetworkService.share.request(endpoint: LaunchEndpoint.categories, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(CategoriesModel.Categories.self, from: response)
                print(data)
                complition(nil, true, data)
                
            } catch let error {
                print(error)
                complition(nil, false, nil)
            }
            
        }) { (error) in
            print(error as Any)
             complition(nil, false, nil)
        }
    }
    func addCatsToCash(_ cat: CategoriesModel.Categories){
        DispatchQueue.global(qos: .background).async {
            let realmObject = CategorieRealmsModel()
            for category in cat.data! {
                let realmCat = CategorieDatum()
                realmCat.id = category.id!
                realmCat.image = category.image ?? ""
                realmCat.name = category.name!
                realmObject.data.append(realmCat)
            }
            RealmManager.shared.addObject(realmObject: realmObject , andCompletion : {
                (addResult) in
                print(addResult)
            } )
        }
    }
    
    func addListToCash(_ Products: ProductsModel.Response) {
        DispatchQueue.global(qos: .background).async {
            let realmObject = ProductsRealmsModel()
            for product in Products.data! {
                let realmCat = ProductsDatum()
                
                realmCat.category?.name = (product.category?.name)!
                realmCat.category?.id = (product.category?.id)!
                realmCat.category?.image = (product.category?.image)!
                for ingredient in product.ingredients! {
                    realmCat.ingredients.append(ingredient)
                }
                realmCat.id = product.id!
                realmCat.sku = product.sku!
                realmCat.name = product.name!

                realmCat.image = product.image ?? ""
                realmCat.isActive = product.isActive!
                realmCat.isStockProduct = product.isStockProduct!
                realmCat.isReady = product.isReady!
                realmCat.pricingMethod = product.pricingMethod!
                realmCat.sellingMethod = product.sellingMethod!
                realmCat.costingMethod = product.costingMethod!
                realmCat.price = product.price!

                realmCat.createdAt = product.createdAt!
                realmCat.updatedAt = product.updatedAt!
                realmObject.data.append(realmCat)
            }
            RealmManager.shared.addObject(realmObject: realmObject , andCompletion : {
                (addResult) in
                print(addResult)
            } )
        }
    }
}

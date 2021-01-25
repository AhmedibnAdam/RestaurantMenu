//
//  ProductsModel.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit
import RealmSwift

struct ProductsModel {	

    // MARK: - Response
    struct Response: Codable {
        let data: [Datum]?

    }

    // MARK: - Datum
    struct Datum: Codable {
        let category: Category?
        let ingredients: [String]?
        let id, sku: String?
        let barcode: String?
        let name: String?
        let nameLocalized, datumDescription, descriptionLocalized: String?
        let image: String?
        let isActive, isStockProduct, isReady: Bool?
        let pricingMethod, sellingMethod, costingMethod: Int?
        let preparationTime: String?
        let price: Double?
        let cost: Double?
        let calories: String?
        let createdAt, updatedAt: String?
        let deletedAt: String?

        enum CodingKeys: String, CodingKey {
            case category,ingredients, id, sku, barcode, name
            case nameLocalized = "name_localized"
            case datumDescription = "description"
            case descriptionLocalized = "description_localized"
            case image
            case isActive = "is_active"
            case isStockProduct = "is_stock_product"
            case isReady = "is_ready"
            case pricingMethod = "pricing_method"
            case sellingMethod = "selling_method"
            case costingMethod = "costing_method"
            case preparationTime = "preparation_time"
            case price, cost, calories
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case deletedAt = "deleted_at"
        }
    }
    
    // MARK: - Category
    struct Category: Codable {
        let id: String?
        let name: String?
        let reference: String?
        let image: String?


        enum CodingKeys: String, CodingKey {
            case id, name
            case reference, image
   
        }
    }


}

// MARK: - Response
class ProductsRealmsModel: Object {
    var data =  List<ProductsDatum>()
}

// MARK: - Datum
class ProductsDatum: Object {
    @objc dynamic var  category: Category? = Category()
    var  ingredients =  List<String>()
    @objc dynamic var  id: String = ""
    @objc dynamic var  sku: String = ""
    @objc dynamic var  barcode: String = ""
    @objc dynamic var  name: String = ""
    @objc dynamic var  nameLocalized: String = ""
    @objc dynamic var  datumDescription: String = ""
    @objc dynamic var  descriptionLocalized: String = ""
    @objc dynamic var  image: String = ""
    @objc dynamic var  isActive: Bool = false
    @objc dynamic var  isStockProduct: Bool = false
    @objc dynamic var  isReady: Bool = false
    @objc dynamic var  pricingMethod: Int = 0
    @objc dynamic var  sellingMethod: Int = 0
    @objc dynamic var  costingMethod: Int = 0
    @objc dynamic var  preparationTime: String = ""
    @objc dynamic var  price: Double = 0.0
    @objc dynamic var  cost: Double = 0.0
    @objc dynamic var  calories: String = ""
    @objc dynamic var  createdAt: String = ""
    @objc dynamic var  updatedAt: String = ""
    @objc dynamic var  deletedAt: String = ""
    
    
}

// MARK: - Category
class Category: Object {
    @objc dynamic var   id: String = ""
    @objc dynamic var   name: String = ""
    @objc dynamic var   nameLocalized: String = ""
    @objc dynamic var   reference: String = ""
    @objc dynamic var   image: String = ""
    @objc dynamic var   createdAt: String = ""
    @objc dynamic var   updatedAt: String = ""
    @objc dynamic var   deletedAt: String = ""
}


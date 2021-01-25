//
//  CategoriesModel.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam



import Foundation
import RealmSwift

struct CategoriesModel {
    // MARK: - Categories
    struct Categories: Codable {
        let data: [CategoriesDatum]?
        
    }
    
    // MARK: - Datum
    struct CategoriesDatum: Codable {
        let id, name: String?
        let reference: String?
        let image: String?
        
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case reference, image
            
        }
    }
}
// MARK: - Response
class CategorieRealmsModel: Object {
    var data =  List<CategorieDatum>()
}


// MARK: - Datum
class CategorieDatum: Object {
    @objc dynamic var  id: String = ""
    @objc dynamic var  name: String = ""
    @objc dynamic var  reference: String = ""
    @objc dynamic var  image: String = ""
}


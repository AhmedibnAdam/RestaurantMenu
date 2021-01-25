//
//  CategoriesEndpoint.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import Alamofire

enum CategoriesEndpoint {
    /*
     Add Endpoint
     case sample
     case sample(parameter: [String: Any])
    */
}

extension CategoriesEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {

        return .get
    }
    
    var path: String {
        return ""
    }
    
    var parameter: Parameters? {

        return nil
    }
    
    var header: HTTPHeaders? {

        return nil
    }
    
    var encoding: ParameterEncoding {        
        return JSONEncoding.default
    }
}

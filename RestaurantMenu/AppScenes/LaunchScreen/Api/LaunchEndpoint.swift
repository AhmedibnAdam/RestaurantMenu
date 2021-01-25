//
//  LaunchEndpoint.swift
//  RestaurantMenu
//
//  Created by Adam on 24/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import Alamofire

enum LaunchEndpoint {
    case products
    case categories
}

extension LaunchEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        switch self {
        case .products:
            return .get
        case .categories:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .products:
            return Constant.baseURL + "products?include=category"
        case .categories:
            return Constant.baseURL + "categories"
        }
    }
    
    var parameter: Parameters? {
        return nil
    }
    
    var header: HTTPHeaders? {
        let token = Constant.token
        return ["Accept": "application/json" , "Authorization": "Bearer \(token)"]
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}

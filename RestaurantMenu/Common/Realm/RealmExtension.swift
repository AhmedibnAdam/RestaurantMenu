//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam


import Foundation
import  RealmSwift

extension Object {
    func safeWrite (operation: ()->()){
        if let realm = realm {
            do {
                try realm.write {
                    operation()
                }
            }
            catch {
                print(error)
            }
        }
        else {
            operation()
        }
    }
}

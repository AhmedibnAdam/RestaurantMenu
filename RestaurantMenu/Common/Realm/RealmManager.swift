//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import RealmSwift

class RealmManager {
    private init(){}
    static var shared = RealmManager()
    enum AddResult {
        case success, fail
    }
    
    typealias addRealmObjectCompletionType = (AddResult)-> ()
    
    func addObject(realmObject: Object, andCompletion compleion: addRealmObjectCompletionType){
        do { let realm = try Realm()
            try realm.write {
                realm.add(realmObject)
                compleion(.success)
            }
        }
        catch {
            print(error)
            compleion(.fail)
        }
    }
    
    func getObjectOf<T>(type : T.Type) -> [T] where T: Object {
        do { let realm = try Realm()
            let result = realm.objects(type)
            return Array(result)
        }
        catch {
            print(error)
            return []
        }
    }
    
   func removeObject(realmObject: Object, andCompletion compleion: addRealmObjectCompletionType){
        do { let realm = try Realm()
            try realm.write {
                realm.delete(realmObject)
                compleion(.success)
            }
        }
        catch {
            print(error)
            compleion(.fail)
        }
    }

}

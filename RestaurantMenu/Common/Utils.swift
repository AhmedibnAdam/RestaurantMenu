//
//  Utils.swift
//  RestaurantMenu
//
//  Created by Adam on 25/01/2021.
//

import Foundation
import UIKit
import MBProgressHUD

class Utils: NSObject {
    
    
    //MARK: App Delegate
    static func getAppDelegate() -> AppDelegate{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate
    }
    
    // MARK: Storyboard
      
      static func getStoryboard(StoryboardId : String) -> UIStoryboard {
          
        let storyboard = UIStoryboard.init(name: StoryboardId, bundle: nil)
          
        return storyboard
      }
    
    //MARK: Alert
    
    static func showAlert(alertTitle : String , alertMessage: String , cancelTitle:String , otherTitle: String , VC:UIViewController,CompletionBlock: (( _ result: Int) -> ())?) {
        
        DispatchQueue.main.async{
            
            let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel,handler: {
                (alert: UIAlertAction!) in
                CompletionBlock!(0)
            })
            alertController.addAction(cancelAction)
            
            if(!otherTitle.isEmpty){
                let otherAction = UIAlertAction(title: otherTitle, style: .default, handler: {
                    (alert: UIAlertAction!) in
                    CompletionBlock!(1)
                })
                alertController.addAction(otherAction)
            }
            
            VC.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    static func showErrorAlert(message:String,VC:UIViewController) {
        
        showAlert(alertTitle: self.getAppName(), alertMessage: getStringWithTag(tag:message), cancelTitle: getStringWithTag(tag: "OK"), otherTitle: "",VC: VC) { (index) in
        }
    }
    
    // MARK: App Name
    
    static func getAppName() -> String {
        
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }
    
    //MARK: Loading
    
    static func showLoadingInView(view: UIView) {
        
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    static func hideLoadingInView(view: UIView) {
        
        MBProgressHUD.hide(for: view, animated: true)
    }
    

    //MARK: Language
    
    static func getStringWithTag(tag:String)->String{
        
        return NSLocalizedString(tag, comment: "")
    }
    
    static func isArabic() -> Bool {
        
        return false
        
    }
    
    
    
}

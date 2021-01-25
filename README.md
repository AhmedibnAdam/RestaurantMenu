# RestaurantMenu

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Advantages of Clean Swift](#Advantages-of-Clean-Swift)
* [Disadvantages of Clean Swift](#Disadvantages-of-Clean-Swift)
* [Some App Tests ](#Some-App-tests)

## General info
This app is an iOS iPad app which displays the menu of a test restaurant. The menu consists of
categories and products. A category can contain many products. A product belongs to one
cateegory only.
	
## Technologies 
Project is created with:
* swift 
* Design Architecture: Clean Swift VIP Architecture
* Alamofire
* Data Persistence using Realm 
* Unit testing api with OHHTTPStubs
* JSON : Used in data parsing on the api level
* Protocols & Delegates  in VIP and in collection View delegate & datasource
* Error Handling: using  alerts  related to the first point
* Asynchronous programming :  calling api & persisting data in background thread 
* Design Patterns: Singleton for the api & data manager
	
## Clean Swift VIP

Clean Swift (a.k.a VIP) is Uncle Bob’s Clean Architecture applied to iOS and Mac projects. The Clean Swift Architecture is not a framework. It is a set of Xcode templates to generate the Clean Architecture components for you. That means you have the freedom to modify the templates to suit your needs.

![alt text](https://rubygarage.s3.amazonaws.com/uploads/article_image/file/1798/clean-swift-2x.png)

* View Controller
* Models
* Router
* Worker
* Interactor
* Presenter

# View Controller
View Controller starts and ends the VIP cycle
sends data to the Interactor
though it doesn’t get responses from the Interactor
This class has a one-sided interaction with the Presenter 
View Controller gets responses from the Presenter but can’t transfer anything to it
```swift
import UIKit

protocol ILaunchViewController: class {
	var router: ILaunchRouter? { get set }
}
class LaunchViewController: UIViewController {
	var interactor: ILaunchInteractor?
	var router: ILaunchRouter?
    override func viewDidLoad() {
        super.viewDidLoad()
    }   
}
extension LaunchViewController: ILaunchViewController {
}
```
# Models
The Models class is related to each component in the VIP model
 Models is a class containing such structures as Request, Response, and ViewModel:

* Request <br/>
A request model contains parameters sent to the API request, which are user inputs such as text entered in text fields and values chosen in pickers.
* Response <br/>
This type of model receives the response from the API and stores the appropriate data.
* ViewModel <br/>
This model encapsulates responses sent to the Presenter in primitive data types such as String and Int.
```swift
import UIKit
struct CategoriesModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}

	struct Response {
		// do someting...
	}
}
```
# Router
The Router deals with transitions by passing data between view controllers
this done with helper classes 

action occure in view controller call Router class with delegate method
```swift
 //MARK: - in View Controller 
   func getCategories(){
        router?.navigateToArticle(article_id : id )
    }
//MARK: - in Router
import UIKit
protocol ICategoriesRouter: class {
	func navigateToProducts( )
}

class CategoriesRouter: ICategoriesRouter {	
	weak var view: MostPopularViewController?
	
	init(view: CategoriesViewController?) {
		self.view = view
	}
	
	func navigateToProducts(article_id : Int ){
        view?.navigate(type: .modal, module: GeneralRoute.products, completion: nil)
    }
}
  
```

* General Root <br/>
contain all modules 
routing from view controller and passing data trhough general root 
select you destination 
pass parameters to destination configration class 

```swift
import Foundation
import UIKit

enum MostPopularRoute: IRouter {
    /*
     If you want passing with parameters
     you just add like this:
         */
     case sample
     case sample2(parameter: [String: Any])
    /*
     you can use: String, Int, [String: Any], etc..
    */
}

extension MostPopularRoute {
    var module: UIViewController? {
        /*
         Setup module with parameters like:
           */
         switch self {
         case .sample:
            return SampleConfiguration.setup()
        case .sample2(let parameters):
            return SampleConfiguration2.setup(parameters: parameters)
         }
  
    }
}
```

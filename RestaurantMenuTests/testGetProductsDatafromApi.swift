//
//  testGetProductsDatafromApi.swift
//  RestaurantMenuTests
//
//  Created by Adam on 25/01/2021.
//

import Foundation

import XCTest
@testable import RestaurantMenu
import OHHTTPStubs

class GetProductsApiDataTest: XCTestCase {
    

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    func testGetProductsApiData() {
        //MARK: - Given
        stub(condition: { (requestURl) -> Bool in
              return requestURl.url?.absoluteString.contains("name")  ?? false
          }) { (response) -> HTTPStubsResponse in
            
            let jsonObject: ProductsModel.Response = ProductsModel.Response(data: [ProductsModel.Datum(category: nil, ingredients: nil, id: "", sku: "", barcode: "", name: "Lemon Juice", nameLocalized: "", datumDescription: "", descriptionLocalized: "", image: "", isActive: false, isStockProduct: false, isReady: false, pricingMethod: 0, sellingMethod: 0, costingMethod: 0, preparationTime: "", price: 10, cost: 2.5, calories: "", createdAt: "", updatedAt: "", deletedAt: "")])
            
            return HTTPStubsResponse(jsonObject: jsonObject, statusCode: 200, headers: nil)
            
        }
        var expectedResponse: ProductsModel.Response?  = nil
        let exception = self.expectation(description: "calling Api failed !")
        
        //MARK: - When
        let worker: ILaunchWorker? = LaunchWorker()
        worker?.getProducts(complition: { (error, status, response) in
                        expectedResponse = response
                        exception.fulfill()
                    })

        
        //MARK: - Then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssertTrue(expectedResponse?.data?.count == 50)
        XCTAssertEqual(expectedResponse?.data?[2].name , "Lemon Juice")

    }

    
}


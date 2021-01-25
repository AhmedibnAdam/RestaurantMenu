//
//  testGetCategoriesDataFromAPI.swift
//  RestaurantMenuTests
//
//  Created by Adam on 25/01/2021.
//

import XCTest
@testable import RestaurantMenu
import OHHTTPStubs

class testGetCategoriesDataFromAPI: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    func testGetCategoriesApiData() {
        //MARK: - Given
        stub(condition: { (requestURl) -> Bool in
              return requestURl.url?.absoluteString.contains("name")  ?? false
          }) { (response) -> HTTPStubsResponse in
            
            let jsonObject: CategoriesModel.Categories = CategoriesModel.Categories(data: [CategoriesModel.CategoriesDatum(id: "9223b1ad-75c3-43b3-91ea-323292dc4bdc", name: "Drinks", reference: "drinks", image: "https://console-uploads-staging.s3.eu-west-1.amazonaws.com/images/100111_1606820529_9223b4af-b613-4fd0-a12f-be58bbd29d61.png")])
           
            
            return HTTPStubsResponse(jsonObject: jsonObject, statusCode: 200, headers: nil)
            
        }
        var expectedResponse: CategoriesModel.Categories?  = nil
        let exception = self.expectation(description: "calling Api failed !")
        
        //MARK: - When
        let worker: ILaunchWorker? = LaunchWorker()
        worker?.getCategories(complition: { (error, status, response) in
                        expectedResponse = response
                        exception.fulfill()
                    })

        
        //MARK: - Then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssertTrue(expectedResponse?.data?.count == 50)
        XCTAssertEqual(expectedResponse?.data?[0].name , "Drinks")
 
    }
}

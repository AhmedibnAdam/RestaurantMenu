//
//  NetworkService.swift
//  RestaurantMenu
//
//  Created by Adam on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam/

import Foundation
import Alamofire
import SwiftyJSON

protocol IEndpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameter: Parameters? { get }
    var image: UIImage? { get }
    var header: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}
class NetworkService {
    static let share = NetworkService()
    private var dataRequest: DataRequest?
    private var success: ((_ data: Data?)->Void)?
    private var failure: ((_ error: Error?)->Void)?
    
    @discardableResult
    private func _dataRequest(
        url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest {
            return SessionManager.default.request(
                url,
                method: method,
                parameters: parameters,
                encoding: encoding,
                headers: headers
            )
    }
    
    func request<T: IEndpoint>(endpoint: T, success: ((_ data: Data)->Void)? = nil, failure: ((_ error: Error?)->Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            self.dataRequest = self._dataRequest(url: endpoint.path,
                                                 method: endpoint.method,
                                                 parameters: endpoint.parameter,
                                                 encoding: endpoint.encoding,
                                                 headers: endpoint.header)
            self.dataRequest?.responseData(completionHandler: { (response) in
                switch response.result {
                case .success (let value):
                    success?(value)
                case .failure(let error):
                    print(error)
                    failure?(error)
                }
                
            })
        }
    }
    
    func cancelRequest(_ completion: (()->Void)? = nil) {
        dataRequest?.cancel()
        completion?()
    }
    
    func cancelAllRequest(_ completion: (()->Void)? = nil) {
        dataRequest?.session.getAllTasks(completionHandler: { (tasks) in
            tasks.forEach({ (task) in
                task.cancel()
            })
        })
        completion?()
    }
    
    func success(_ completion: ((_ data: Data?)->Void)?) -> NetworkService {
        success = completion
        return self
    }
    
    func failure(_ completion: ((_ error: Error?)->Void)?) -> NetworkService {
        failure = completion
        return self
    }
}

//MARK:-  Upload Request
extension NetworkService {
    
    func uploadToServerWith<T: IEndpoint>(endpoint: T , success: ((_ data: Data)->Void)? = nil, failure: ((_ error: Error?)->Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            let image = endpoint.image!
            let imgData = image.jpegData(compressionQuality: 0.1)!
            Alamofire.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imgData, withName: "avatar",fileName: "avatar", mimeType: "avatar/jpg")
                for (key, value) in endpoint.parameter ?? ["":""] {
                    multipartFormData.append(((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!), withName: key)
                }
            }, usingThreshold:UInt64.init(), to:endpoint.path , method:.post, headers: endpoint.header)
            { (result) in
                switch result {
                case .success(let upload, _ , _):
                    //  success?(value)
                    upload.uploadProgress(closure: { (Progress) in
                        print("Upload Progress: \(Progress.fractionCompleted)")
                    })
                    upload.responseData { (response) in
                        switch response.result {
                        case .success (let value):
                            success?(value)
                        case .failure(let error):
                            print(error)
                        }
                        
                    }
                case .failure(let error):
                    print(error)
                }
                
            }
        }
    }
    
}

//
//  BaseProvider.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    
    case options = "OPTIONS"
    
    case get     = "GET"
    
    case head    = "HEAD"
    
    case post    = "POST"
    
    case put     = "PUT"
    
    case patch   = "PATCH"
    
    case delete  = "DELETE"
    
    case trace   = "TRACE"
    
    case connect = "CONNECT"
    
}



protocol BaseProviderProtocol:class {
    
    func request<T:Decodable>(endPoint: String,
                              method: HTTPMethod,
                              bodyObject:[String:Any]?,
                              type:T.Type,
                              success: @escaping (MovieModels?) -> Void,
                              failure: @escaping () -> Void)
    
}

internal class BaseProvider: BaseProviderProtocol {
    
    func request<T:Decodable>(endPoint: String,
                              method: HTTPMethod,
                              bodyObject:[String:Any]?,
                              type:T.Type,
                              success: @escaping (MovieModels?) -> Void,
                              failure: @escaping () -> Void) {
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        guard let endpointDes = URL(string: endPoint) else {return}
        var request = URLRequest(url: endpointDes)
        request.httpMethod = method.rawValue
        
        session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            let statusCode = (response as? HTTPURLResponse)!.statusCode
            if (error == nil) {
                
                //Success
                if error == nil, data != nil {
                    do{
                        guard let dataResponse = data else {
                            return
                        }
                        let response = try JSONDecoder().decode(T.self, from: dataResponse)
                        switch statusCode {
                        case 200:
                            success(response as? MovieModels)
                        default:
                            break
                        }
                    }
                    catch{
                        
                    }
                    
                } else {
                    failure()
                }
            }
        }).resume()
        session.finishTasksAndInvalidate()
    }
}


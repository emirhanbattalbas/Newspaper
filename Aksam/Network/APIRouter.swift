//
//  APIRouter.swift
//  YemekSepetiCase
//
//  Created by emirhan battalbaş on 18.01.2020.
//  Copyright © 2020 emirhan battalbaş. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters:Parameters? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
}

enum Router: APIConfiguration {
    
    static let baseUrl = Constant.baseUrl

    case home
    
    var method: HTTPMethod {
        switch self {
        case .home:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .home:
            return nil
        }
     }
    
    var path: String {
        
        var relativePath: String = ""
        
        switch self {
        case .home:
            relativePath = "/aksamtv/HomePage_v2"
      
        }
        
        return relativePath
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .home:
            return URLEncoding.default
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .home:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {

        let url: URL = {
            
            var urlComps = URLComponents(string: Constant.baseUrl)!
            
            urlComps.path = path.removingPercentEncoding ?? ""
            
            return urlComps.url!
            
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest

    }
}




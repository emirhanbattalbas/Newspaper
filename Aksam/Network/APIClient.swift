//
//  APIClient.swift
//  YemekSepetiCase
//
//  Created by emirhan battalbaş on 21.01.2020.
//  Copyright © 2020 emirhan battalbaş. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    @discardableResult
    private static func performRequest<T: Decodable, U: APIConfiguration>(route: U, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (AFResult<T>)->Void) -> DataRequest {
        
        return AF.request(route).responseData { (response) in
            
            guard let responseData = response.value else { return }
            
            do {
                let object = try decoder.decode(T.self, from: responseData)
                completion(.success(object))
            } catch let error {
                let afError = AFError.responseSerializationFailed(reason: .decodingFailed(error: error))
                completion(.failure(afError))
            }
        }
    }
    
    static func homePage(completion: @escaping (AFResult<HomePage>) -> Void) {
        performRequest(route: Router.home, completion: completion)
    }

}


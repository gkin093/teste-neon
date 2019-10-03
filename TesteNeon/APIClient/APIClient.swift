//
//  APIClient.swift
//  TesteNeon
//
//  Created by Gustavo Kin Tanaka Uno on 02/10/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import Alamofire

internal class APIClient {
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, Error>)->Void) -> DataRequest {
        return AF.request(route)
            .validate(statusCode: 200..<300)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T>) in
                completion(response.result)
        }
    }
    
    static func generateToken(name: String, email: String, completion: @escaping (Result<String, Error>)->Void) {
        performRequest(route: .generateToken(name: name, email: email), completion: completion)
    }
    
    static func sendMoney(clientId: Int, value: Double, token: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        performRequest(route: .sendMoney(clientId: clientId, value: value, token: token), completion: completion)
    }
    
    static func getTransfers(token: String, completion: @escaping  (Result<[TransfersModel], Error>)->Void) {
        performRequest(route: .getTransfers(token: token), completion: completion)
    }
}

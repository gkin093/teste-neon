//
//  APIRouter.swift
//  TesteNeon
//
//  Created by Gustavo Kin Tanaka Uno on 02/10/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case generateToken(name: String, email: String)
    case sendMoney(clientId: Int, value: Double, token: String)
    case getTransfers(token: String)
    
    private var method: HTTPMethod {
        switch self {
        case .generateToken, .getTransfers:
            return .get
        case .sendMoney:
            return .post
        }
    }
    
    private var path: String {
        switch self {
        case .generateToken:
            return "GenerateToken"
        case .sendMoney:
            return "SendMoney"
        case .getTransfers:
            return "GetTransfers"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .generateToken, .getTransfers:
            return nil
        case .sendMoney(let clientId, let value, let token):
            return ["ClientId": clientId, "token": token, "valor": value]
        }
    }
    
    private var queryParameters: [URLQueryItem]? {
        switch self {
        case .generateToken(let name, let email):
            return [URLQueryItem(name: "nome", value: name),
                    URLQueryItem(name: "email", value: email )]
        case .getTransfers(let token):
            return [URLQueryItem(name: "token", value: token)]
        default:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest: URLRequest?
        if queryParameters == nil {
            let url = try AppConstatnts.urlBase.asURL()
            urlRequest = URLRequest(url: url.appendingPathComponent(path))
        } else {
            var url = URLComponents(string: AppConstatnts.urlBase + self.path)!
            url.queryItems = queryParameters
            urlRequest = URLRequest(url: url.url!)
        }
        
        urlRequest!.httpMethod = self.method.rawValue
        
        if let parameters = parameters {
            do {
                urlRequest!.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest!
    }
    
    
}

//
//  DeliveryServiceAPI.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Moya

internal enum DeliveryServiceAPI: TargetType {
    
    case loadDeliveries(params: DeliveryParam)
    
    internal var baseURL: URL {
        return URL(string: "https://mock-api-mobile.dev.lalamove.com")!
    }
    
    internal var path: String {
        switch self {
        case .loadDeliveries:
            return "v2/deliveries"
        }
    }
    
    internal var method: Moya.Method {
        return .get
    }
    
    internal var parameters: [String: Any] {
        switch self {
        case .loadDeliveries(let params):
            return params.toJSON()
        }
    }
    
    internal var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    internal var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    internal var task: Task {
        return Task.requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    internal var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

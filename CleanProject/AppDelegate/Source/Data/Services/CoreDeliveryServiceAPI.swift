//
//  CoreDeliveryServiceAPI.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Moya
import UnionBank_Core

fileprivate var ubBaseUrl = ""

internal enum CoreDeliveryServiceAPI: BaseTargetType {
    internal var baseURL: URL {
        return URL(string: ubBaseUrl)!
    }
    
    internal var path: String {
        return ""
    }
    
    internal var method: Moya.Method {
        return .get
    }
    
    internal var parameters: [String: Any] {
        return [:]
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
    
    internal var headers: [String: String]? { return nil }
    
    internal static func setBaseURL(_ url: String) {
        ubBaseUrl = url
    }
}

extension CoreDeliveryServiceAPI: AuthTargetType {
    public var requiresAuth: Bool {
        return true
    }
}

//
//  DeliveryParam.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Foundation
import ObjectMapper

internal struct DeliveryParam: ImmutableMappable {
    internal var offset: Int
    internal var limit: Int
    
    internal init(offset: Int, limit: Int) {
        self.offset = offset
        self.limit = limit
    }
    
    internal init(map: Map) throws {
        offset = try map.value("offset")
        limit = try map.value("limit")
    }
    
    internal mutating func mapping(map: Map) {
        offset <- map["offset"]
        limit <- map["limit"]
    }
}

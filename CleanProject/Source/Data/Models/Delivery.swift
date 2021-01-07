//
//  Delivery.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Foundation
import ObjectMapper

public struct Delivery: ImmutableMappable, Hashable {
    
    internal var deliveryId: String
    internal var deliveryRemarks: String
    internal var deliveryItemPic: String
    internal var deliveryPickupTime: String
    internal var deliveryFee: String
    internal var deliverySurcharge: String
    
    internal var routeStart: String
    internal var routeEnd: String
 
    internal var senderName: String
    internal var senderPhone: String
    internal var senderEmail: String
    
    public init(map: Map) throws {
        
        self.deliveryId = try map.value("id")
        self.deliveryRemarks = try map.value("remarks")
        self.deliveryItemPic = try map.value("goodsPicture")
        self.deliveryPickupTime = try map.value("pickupTime")
        self.deliveryFee = try map.value("deliveryFee")
        self.deliverySurcharge = try map.value("surcharge")
        
        self.routeStart = try map.value("route.start")
        self.routeEnd = try map.value("route.end")
        
        self.senderName = try map.value("sender.name")
        self.senderPhone = try map.value("sender.phone")
        self.senderEmail = try map.value("sender.email")
    }
}

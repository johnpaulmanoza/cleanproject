//
//  CoreDeliveryRepository.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import RxSwift

internal class CoreDeliveryRepository: DeliveryRepository {
    internal typealias Provider = BaseProvider<DeliveryServiceAPI>
    
    private var provider: Provider
    
    internal init(provider: Provider) {
        self.provider = provider
    }
}

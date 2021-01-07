//
//  CoreDeliveryRepository.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import RxSwift
import Moya
import Moya_ObjectMapper

internal class CoreDeliveryRepository: DeliveryRepository {

    internal typealias Provider = MoyaProvider<DeliveryServiceAPI>
    
    private var provider: Provider
    
    internal init(provider: Provider) {
        self.provider = provider
    }
    
    internal func loadDeliveries(params: DeliveryParam) -> Observable<[Delivery]> {
        return self.provider.rx.request(.loadDeliveries(params: params))
            .asObservable()
            .mapArray(Delivery.self)
    }
}

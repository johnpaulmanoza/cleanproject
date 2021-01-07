//
//  DeliveryRepository.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import RxSwift

internal protocol DeliveryRepository {
    func loadDeliveries(params: DeliveryParam) -> Observable<[Delivery]>
}

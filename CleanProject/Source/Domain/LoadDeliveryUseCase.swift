//
//  LoadDeliveryUseCase.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Foundation
import RxSwift

internal class LoadDeliveryUseCase {
    private let deliveryRepository: DeliveryRepository!

    internal init(repository: DeliveryRepository) {
        self.deliveryRepository = repository
    }
    
    internal func execute(params: DeliveryParam) -> Observable<[Delivery]> {
        return self.deliveryRepository
            .loadDeliveries(params: params)
            .catchError { (error) -> Observable<[Delivery]> in
                throw error
            }
    }
}

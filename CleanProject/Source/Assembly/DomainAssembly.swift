//
//  DomainAssembly.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Swinject
import SwinjectAutoregistration

public class DomainAssembly: Assembly {
    public func assemble(container: Container) {
        
        container
            .register(LoadDeliveryUseCase.self) { r in
                let repository = r.resolve(DeliveryRepository.self)!
                return LoadDeliveryUseCase(repository: repository)
            }
            .inObjectScope(.container)
    }
}


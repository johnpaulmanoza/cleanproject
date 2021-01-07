//
//  DataAssembly.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Swinject
import SwinjectAutoregistration
import Moya

public class DataAssembly: Assembly {
    public func assemble(container: Container) {
        
        // provider
        container
            .register(MoyaProvider<DeliveryServiceAPI>.self, name: "provider") { _ in
                return .init()
            }
            .inObjectScope(.container)

        // repository
        container
            .register(DeliveryRepository.self) { r in
                let provider = r.resolve(MoyaProvider<DeliveryServiceAPI>.self, name: "provider")!
                return CoreDeliveryRepository(provider: provider)
            }
            .inObjectScope(.container)
    }
}


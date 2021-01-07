//
//  PresenterAssembly.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Foundation
import Swinject
import SwinjectAutoregistration

public class PresenterAssembly: Assembly {
    public func assemble(container: Container) {
        
        container
            .register(DeliveryListPresenter.self) { r in
                let useCase = r.resolve(LoadDeliveryUseCase.self)!
                return DeliveryListPresenter.init(useCase: useCase)
            }
        
        container
            .register(DeliveryListViewController.self) { r in
                let presenter = r.resolve(DeliveryListPresenter.self)!
                return DeliveryListViewController(presenter: presenter)
            }
            .inObjectScope(.container)
    }
}

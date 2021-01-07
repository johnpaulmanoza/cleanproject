//
//  DeliveryListPresenter.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Foundation
import RxSwift

internal protocol DeliveryListPresenterView: PresenterView {
    
}

internal class DeliveryListPresenter: PresenterTyped<DeliveryListPresenterView> {
    
    private let disposeBag: DisposeBag = DisposeBag()
    private var data: [Delivery] = []
    private let limit: Int = 10
    private var pageNumber: Int = 1
    private let transaction: PublishSubject = PublishSubject<(limit: Int, pageNumber: Int)>()
    
    private let useCase: LoadDeliveryUseCase
    
    internal init(useCase: LoadDeliveryUseCase) {
        self.useCase = useCase
    }
    
    // MARK: Accessible Functions
    internal override func attachView(view: DeliveryListPresenterView) {
        super.attachView(view: view)
        setupSubscribe()
    }
    
    internal func loadDeliveryList() {
        pageNumber = 1; self.data = []
        print("load presenter", useCase)
        transaction.onNext((limit, pageNumber))
    }
    
    internal func loadNextDeliveryList() {
        pageNumber += 1
        transaction.onNext((limit, pageNumber))
    }
    
    // MARK: Private Functions
    private func setupSubscribe() {
        transaction
            .flatMap { (arg) -> Observable<[Delivery]> in
                let (limit, pageNumber) = arg
                let params = DeliveryParam(offset: pageNumber, limit: limit)
                print("value", limit, pageNumber)
                return self.useCase.execute(params: params)
            }
            .subscribe(
                onNext: { [unowned self] response in
                    print("using response", response)
                    self.data.append(contentsOf: response)
                },
                onError: { [unowned self] error in
                    print("using error", error)
                }
            )
            .disposed(by: disposeBag)
    }
}

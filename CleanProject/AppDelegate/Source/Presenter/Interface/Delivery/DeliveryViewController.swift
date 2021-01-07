//
//  DeliveryViewController.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import UnionBank_Common
import UnionBank_UI

// MARK: Supporting Interface

// MARK: Main
internal class DeliveryViewController: BaseViewController {
    // MARK: Type Definitions
    // MARK: Contants
    // MARK: Static Properties
    // MARK: Instance Properties
    private var presenter: DeliveryPresenter?
    // MARK: Interface Properties
    // MARK: Initializers
    // MARK: Static Functions
    // MARK: View Life Cycle Functions
    internal override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attachView(view: self)
    }
    
    // MARK: Action Functions
    // MARK: Accessible Functions
    // MARK: Private Functions
    // MARK: Subscripts
    // MARK: Deinitializers
}

// MARK: Extensions
extension DeliveryViewController: DeliveryPresenterView {
}

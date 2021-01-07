//
//  MVP.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Foundation

public protocol PresenterView: class {
    
}

open class Presenter {
    
    public private(set) weak var view: PresenterView?

    public init() {
    }
    
    open func attachView(view: PresenterView) {
        self.view = view
    }

    public func detachView() {
        self.view = nil
    }
    
}

open class PresenterTyped<View> {
    
    public private(set) var view: View?
    
    public init() {
        
    }
    
    open func attachView(view: View) {
        self.view = view
    }
    
    public func detachView() {
        self.view = nil
    }
}

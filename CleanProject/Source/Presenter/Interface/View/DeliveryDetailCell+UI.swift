//
//  DeliveryDetailCell+UI.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import SnapKit

extension DeliveryDetailCell {
    
    internal func setupSubviews() {
        contentView.addSubview(label)
    }
    
    internal func setupAutoLayout() {
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.size.equalToSuperview()
        }
    }
}

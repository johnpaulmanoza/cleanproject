//
//  DeliveryListViewController+UI.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import SnapKit

extension DeliveryListViewController {
    
    internal func setupSubviews() {
        view.addSubview(collectionView)
        view.addSubview(detailButton)
    }
    
    internal func setupAutoLayout() {
        detailButton.snp.makeConstraints { (make) in
            make.width.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(45)
            make.bottom.equalTo(view.safeAreaInsets.bottom).inset(30)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.size.equalToSuperview()
            make.edges.equalToSuperview()
        }
    }
}

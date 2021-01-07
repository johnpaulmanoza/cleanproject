//
//  DeliveryDetailCell.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import UIKit

class DeliveryDetailCell: UICollectionViewCell {
    
    internal lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        return label
    }()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupSubviews()
        setupAutoLayout()
    }
}

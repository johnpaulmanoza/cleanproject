//
//  DeliveryListSectionController.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Foundation
import IGListKit

internal class DeliveryListSectionController: ListSectionController {
    
    private var delivery: Delivery?
    
    internal override init() {
        super.init()
        inset = .init(top: 0, left: 0, bottom: 12, right: 0)
    }
    
    override func didUpdate(to object: Any) {
        guard let data = object as? Delivery else { return }
        delivery = data
    }
    
    internal override func numberOfItems() -> Int {
        return 1
    }
    
    internal override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            fatalError("nil collectionContext found")
        }
        
        return CGSize(width: context.containerSize.width, height: 50)
    }
    
    internal override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let context = collectionContext else {
            fatalError("nil collectionContext found")
        }
        
        guard let cell = context.dequeueReusableCell(
            of: DeliveryDetailCell.self,
            for: self,
            at: index
        ) as? DeliveryDetailCell else {
            fatalError("nil DeliveryListCell found")
        }
        
        cell.label.text = "Value"
        
        return cell
    }
}

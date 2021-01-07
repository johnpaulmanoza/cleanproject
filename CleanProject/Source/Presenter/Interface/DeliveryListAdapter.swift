//
//  DeliveryListAdapter.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import Foundation
import IGListKit
import ObjectMapper

// MARK: - ListAdapterDataSource
internal class DeliveryListAdapter: NSObject, ListAdapterDataSource {
    private func fakeDeliveries() -> [Delivery] {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let text = try String(contentsOfFile: path, encoding: .utf8)
                if let deliveries = try JSONSerialization.jsonObject(with: text.data(using: .utf8)!, options: JSONSerialization.ReadingOptions.allowFragments) as? [[String: Any]] {
                    let items = deliveries.map { try! Delivery(JSON: $0) }
                    return items
                }
            } catch {
                return []
            }
        }
        
        return []
    }
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        let objects: [DeliveryAdapterSection] = fakeDeliveries().map { DeliveryAdapterSection(delivery: $0) }
        return objects.diffable()
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return DeliveryListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

internal class DeliveryAdapterSection: Diffable {
    internal var diffIdentifier: String {
        return id.hashValue.diffIdentifier
    }
    internal var id: String
    internal var delivery: Delivery
    
    internal init(delivery: Delivery) {
        self.id = delivery.deliveryId
        self.delivery = delivery
    }
    
    internal static func == (lhs: DeliveryAdapterSection, rhs: DeliveryAdapterSection) -> Bool {
        return lhs.id == rhs.id && lhs.delivery == rhs.delivery
    }
}

//
//  DeliveryListViewController.swift
//  CleanProject
//
//  Created by John Paul Manoza on 1/7/21.
//

import UIKit
import IGListKit

internal class DeliveryListViewController: UIViewController, DeliveryListPresenterView {
    
    internal var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        let view: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        adapter.collectionView = collectionView
        adapter.dataSource = adapterDataSource
        return adapter
    }()
    
    private lazy var adapterDataSource: DeliveryListAdapter = {
        let source = DeliveryListAdapter()
        return source
    }()
    
    internal var detailButton: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 8
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Details", for: .normal)
        return btn
    }()
    
    private var presenter: DeliveryListPresenter?
    
    convenience init(presenter: DeliveryListPresenter) {
        self.init()
        self.presenter = presenter
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        presenter?.attachView(view: self)
        
        presenter?.loadDeliveryList()
        
        setupUI()
        
        _ = adapter
    }
    
    private func setupUI() {
        
        setupSubviews()
        
        setupAutoLayout()
    }
}

// 
// ViewController.swift
// Created on 2021/8/18
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import UIKit
import IGListKit

class ViewController: UIViewController {
    
    private var dataArray: [ListDiffable] = [
        TitleSectionEntity(
            elements: [
                SingleTitleModel(title: "test1"),
                SingleTitleModel(title: "test2"),
                SingleTitleModel(title: "test3"),
            ]
        ),
        DescriptionSectionEntity(
            model: DescriptionModel(
                title: "腰围",
                detail: "是反映脂肪总量与脂肪分布的综合指标。指测量人体腰部横过肚脐的水平周长。建议测量方法：被测量者站立时自然呼吸，双脚分开25至30厘米，均匀分配体重。"
            )
        )
    ]
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureNavigationBar()
        configureSubviews()
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
}

// MARK: - ListAdapterDataSource
extension ViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return dataArray
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is TitleSectionEntity:
            return SingleElementController<SingleTitleCell, TitleSectionEntity>(
                insets: .init(top: 10, leading: 15, bottom: 10, trailing: 15)
            )
        default:
            return SingleElementController<DescriptionCell, DescriptionSectionEntity>(insets: .init(leading: 15, bottom: 10, trailing: 15))
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}


// MARK: - private

private extension ViewController {
    
    func configureNavigationBar() {
        navigationItem.title = "IGListKitDemo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "refresh",
            style: .done,
            target: self,
            action: #selector(rightBarButtonItemAction)
        )
    }
    
    @objc func rightBarButtonItemAction() {
//        let array = [
//            TitleSectionEntity(
//                elements: [
//                    SingleTitleModel(title: "test1"),
//                    SingleTitleModel(title: "test2"),
//                    SingleTitleModel(title: "test4"),
//                    SingleTitleModel(title: "test3"),
//                ]
//            )
//        ]
        guard let titleSection = dataArray.first as? TitleSectionEntity else {
            return
        }
        
        titleSection.elements =  [
            SingleTitleModel(title: "test1"),
            SingleTitleModel(title: "test2"),
            SingleTitleModel(title: "test4"),
            SingleTitleModel(title: "test3"),
        ]
        
        adapter.reloadObjects([titleSection])
    }
    
    func configureSubviews() {
        view.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}


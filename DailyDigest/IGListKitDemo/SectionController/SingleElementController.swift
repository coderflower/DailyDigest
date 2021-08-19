//
// SingleElementController.swift
// Created on 2021/7/30
// Description <#⽂件描述#>
// Copyright © 2021 Huami inc. All rights reserved.
// @author 蔡龙君(cailongjun@huami.com)

import IGListKit
import UIKit

public protocol SingleElementEventHandler: AnyObject {
    func didSelectItem(at indexPath: IndexPath)
}

open class SingleElementController<
    Cell: UICollectionViewCell,
    Entity: SingleElementEntityable
>: ListSectionController where Cell: Configurable, Entity.Element == Cell.Model {

    public var entity: Entity? 

    public weak var eventHandler: SingleElementEventHandler?

    public init(
        insets: UIEdgeInsets = .init(top: 0, left: 15, bottom: 10, right: 15),
        eventHandler: SingleElementEventHandler? = nil
    ) {
        super.init()
        inset = insets
        minimumLineSpacing = 10
        self.eventHandler = eventHandler
    }

    override open func numberOfItems() -> Int {
        guard let entity = entity else { return 0 }
        return entity.elements.count
    }

    override open func sizeForItem(at index: Int) -> CGSize {
        guard let entity = entity else { return .zero }
        return entity.elements[index].size
    }

    override open func cellForItem(at index: Int) -> UICollectionViewCell {
        guard
            let context = collectionContext,
            let entity = entity,
            let cell = context.dequeueReusableCell(of: Cell.self, for: self, at: index) as? Cell
        else {
            return UICollectionViewCell()
        }
        
        cell.config(using: entity.elements[index])

        return cell
    }

    override open func didUpdate(to object: Any) {
        guard let entity = object as? Entity else { return }
        self.entity = entity
    }

    override open func didSelectItem(at index: Int) {
        eventHandler?.didSelectItem(at: IndexPath(row: index, section: section))
    }
}

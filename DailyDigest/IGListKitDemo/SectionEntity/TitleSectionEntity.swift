// 
// TitleSectionEntity.swift
// Created on 2021/8/18
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import UIKit
import IGListKit

class TitleSectionEntity: SingleElementEntityable {
    
    var elements: [SingleTitleModel] = []
    
    init(elements: SingleTitleModel...) {
        self.elements = elements
    }
    
    init(elements: [SingleTitleModel]) {
        self.elements = elements
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return "title" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? TitleSectionEntity else { return false }
        return object.elements == elements
    }
}

extension SingleElementEntityable {
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? Self else { return false }
        return object.elements == elements
    }
}

// 
// SingleElementEntityable.swift
// Created on 2021/8/18
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import Foundation
import IGListKit

public protocol Sizeable {
    var size: CGSize { get }
}

public protocol SingleElementEntityable: ListDiffable {

    associatedtype Element: Sizeable & Equatable

    var elements: [Element] { get set }

}

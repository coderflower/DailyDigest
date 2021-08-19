//
// Configurable.swift
// Created on 2021/5/8
// Description <#⽂件描述#>
// Copyright © 2021 Huami inc. All rights reserved.
// @author 蔡龙君(cailongjun@huami.com)

import Foundation

public protocol Configurable {

    associatedtype Model

    func config(using model: Model)
}

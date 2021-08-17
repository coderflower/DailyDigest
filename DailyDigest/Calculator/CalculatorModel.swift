// 
// CalculatorModel.swift
// Created on 2021/8/17
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import Foundation
import Combine

class CalculatorModel: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    var brain: CalculatorBrain = .left("0") {
        willSet {
            objectWillChange.send()
        }
    }
    
}

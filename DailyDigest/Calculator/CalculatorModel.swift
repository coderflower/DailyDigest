// 
// CalculatorModel.swift
// Created on 2021/8/17
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import Foundation
import Combine

class CalculatorModel: ObservableObject {
    
    @Published var brain: CalculatorBrain = .left("0")
    // 历史回溯
    @Published var history: [CalculatorButtonItem] = []
 
    func apply(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    var historyDetail: String {
        history.map { $0.title }.joined()
    }
    
    var temporaryKept: [CalculatorButtonItem] = []
    
    var totalCount: Int {
        history.count + temporaryKept.count
    }
    
    var slidingIndex: Float = 0 {
        didSet {
            // 维护 `history` 和 `temporaryKept`
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    func keepHistory(upTo index: Int) {
        precondition(index <= totalCount, "Out of index.")
        let total = history + temporaryKept
        history = Array(total[..<index])
        temporaryKept = Array(total[index...])
        brain = history.reduce(CalculatorBrain.left("0")) { $0.apply(item: $1) }
        
    }
}

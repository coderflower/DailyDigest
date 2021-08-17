// 
// CalculatorButtonRow.swift
// Created on 2021/8/3
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import SwiftUI

struct CalculatorButtonRow: View {
    @Binding var brain: CalculatorBrain
    let row: [CalculatorButtonItem]
    let scale: CGFloat
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    item: item,
                    scale: scale
                ) {
                    brain = brain.apply(item: item)
                }
            }
        }
    }
}

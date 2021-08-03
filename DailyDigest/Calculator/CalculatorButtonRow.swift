// 
// CalculatorButtonRow.swift
// Created on 2021/8/3
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import SwiftUI

struct CalculatorButtonRow: View {
    
    let row: [CalculatorButtonItem]
    let scale: CGFloat
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    item: item,
                    scale: scale
                ) {
                    print("button: \(item.title)")
                }
            }
        }
    }
}

struct CalculatorButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonRow(row: [.digit(1), .digit(2), .digit(3), .op(.plus), ], scale: 1)
    }
}

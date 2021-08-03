// 
// CalculatorButton.swift
// Created on 2021/8/3
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import SwiftUI

struct CalculatorButton: View {

    let fontSize: CGFloat = 38
    let item: CalculatorButtonItem
    let scale: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(item.title)
                .font(.system(size: fontSize))
                .foregroundColor(item.foregroundColor)
                .frame(width: item.size.width * scale, height: item.size.height * scale)
                .background(item.backgroundColor)
                .cornerRadius(item.size.height * scale * 0.5)
        }
    }
}

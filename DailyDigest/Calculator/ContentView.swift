// 
// ContentView.swift
// Created on 2021/8/3
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var model = CalculatorModel()
    
    let scale: CGFloat = UIScreen.main.bounds.width / 428

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text(model.brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 27 * scale)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            CalculatorButtonPad(brain: $model.brain, scale: scale).padding(.bottom)
        }
    }
}

struct CalculatorButtonPad: View {
    @Binding var brain: CalculatorBrain
    let scale: CGFloat
    
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(brain: $brain, row: row, scale: scale)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewDevice("iPhone SE (2nd generation)")
        }
    }
}

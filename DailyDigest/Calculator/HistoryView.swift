//
//  HistoryView.swift
//  Calculator
//
//  Created by Taylor.CAI on 2021/8/23.
//

import SwiftUI
import Combine

struct HistoryView: View {
    
    @ObservedObject var model: CalculatorModel
    
    var body: some View {
        VStack {
            if model.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                    Text("履历")
                    Text("\(model.historyDetail)").lineLimit(nil)
                }
                HStack {
                    Text("显示")
                    Text("\(model.brain.output)")
                }
                Slider(value: $model.slidingIndex, in: 0...Float(model.totalCount), step: 1)
            }
        }
        .font(.headline)
        .padding()
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(model: CalculatorModel())
    }
}

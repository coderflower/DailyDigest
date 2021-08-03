// 
// CalculatorButtonItem.swift
// Created on 2021/8/3
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import SwiftUI

enum CalculatorButtonItem {
    
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem {

    var title: String {
        switch self {
        case .digit(let value):
            return String(value)
        case .dot:
        return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2 + 8, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var backgroundColor: Color {
        switch self {
        case .digit, .dot: return Color("digitBackground")
        case .op: return Color("operatorBackground")
        case .command: return Color("commandBackground")
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .command:
            return Color("commandForeground")
        default:
            return .white
        }
    }
}

extension CalculatorButtonItem: Hashable { }

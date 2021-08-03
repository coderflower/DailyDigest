// 
// ContentView.swift
// Created on 2021/8/3
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CalculatorButton(
                title: "1",
                size: CGSize(width: 88, height: 88),
                backgroundColorName: "digitBackground"
            ){
                print("Button: 1")
            }
            CalculatorButton(
                title: "2",
                size: CGSize(width: 88, height: 88),
                backgroundColorName: "digitBackground"
            ){
                print("Button: 2")
            }
            CalculatorButton(
                title: "3",
                size: CGSize(width: 88, height: 88),
                backgroundColorName: "digitBackground"
            ){
                print("Button: 3")
            }
            CalculatorButton(
                title: "+",
                size: CGSize(width: 88, height: 88),
                backgroundColorName: "digitBackground"
            ){
                print("Button: +")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

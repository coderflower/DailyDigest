// 
// SingleTitleEntity.swift
// Created on 2021/8/18
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import UIKit

public struct SingleTitleModel: Sizeable, Equatable {
    
    public enum AccessoryType {
        case none
        case forward
    }
    
    public var size: CGSize
    
    let attributedText: NSAttributedString
    let accessoryType: AccessoryType
    
    public init(
        title: String,
        attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black],
        accessoryType: AccessoryType = .forward,
        preferredMaxLayoutWidth width: CGFloat = UIScreen.main.bounds.width - 30
    ) {
        attributedText = NSAttributedString(string: title, attributes: attributes)
        self.accessoryType = accessoryType
        let height = ceil(
            attributedText.boundingRect(
                with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
                options: .usesLineFragmentOrigin,
                context: nil
            ).height
        )
        size = CGSize(width: width, height: height < 60 ? 60 : height)
    }
}

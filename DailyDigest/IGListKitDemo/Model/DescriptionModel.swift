// 
// DescriptionModel.swift
// Created on 2021/8/18
// Description <#⽂件描述#> 
// Copyright © 2021 Huami inc. All rights reserved. 
// @author 蔡龙君(cailongjun@huami.com)  

import UIKit

public struct DescriptionModel: Sizeable, Equatable {

    let attributedTitle: NSAttributedString
    let attributedDetail: NSAttributedString
    public var size: CGSize
    
    public init(
        title: String,
        titleAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black],
        detail: String,
        detailAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.black.withAlphaComponent(0.4)],
        preferredMaxLayoutWidth width: CGFloat = UIScreen.main.bounds.width - 30
    ) {
        self.attributedTitle = NSAttributedString(string: title, attributes: titleAttributes)
        self.attributedDetail = NSAttributedString(string: detail, attributes: detailAttributes)
        let height = Self.calculateHeight(
            attributedText: attributedDetail,
            preferredMaxLayoutWidth: width - 30
        )
        size = CGSize(width: width, height: height)
    }

    static func calculateHeight(attributedText: NSAttributedString, preferredMaxLayoutWidth: CGFloat) -> CGFloat {
        /// 描述文本高度
        let textHeight = attributedText.boundingRect(
            with: CGSize(width: preferredMaxLayoutWidth, height: CGFloat.greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            context: nil
        ).height
        /// 顶部至少52, 底部间距15
        return ceil(textHeight) + 67
    }
}

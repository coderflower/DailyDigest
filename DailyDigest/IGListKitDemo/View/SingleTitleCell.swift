//
//  SingleTitleCell.swift
//  MiDong
//  健康详情页面常规的带一个标题和一个>的cell
//  Created by 蔡龙君 on 2019/12/6.
//  Copyright © 2019 Anhui Huami Information Technology Co., Ltd. All rights reserved.
//

import UIKit

public class SingleTitleCell: UICollectionViewCell {

    /// 标题
    public lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor.black.withAlphaComponent(0.9)
        return $0
    }(UILabel())

    private(set) lazy var indicatorImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ic_arrow_forward_20")?.imageFlippedForRightToLeftLayoutDirection()
        return $0
    }(UIImageView())

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        configLocation()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configLocation()
    }
}

// MARK: - Configurable

extension SingleTitleCell: Configurable {
    public func config(using model: SingleTitleModel) {
        titleLabel.attributedText = model.attributedText
        indicatorImageView.isHidden = model.accessoryType == .none
    }
}

// MARK: - initialize

extension SingleTitleCell {
    private func initialize() {
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(titleLabel)
        contentView.addSubview(indicatorImageView)
    }

    private func configLocation() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: indicatorImageView.leadingAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            indicatorImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            indicatorImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
        /// 防止昵称过程导致indicatorImageView被压缩导致不显示
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
}

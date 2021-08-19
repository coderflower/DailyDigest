//
//  BodyDetailDescriptionCell.swift
//  MiDong
//  健康数据详情状态说明cell
//  Created by 蔡龙君 on 2019/12/5.
//  Copyright © 2019 Anhui Huami Information Technology Co., Ltd. All rights reserved.
//

import UIKit

public class DescriptionCell: UICollectionViewCell {
    /// 标题
    public lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.textColor = UIColor.black.withAlphaComponent(0.9)
        return $0
    }(UILabel())

    /// 描述label
    public lazy var detailLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = UIColor.black.withAlphaComponent(0.9)
        $0.numberOfLines = 0
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        configLocation()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
        configLocation()
    }
}

extension DescriptionCell: Configurable {
    public func config(using model: DescriptionModel) {
        titleLabel.attributedText = model.attributedTitle
        detailLabel.attributedText = model.attributedDetail
    }
}

// MARK: - initialize

extension DescriptionCell {
    private func initialize() {
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
    }

    private func configLocation() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])

        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 52),
            detailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
}

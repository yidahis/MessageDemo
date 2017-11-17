//
//  YMRightTableViewCell.swift
//  MessageDemo
//
//  Created by 易万军 on 2017/11/17.
//  Copyright © 2017年 易万军. All rights reserved.
//

import UIKit

class YMRightTableViewCell: YMTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thumbnailView.snp.makeConstraints { (make) in
            make.right.equalTo(-XSpace)
            make.top.equalTo(XSpace)
            make.height.width.equalTo(30)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.right.equalTo(thumbnailView.snp.left).offset(-XSpace)
            make.top.equalTo(thumbnailView)
            make.height.equalTo(21)
        }
        
        bodyLabel.snp.makeConstraints { (make) in
            make.right.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(contentView).offset(XSpace)
        }
        
    }

}

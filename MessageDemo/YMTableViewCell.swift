//
//  YMTableViewCell.swift
//  MessageDemo
//
//  Created by 易万军 on 2017/11/17.
//  Copyright © 2017年 易万军. All rights reserved.
//

import UIKit
import SnapKit
import SlackTextViewController

let XSpace : CGFloat = 12

class YMTableViewCell: UITableViewCell {
    var titleLabel: UILabel = UILabel()
    var bodyLabel: UILabel = UILabel()
    var thumbnailView: UIImageView = UIImageView()
    var indexPath: IndexPath = IndexPath()
    var usedForMessage: Bool = false
    
    var isRight: Bool = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       configUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configUI()
    }
    
    func configUI(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(thumbnailView)
        
        thumbnailView.contentMode = .scaleAspectFit
        
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        bodyLabel.font = UIFont.systemFont(ofSize: 14)
        
        bodyLabel.numberOfLines = 0
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thumbnailView.snp.removeConstraints()
        titleLabel.snp.removeConstraints()
        bodyLabel.snp.removeConstraints()
        
        if isRight == true {
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
        }else{
            thumbnailView.snp.makeConstraints { (make) in
                make.left.top.equalTo(XSpace)
                make.height.width.equalTo(30)
            }
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(thumbnailView.snp.right).offset(XSpace)
                make.top.equalTo(thumbnailView)
                make.height.equalTo(21)
            }
            
            bodyLabel.snp.makeConstraints { (make) in
                make.left.equalTo(titleLabel)
                make.top.equalTo(titleLabel.snp.bottom)
                make.right.equalTo(contentView).offset(-XSpace)
            }
        }
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        bodyLabel.text = ""
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    static func defaultFontSize() -> CGFloat{
        var pointSize: CGFloat = 16.0
        let contentSizeCategory = UIApplication.shared.preferredContentSizeCategory
        pointSize += SLKPointSizeDifferenceForCategory(contentSizeCategory.rawValue)
        return pointSize
    }

}

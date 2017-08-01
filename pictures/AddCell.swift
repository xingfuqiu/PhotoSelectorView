//
//  AddCell.swift
//  pictures
//
//  Created by XingfuQiu on 2017/7/31.
//  Copyright © 2017年 XingfuQiu. All rights reserved.
//

import UIKit

class AddCell: UICollectionViewCell {
    
    var onButtonClick: (() ->())?
    
    lazy var button: UIButton = {
        let btn: UIButton = UIButton(frame: self.bounds)
        btn.backgroundColor = .blue
        btn.setTitle("添加", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.tag = 101
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let top = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 0)
        
        contentView.addConstraints([top, left, right, bottom])
    }

}

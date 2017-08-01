//
//  PictureCell.swift
//  pictures
//
//  Created by XingfuQiu on 2017/7/31.
//  Copyright © 2017年 XingfuQiu. All rights reserved.
//

import UIKit

// MARK: - cell的点击事件协议
// 1.定义协议
protocol PhotoSelectorCellDelegate: NSObjectProtocol {
    // 加号按钮点击
    func photoSelectorCellDidClickAddButton(cell: PhotoCell)
    
    // 删除按钮点击
    func photoSelectorCellDidClickDeleteButton(cell: PhotoCell)
}

class PhotoCell: UICollectionViewCell {
    /// 代理
    weak var delegate: PhotoSelectorCellDelegate?
    /// 设置图片
    var image: UIImage? {
        didSet {
            // 设置图片
            addButton.setImage(image, for: .disabled)
            addButton.isEnabled = false
            // 显示删除按钮
            deleteButton.isHidden = false
        }
    }
    /// 加号按钮
    private lazy var addButton: UIButton = {
        let button = UIButton()
        
        button.setImage(#imageLiteral(resourceName: "icon_pandalist_add2_normal"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "icon_pandalist_add2_press"), for: .highlighted)
        button.addTarget(self, action: #selector(addButtonDidClick), for: .touchUpInside)
        button.contentMode = .scaleAspectFill
        return button
    }()
    /// 删除按钮
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        
        button.setImage(#imageLiteral(resourceName: "icon_layer_cancle_press"), for: .normal)
        button.addTarget(self, action: #selector(deleteButtonDidClick), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    /// 设置加号按钮
    func setupAddButton() {
        addButton.setImage(#imageLiteral(resourceName: "icon_pandalist_add2_normal"), for: .normal)
        addButton.setImage(#imageLiteral(resourceName: "icon_pandalist_add2_press"), for: .highlighted)
        addButton.isEnabled = true
        // 删除按钮隐藏掉
        self.deleteButton.isHidden = true
    }
    
    // MARK: - 按钮点击事件
    func addButtonDidClick() -> Void {
        delegate?.photoSelectorCellDidClickAddButton(cell: self)
    }
    
    func deleteButtonDidClick() -> Void {
        delegate?.photoSelectorCellDidClickDeleteButton(cell: self)
    }
    
    // MARK: - 准备UI
    /// 准备UI
    private func setupUI() {
        // 添加子控件
        contentView.addSubview(addButton)
        contentView.addSubview(deleteButton)
        
        // 添加约束
        // 作为独立工程最好少依赖第三方框架
        addButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        let viewDicts = ["ab": addButton, "rb": deleteButton]
        // 添加按钮
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[ab]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDicts))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[ab]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDicts))
        
        // 删除按钮
        // 水平方向在父控件右边一定距离
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[rb]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDicts))
        
        // 垂直方向在父控件顶部一定距离
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[rb]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDicts))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

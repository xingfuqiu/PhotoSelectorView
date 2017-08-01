//
//  UIImageExtensions.swift
//  pictures
//
//  Created by XingfuQiu on 2017/8/1.
//  Copyright © 2017年 XingfuQiu. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIImage扩展,等比例缩小图片到指定的宽度
extension UIImage {
    
    /**
     等比例缩小图片到指定的宽度
     - parameter newWidth: 缩放后的宽度
     */
    func scaleImage(newWidth: CGFloat = 300) -> UIImage {
        // 如果图片宽度小于 newWidth, 直接返回
        if size.width < newWidth {
            return self
        }
        
        // 计算缩放好后的高度
        // newHeight / newWidth = height / width
        let newHeight = newWidth * size.height / size.width
        
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        // 将图片等比例缩放到 newSize
        
        // 开启图片上下文
        UIGraphicsBeginImageContext(newSize)
        
        // 绘图
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        
        // 获取绘制好的图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 关闭绘图上下文
        UIGraphicsEndImageContext()
        
        // 返回绘制好的新图
        return newImage!
    }
}

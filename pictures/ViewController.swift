//
//  ViewController.swift
//  pictures
//
//  Created by XingfuQiu on 2017/7/31.
//  Copyright © 2017年 XingfuQiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var photoSelectorView: PhotoSelectorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "打印数量", style: .plain, target: self, action: #selector(buttonAction(_:)))
        // 不加这句，会出现顶部空白 64pt
        automaticallyAdjustsScrollViewInsets = false
    }
    
    func buttonAction(_ sender: UIButton) {
        print(photoSelectorView.photos.count)
    }
    
    /// 初始化选择器
    func initCollectionView() {
        
        photoSelectorView = PhotoSelectorView(self.navigationController)
        view.addSubview(photoSelectorView)
        
        view.addConstraint(NSLayoutConstraint(item: photoSelectorView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: photoSelectorView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 200))
        view.addConstraint(NSLayoutConstraint(item: photoSelectorView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: photoSelectorView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 142))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

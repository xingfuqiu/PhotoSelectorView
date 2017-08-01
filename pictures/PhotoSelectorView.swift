//
//  PhotoSelectorView.swift
//  pictures
//
//  Created by XingfuQiu on 2017/8/1.
//  Copyright © 2017年 XingfuQiu. All rights reserved.
//

import UIKit

class PhotoSelectorView: UICollectionView {
    
    /// 最大照片数量
    let maxCount = 9
    /// 照片数组
    var photos = [UIImage]()
    /// 外部 NavigationController 用于弹出 UIImagePickerController
    var nav: UINavigationController?
    
    init(_ nav: UINavigationController?) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: 64, height: 64)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .orange
        delegate = self
        dataSource = self
        register(PhotoCell.self, forCellWithReuseIdentifier: "Cell")
        translatesAutoresizingMaskIntoConstraints = false
        
        self.nav = nav
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension PhotoSelectorView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count < maxCount ? photos.count + 1 : photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoCell
        cell.delegate = self
        
        if indexPath.item < photos.count {
            cell.image = photos[indexPath.row]
        } else {
            cell.setupAddButton()
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

// MARK: - PhotoSelectorCellDelegate
extension PhotoSelectorView: PhotoSelectorCellDelegate {
    func photoSelectorCellDidClickAddButton(cell: PhotoCell) {
        let pickerVC = UIImagePickerController()
        // 设置代理
        pickerVC.delegate = self
        
        nav?.present(pickerVC, animated: true, completion: nil)
    }

    func photoSelectorCellDidClickDeleteButton(cell: PhotoCell) {
        // 先获取点击的是哪个位置的删除按钮
        let indexPath = self.indexPath(for: cell)
        
        photos.remove(at: indexPath!.item)
        
        reloadSections(IndexSet(integer: 0))
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension PhotoSelectorView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        let newImage = image.scaleImage()
        // 将选中的图片添加到图片数组
        photos.append(newImage)
        
        reloadSections(IndexSet(integer: 0))
        
        picker.dismiss(animated: true, completion: nil)
    }
}


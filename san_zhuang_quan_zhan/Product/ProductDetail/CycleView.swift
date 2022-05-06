//
//  CycleView.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/5/1.
//

import UIKit

class CycleView: UIView {
    private var collectView:UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectView.translatesAutoresizingMaskIntoConstraints = false
//        collectView.collectionViewLayout = layout
        collectView.register(CycleViewCell.self, forCellWithReuseIdentifier: CycleViewCell.description())
        collectView.isPagingEnabled = true
        collectView.showsVerticalScrollIndicator = false
        collectView.showsHorizontalScrollIndicator = false
        collectView.delegate = self
        collectView.dataSource = self
        addSubview(collectView)
        
        NSLayoutConstraint.activate([
            collectView.leftAnchor.constraint(equalTo: leftAnchor),
            collectView.rightAnchor.constraint(equalTo: rightAnchor),
            collectView.topAnchor.constraint(equalTo: topAnchor),
            collectView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CycleView:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CycleViewCell.description(), for: indexPath) as! CycleViewCell
        cell.imageView.image = UIImage(systemName: "star.fill")
        return cell
    }
}

extension CycleView:UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.bounds.size
    }
}

private class CycleViewCell:UICollectionViewCell{
    var imageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

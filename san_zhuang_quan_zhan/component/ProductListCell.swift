//
//  ProductListCell.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/10.
//

import UIKit
import SnapKit

class ProductListCell: UITableViewCell{
    
    private var coverView:UIImageView!
    private var nameLabel:UILabel!
    private var ratingView:RatingView!
    private var priceLabel:UILabel!
    private var collcerButton:UIButton!
    private var tradeNameLable:UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
//        selectionStyle = .none
        let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.spacing = 8
        hStack.alignment = .center
        hStack.layer.cornerRadius = 10
        hStack.layer.masksToBounds = true
        hStack.layer.borderColor = UIColor.systemGray5.cgColor
        hStack.layer.borderWidth = 1
        hStack.backgroundColor = .white
        contentView.addSubview(hStack)
        
        coverView = UIImageView()
        contentView.contentMode = .scaleAspectFit
        contentView.backgroundColor = .systemGray6
        hStack.addArrangedSubview(coverView)
        
        NSLayoutConstraint.activate([
            hStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            hStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            coverView.widthAnchor.constraint(equalToConstant: 140),
            coverView.heightAnchor.constraint(equalToConstant: 140)
        ])
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.alignment = .leading
        vStack.spacing = 6
        hStack.addArrangedSubview(vStack)
        
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .black
        vStack.addArrangedSubview(nameLabel)
        
        ratingView = RatingView()
//        ratingView.backgroundColor = .systemOrange
        vStack.addArrangedSubview(ratingView)
        
        NSLayoutConstraint.activate([
            ratingView.widthAnchor.constraint(equalToConstant: 100),
            ratingView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        let priceHStack = UIStackView()
        vStack.addArrangedSubview(priceHStack)
        
        priceLabel = UILabel()
        priceLabel.font = .boldSystemFont(ofSize: 24)
        priceLabel.textColor = .systemOrange
        priceHStack.addArrangedSubview(priceLabel)
        
        collcerButton = UIButton()
        collcerButton.tintColor = .systemRed
        collcerButton.setImage(UIImage(systemName: "heart"), for: .normal)
        collcerButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        priceHStack.addArrangedSubview(collcerButton)
        
        collcerButton.leftAnchor.constraint(equalTo: vStack.rightAnchor, constant: -32).isActive = true
        
        tradeNameLable = UILabel()
        tradeNameLable.font = .systemFont(ofSize: 15)
        tradeNameLable.textColor = .black
        vStack.addArrangedSubview(tradeNameLable)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setRating(_ rating:Int){
        ratingView.rating = rating
    }
    
    func setCover(_ cover:String){
        coverView.image = UIImage(systemName: "star.fill")
    }
    
    func setName(_ name:String){
        nameLabel.text = name
    }
    
    func setPrice(_ price:Double){
        priceLabel.text = String(format: "%.2f", price)
    }
    
    func setCollect(_ collect:Bool){
        collcerButton.isSelected = collect
    }
    
    func setTradeName(_ trade:String){
        tradeNameLable.text = trade
    }
}

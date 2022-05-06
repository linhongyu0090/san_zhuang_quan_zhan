//
//  ExamineListCell.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/12.
//

import UIKit

class ExamineListCell: UITableViewCell {
    private lazy var tradeNameLabel:UILabel = {
        let tradeNameLabel = UILabel()
        tradeNameLabel.numberOfLines = 1
        tradeNameLabel.textColor = .black
        tradeNameLabel.textAlignment = .center
        tradeNameLabel.font = .boldSystemFont(ofSize: 20)
        return tradeNameLabel
    }()
    
    private lazy var coverImageView:UIImageView = {
       let coverImageView = UIImageView()
        coverImageView.contentMode = .scaleAspectFit
        return coverImageView
    }()
    
    private lazy var productNameLabel:UILabel = {
        let productNameLabel = UILabel()
        productNameLabel.numberOfLines = 0
        productNameLabel.textColor = .black
        productNameLabel.font = .systemFont(ofSize: 20)
        return productNameLabel
    }()
    
    private lazy var priceLabel:UILabel = {
        let priceLabel = UILabel()
        priceLabel.numberOfLines = 1
        priceLabel.textColor = .systemOrange
        priceLabel.font = .boldSystemFont(ofSize: 20)
        return priceLabel
    }()
    
    private lazy var infoStack:UIStackView = {
        let infoStack = UIStackView()
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        infoStack.axis = .vertical
        infoStack.alignment = .leading
        infoStack.addArrangedSubview(productNameLabel)
        infoStack.addArrangedSubview(priceLabel)
        return infoStack
    }()
    
    private lazy var hStack:UIStackView = {
        let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.alignment = .leading
        hStack.addArrangedSubview(coverImageView)
        hStack.addArrangedSubview(infoStack)
        hStack.spacing = 8
        return hStack
    }()
    
    
    private lazy var vStack:UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.backgroundColor = .white
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.alignment = .center
        vStack.layer.cornerRadius = 15
        vStack.spacing = 8
        vStack.layer.masksToBounds = false
        vStack.layer.borderColor = UIColor.systemGray6.cgColor
        vStack.layer.borderWidth = 1
        vStack.addArrangedSubview(tradeNameLabel)
        vStack.addArrangedSubview(hStack)
        
        return vStack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(vStack)
        contentView.backgroundColor = .systemGray6
        NSLayoutConstraint.activate([
            vStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            vStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            tradeNameLabel.leftAnchor.constraint(equalTo: vStack.leftAnchor, constant: 5),
            tradeNameLabel.heightAnchor.constraint(equalToConstant: 15),
            hStack.leftAnchor.constraint(equalTo: vStack.leftAnchor),
            hStack.rightAnchor.constraint(equalTo: vStack.rightAnchor),
            coverImageView.leftAnchor.constraint(equalTo: hStack.leftAnchor,constant: 5),
            coverImageView.widthAnchor.constraint(equalToConstant: 100),
            coverImageView.heightAnchor.constraint(equalToConstant: 100),
//            priceLabel.centerYAnchor.constraint(equalTo: hStack.centerYAnchor),
//            priceLabel.rightAnchor.constraint(equalTo: hStack.rightAnchor, constant: -30),
//            tradeNameLabel.topAnchor.constraint(equalTo: vStack.topAnchor, constant: 5),
//            tradeNameLabel.widthAnchor.constraint(equalTo: vStack.widthAnchor),
//            tradeNameLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func setCover(_ cover:String){
        coverImageView.image = UIImage(systemName: "heart.fill")
    }
    
    func setName(_ name:String){
        productNameLabel.text = name
    }
    
    func setPrice(_ price:Double){
        priceLabel.text = String(format: "%.2f", price)
    }
    
    
    func setTradeName(_ trade:String){
        tradeNameLabel.text = trade
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

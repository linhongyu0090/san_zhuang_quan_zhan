//
//  ConductCell.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/11.
//

import UIKit

class ConductCell: UITableViewCell {
    private var hStack:UIStackView!
    private var vStack:UIStackView!
    private var tradeNameLabel : UILabel!
    private var countLabel:UILabel!
    private var circle:UIView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
//        hStack.contentMode = .scaleAspectFit
        hStack.axis = .horizontal
        hStack.layer.cornerRadius = 8
        hStack.layer.masksToBounds = true
        hStack.layer.borderColor = UIColor.systemGray5.cgColor
        hStack.layer.borderWidth = 1
        hStack.backgroundColor = .white
        contentView.addSubview(hStack)
        
        NSLayoutConstraint.activate([
            hStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            hStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            hStack.heightAnchor.constraint(equalToConstant: 200),
            hStack.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .systemOrange
        circle.layer.cornerRadius = 5
        circle.layer.masksToBounds = true
        hStack.addArrangedSubview(circle)
        NSLayoutConstraint.activate([
            circle.heightAnchor.constraint(equalToConstant: 10),
            circle.widthAnchor.constraint(equalToConstant: 10),
//            circle.centerYAnchor.constraint(equalTo: hStack.centerYAnchor)
        ])
        
        vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.alignment = .leading
        vStack.spacing = 8
        
        tradeNameLabel = UILabel()
        tradeNameLabel.font = .systemFont(ofSize: 20)
        tradeNameLabel.textColor = .black
        tradeNameLabel.backgroundColor = .white
        vStack.addArrangedSubview(tradeNameLabel)
        
        countLabel = UILabel()
        countLabel.font = .systemFont(ofSize: 20)
        countLabel.textColor = .black
        countLabel.backgroundColor = .white
        vStack.addArrangedSubview(countLabel)
        
        hStack.addArrangedSubview(vStack)
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setTradeName(trade:String){
        tradeNameLabel.text = "商家名: " + trade
    }
    
    func setCount(count:Int){
        countLabel.text = "提交不合格商品数：" + String(format: "%2d", count)
        
     }
    
}

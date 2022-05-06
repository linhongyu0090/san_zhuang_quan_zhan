//
//  ProductView.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/5/1.
//

import UIKit

class ProductView: UIView {
    private var vStack:UIStackView!
    private var nameLabel:UILabel!
    private var tradeLabel:UILabel!
    private var priceLabel:UILabel!
    private var detailLabel:UILabel!
    private var collectButton:UIButton!
    private var ratingView:RatingView!
    private var cycleView:CycleView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.translatesAutoresizingMaskIntoConstraints = false
        
        cycleView = CycleView()
        addSubview(cycleView)
        
        NSLayoutConstraint.activate([
            cycleView.leftAnchor.constraint(equalTo: leftAnchor),
            cycleView.rightAnchor.constraint(equalTo: rightAnchor),
            cycleView.topAnchor.constraint(equalTo: topAnchor),
            cycleView.heightAnchor.constraint(equalTo:cycleView.widthAnchor)
        ])
        
        vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.alignment = .leading
        vStack.axis = .vertical
        vStack.spacing = 6
        vStack.layer.cornerRadius = 8
        vStack.layer.masksToBounds = true
        addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.leftAnchor.constraint(equalTo: leftAnchor,constant: 15),
            vStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            vStack.topAnchor.constraint(equalTo:cycleView.bottomAnchor,constant: 10),
//            vStack.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10)
        ])
        
        nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        vStack.addArrangedSubview(nameLabel)
        
        tradeLabel = UILabel()
        tradeLabel.font = .systemFont(ofSize: 15)
        tradeLabel.textColor = .black
        tradeLabel.numberOfLines = 0
        vStack.addArrangedSubview(tradeLabel)
        
        ratingView = RatingView()
        vStack.addArrangedSubview(ratingView)
        
        let hStack = UIStackView()
//        hStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.addArrangedSubview(hStack)
        
        priceLabel = UILabel()
        priceLabel.font = .boldSystemFont(ofSize: 20)
        priceLabel.textColor = .systemOrange
        hStack.addArrangedSubview(priceLabel)
        
        collectButton = UIButton()
        collectButton.tintColor = .systemRed
        collectButton.setImage(UIImage(systemName: "heart"), for: .normal)
        collectButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        hStack.addArrangedSubview(collectButton)
        
        detailLabel = UILabel()
        detailLabel.textColor = .systemBrown
        detailLabel.font = .systemFont(ofSize: 20)
        detailLabel.numberOfLines = 0
        vStack.addArrangedSubview(detailLabel)
        
//        collectButton.leftAnchor.constraint(equalTo: vStack.rightAnchor, constant: -32).isActive = true
        collectButton.rightAnchor.constraint(equalTo: vStack.rightAnchor, constant: -8).isActive = true
        collectButton.setContentHuggingPriority(.required, for: .horizontal)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        frame.size.height = vStack.frame.maxY + 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setRating(_ rating:Int){
        ratingView.rating = rating
    }
    
    func setName(_ name:String){
        nameLabel.text = name
    }
    
    func setTrade(_ trade:String){
        tradeLabel.text = trade
    }
    
    func setDetail(_ detail:String){
        detailLabel.text = detail
    }
    
    func setPrice(_ price:Double){
        priceLabel.text = String(format: "%.2f", price)
    }
    
    func setCollect(_ collect:Bool){
        collectButton.isSelected = collect
    }
    
    
//    func setTradeName(_ trade:String){
//        tradeNameLable.text = trade
//    }
}

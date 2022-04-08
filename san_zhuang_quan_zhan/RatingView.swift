//
//  RatingView.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/8.
//

import UIKit

class RatingView: UIStackView {
    var rating:Int{
        get{_rating}
        set{_rating = min(max(newValue,0),5)}
    }
    private var _rating : Int = 0{
        didSet{
            for (i,button) in buttons.enumerated(){
                button.isSelected = (i < _rating)
            }
        }
    }
    
    private var buttons:[UIButton] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isUserInteractionEnabled = false
        
        for _ in 0..<5{
            let button = UIButton()
            button.tintColor = .systemYellow
            button.setImage(UIImage(systemName: "star"), for: .normal)
            button.setImage(UIImage(systemName: "star.fill"), for: .selected)
            addArrangedSubview(button)
            buttons.append(button)
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 20),
                button.heightAnchor.constraint(equalToConstant: 20)
            ])
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

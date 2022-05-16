//
//  CircleView.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/5/7.
//

import Foundation
import UIKit

class CircleVoew:UIStackView{
    var circleNumber:Int{
        get{_number}
        set{_number = min(max(newValue,0),5)}
    }
    
    private var _number:Int = 0{
        didSet{
            for(i,circle) in circles.enumerated(){
                circle.isSelected = (i < _number)
            }
        }
    }

    private var circles:[UIButton] = []
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        
        for _ in 0..<5{
            let circle = UIButton()
            circle.tintColor = .blue
            circle.setImage(UIImage(systemName: "circle"), for: .normal)
            circle.setImage(UIImage(systemName: "circle.fill"), for: .selected)
            self.addArrangedSubview(circle)
            circles.append(circle)
            NSLayoutConstraint.activate([
                circle.widthAnchor.constraint(equalToConstant: 20),
                circle.heightAnchor.constraint(equalToConstant: 20)
            ])
            
    
        }
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

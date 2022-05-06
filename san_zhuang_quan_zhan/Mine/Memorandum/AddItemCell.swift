//
//  AddItemCell.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/5/5.
//

import UIKit

class AddItemCell: UITableViewCell {

    
    private lazy var textField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .natural
        textField.textColor = .black
        textField.clearButtonMode = .always
        textField.font = .systemFont(ofSize: 20)
        textField.placeholder = "请输入备忘录的内容"
        return textField
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
//        hStack.contentMode = .scaleAspectFit
        hStack.axis = .horizontal
        hStack.layer.cornerRadius = 8
        hStack.layer.masksToBounds = true
        hStack.layer.borderColor = UIColor.systemGray5.cgColor
        hStack.layer.borderWidth = 1
        hStack.backgroundColor = .white
        
        hStack.addSubview(textField)

        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: hStack.leftAnchor),
            textField.rightAnchor.constraint(equalTo: hStack.rightAnchor),
            textField.topAnchor.constraint(equalTo: hStack.topAnchor),
            textField.bottomAnchor.constraint(equalTo: hStack.bottomAnchor)
        ])
        
        contentView.addSubview(hStack)
        
        NSLayoutConstraint.activate([
            hStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            hStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            hStack.heightAnchor.constraint(equalToConstant: 200),
            hStack.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

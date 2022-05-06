//
//  CommentListCell.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/30.
//

import UIKit

class CommentListCell: UITableViewCell {

    private var avatarView:UIImageView!
    private var nameLabel:UILabel!
    private var ratingView:RatingView!
    private var contentLabel:UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .white
        
        let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.alignment = .top
        hStack.spacing = 8
        contentView.addSubview(hStack)
        
        avatarView = UIImageView()
        avatarView.contentMode = .scaleAspectFit
        hStack.addArrangedSubview(avatarView)
        NSLayoutConstraint.activate([
            hStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            hStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            avatarView.widthAnchor.constraint(equalToConstant: 30),
            avatarView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.alignment = .leading
        vStack.spacing = 6
        hStack.addArrangedSubview(vStack)
        
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 18)
        nameLabel.textColor = .black
        vStack.addArrangedSubview(nameLabel)
        nameLabel.heightAnchor.constraint(equalTo: avatarView.heightAnchor).isActive = true
        
        ratingView = RatingView()
        vStack.addArrangedSubview(ratingView)
        
        contentLabel = UILabel()
        contentLabel.font = .systemFont(ofSize: 16)
        contentLabel.textColor = .black
        contentLabel.numberOfLines = 0
        vStack.addArrangedSubview(contentLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAvatar(_ avatar:String){
        avatarView.image = UIImage(systemName: avatar)
    }
    
    func setName(_ name:String){
        nameLabel.text = name
    }
    
    func setRating(_ rating:Int){
        ratingView.rating = rating
    }
    
    func setContent(_ content:String){
        contentLabel.text = content
    }

}

//
//  MineVC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/13.
//

import UIKit
import SnapKit

class MineVC: UIViewController {
    var memoCell:CommonCell!
    var groupCell:CommonCell!
    var settingCell:CommonCell!
    var topView:UIView!
    var avatarView:UIImageView!
    var nameLabel:UILabel!
    var countLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.navigationItem.title = .none
        createTopViews()
        creatCells()
        // Do any additional setup after loading the view.
    }
    private func createTopViews(){
        topView = UIView(frame: .zero)
        topView.backgroundColor = .white
        topView.layer.cornerRadius = 10
        topView.layer.masksToBounds = true
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(50)
            make.height.equalTo(200)
        }
        avatarView = UIImageView(image: UIImage(systemName: "circle.fill"))
        avatarView.backgroundColor = .white
        avatarView.layer.cornerRadius = 60
        avatarView.layer.masksToBounds = true
        topView.addSubview(avatarView)
        avatarView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(120)
        }
        
        nameLabel = UILabel()
        nameLabel.text = "name"
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 25)
        topView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarView.snp.right).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(100)
            make.centerY.equalToSuperview().offset(-5)
        }
        
        countLabel = UILabel()
        countLabel.text = "count"
        countLabel.textColor = .black
        countLabel.font = .systemFont(ofSize: 20)
        topView.addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarView.snp.right).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(100)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        
    }
    
    private func creatCells(){
        let vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.alignment = .leading
        vStack.spacing = 8
        vStack.layer.cornerRadius = 10
        vStack.layer.masksToBounds = true
        vStack.backgroundColor = .white
        view.addSubview(vStack)
        
        vStack.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(150)
            make.top.equalTo(topView.snp.bottom).offset(10)
        }
        
        memoCell = CommonCell()
        vStack.addArrangedSubview(memoCell)
        memoCell.title = "备忘录"
        memoCell.icon = UIImage(systemName: "book")
        memoCell.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(50)
        }
        memoCell.addTarget(self, action: #selector(clickAccountCell), for: .touchUpInside)
        
        groupCell = CommonCell()
        vStack.addArrangedSubview(groupCell)
        groupCell.title = "帮助与反馈"
        groupCell.icon = UIImage(systemName: "circle")
        vStack.addArrangedSubview(groupCell)
        groupCell.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalTo(memoCell.snp.bottom)
            make.height.equalTo(50)
        }
        
        settingCell = CommonCell()
        vStack.addArrangedSubview(settingCell)
        settingCell.title = "设置"
        settingCell.icon = UIImage(systemName: "pencil.and.outline")
        vStack.addArrangedSubview(settingCell)
        settingCell.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalTo(groupCell.snp.bottom)
            make.height.equalTo(50)
        }
        settingCell.addTarget(self, action: #selector(clickSetting), for: .touchUpInside)

    }
    @objc func clickAccountCell(){
//        Swift.debugPrint("Cell")
        let memoVC = MemorandumVC()
//        self.navigationController?.pushViewController(memoVC, animated: true)
//        self.modalPresentationStyle = .fullScreen
        memoVC.modalPresentationStyle = .fullScreen
        memoVC.modalTransitionStyle = .coverVertical
//        self.present(memoVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    @objc func clickSetting(){
        
    }
    

    
}

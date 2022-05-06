//
//  AddItemVC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/5/5.
//

import UIKit

class AddItemVC: UIViewController {
    private var tableView:UITableView!
    private var backButton:UIBarButtonItem!
    private var saveButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AddItemCell.self, forCellReuseIdentifier: "addItem")
//        tableView.selec
        tableView.separatorStyle = .none
        tableView.rowHeight = 200
//        tableView.style = .grouped
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.backgroundColor = .systemGray5
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(clickBackButton))
        self.navigationItem.leftBarButtonItem = backButton
        
        saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(clicksaveButton))
        self.navigationItem.rightBarButtonItem = saveButton
        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func clickBackButton(){
        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true)
    }
    @objc func clicksaveButton(){
        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true)
    }
    
}
extension AddItemVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addItem", for: indexPath) as! AddItemCell
        return cell
    }
}

extension AddItemVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(#function)
//        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//
//  MemorandumVC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/5/5.
//

import UIKit
import CoreData

class MemorandumVC: UIViewController{
    private var tableView:UITableView!
    private var addItem:UIBarButtonItem!
    
    
//    let tableView = UITableView()
    let Entityname = "TodoList"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Todo List"
        
//        tableView = UITableView()
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.rowHeight = 100
//        tableView.separatorStyle = .none
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "memocell")
//        self.view.addSubview(tableView)
//
//        NSLayoutConstraint.activate([
//            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
//            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//        ])
        addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(clickAddItemButton))
        self.navigationItem.rightBarButtonItem = addItem

    }
    @objc func clickAddItemButton(){
//        let addItemVC = AddItemVC()
//        self.navigationController?.pushViewController(addItemVC, animated: true)
//        print(#function)
        let alertController = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields![0] as? UITextField{
                
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addTextField { (textField) in
            textField.placeholder = "Please input the todo Item"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.frame = self.view.frame
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }


}
extension MemorandumVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memocell", for: indexPath)
        cell.textLabel?.text = String(indexPath.description)
        cell.accessoryType = .checkmark
        return cell
    }
}
extension MemorandumVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(#function)
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .none{
            cell?.accessoryType = .checkmark
        }else{
            cell?.accessoryType = .none
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//
//  ProductDetailVC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/28.
//

import UIKit

class ProductDetailVC: UIViewController{
    
    
    private let product:Product
    private var detailView:ProductView!
    
    private var tableView:UITableView!
    
    init (product:Product){
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(CommentListCell.self, forCellReuseIdentifier: CommentListCell.description())
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        detailView = ProductView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 0))
//        detailView.translatesAutoresizingMaskIntoConstraints = false
//        detailView.setName("the name of the product")
//        detailView.setRating(5)
//        detailView.setPrice(123.45)
//        detailView.setCollect(true)
//        detailView.setDetail(String(repeating: "the detail information of the product", count: 10))
//        detailView.setTrade("the name of the trade")
        detailView.setName(product.name)
        detailView.setRating(product.rating)
        detailView.setPrice(product.price)
        detailView.setCollect(true)
        detailView.setDetail(String(repeating: "the detail information of the product", count: 10))
        detailView.setTrade(product.tradename)
//        detailView.layer.zPosition = -1
        detailView.layoutIfNeeded()
        tableView.tableHeaderView = detailView
        
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
        
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
extension ProductDetailVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentListCell.description(), for: indexPath) as! CommentListCell
        if(indexPath.row % 2 == 0){
            cell.setAvatar("person.circle.fill")
            cell.setName("张三")
            cell.setRating(4)
            cell.setContent("好评")
        }else{
            cell.setAvatar("person.circle.fill")
            cell.setName("李四")
            cell.setRating(5)
            cell.setContent(String(repeating: "超级好评 ", count: 10))
        }
        return cell
    }
    
}

extension ProductDetailVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
}


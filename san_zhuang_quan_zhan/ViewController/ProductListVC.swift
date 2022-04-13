///Users/linhongyu/Developer/san_zhuang_quan_zhan/san_zhuang_quan_zhan/ConductVC.swift
//  ProductListVC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/8.
//

import UIKit
import MJRefresh

class ProductListVC: UIViewController,BannerViewDatasourse,BannerViewDelegate{
    func didSelectBanner(_ bannerView: BannerView, index: Int)  {
        
    }
    func numberOfBanners(_ bannerView: BannerView) -> Int {
        return 5
    }
    
    
    func viewForBanner(_ bannerView: BannerView, index: Int, convertView: UIView?) -> UIView {
        if let view = convertView as? UIImageView{
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.image = UIImage(systemName: "star")
            return imageView
        }else{
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 10
            imageView.layer.masksToBounds = true
            imageView.image = UIImage(named: image[index])
            return imageView
        }
    }
    
    var list:[Product] = []
    
    let image:[String] = ["p1","p2","p3","p4","p5"]
    
    private var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray5
        
        let bannerView = BannerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 176))
//        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.autoScrollIntreval = 2
        bannerView.isInfinite = true
        bannerView.dataSourse = self
        bannerView.delegate = self
//        self.view.addSubview(bannerView)
        
        tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
        tableView.register(ProductListCell.self, forCellReuseIdentifier: ProductListCell.description())
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = bannerView
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            tableView.topAnchor.constraint(equalTo: bannerView.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        let header = MJRefreshNormalHeader{
//            print("refresh")
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.tableView.mj_header?.endRefreshing()
//            }
            self.refreshData()
        }
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.isHidden = true
        tableView.mj_header = header


    }
    func refreshData(){
        NetworkAPI.homeProductList { result in
            self.tableView.mj_header?.endRefreshing()
            switch result{
            case let .success(list):
                self.list = list
                self.tableView.reloadData()
            case let .failure(error):print("Failure:\(error)")
            }
        }
    }


}

extension ProductListVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        list.count
        20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let product = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListCell.description(), for: indexPath) as! ProductListCell
//        cell.textLabel?.text = indexPath.description
//        cell.setCover(" ")
//        cell.setName(product.name)
//        cell.setPrice(product.price)
//        cell.setCollect(true)
//        cell.setRating(product.rating)
//        cell.setTradeName("the name of the trade")
        cell.setCover(" ")
        cell.setName("product.name")
        cell.setPrice(20)
        cell.setCollect(true)
        cell.setRating(5)
        cell.setTradeName("the name of the trade")
        return cell
    }
}
extension ProductListVC:UITableViewDelegate{

}

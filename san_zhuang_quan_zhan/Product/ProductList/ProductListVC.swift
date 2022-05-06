//Users/linhongyu/Developer/san_zhuang_quan_zhan/san_zhuang_quan_zhan/ConductVC.swift
//  ProductListVC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/8.
//

import UIKit
import MJRefresh
//import PKHUD

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
            imageView.image = UIImage(named:image[index])
//            imageView.image = UIImage(systemName: "star")
            return imageView
        }
    }
    
    var list:[Product] = []
    
    var filterList:[Product] = []
    
    let image:[String] = ["p1","p2","p3","p4","p5"]
//    let image:[String] = ["1","2","3","4","5"]
    
    private var tableView:UITableView!
    
    let  searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray5
        self.navigationItem.title = .none
        
        let bannerView = BannerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 176))
        bannerView.autoScrollIntreval = 2
        bannerView.isInfinite = true
        bannerView.dataSourse = self
        bannerView.delegate = self
        
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
            print("refresh")
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.tableView.mj_header?.endRefreshing()
//            }
            self.refreshData()
        }
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.isHidden = true
        tableView.mj_header = header

        setupSearchController()
        
    }
    func refreshData(){
//        NetworkAPI.homeProductList { result in
//            self.tableView.mj_header?.endRefreshing()
//            switch result{
//            case let .success(list):
//                self.list = list
//                self.tableView.reloadData()
//            case let .failure(error):print("Failure:\(error)")
//            }
//        }
    }
    
    func setupSearchController(){
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = ["All","Phone","iPad","Other"]
        if #available(iOS 11, *){
            self.navigationItem.searchController = searchController
            self.navigationItem.searchController?.isActive = true
            self.navigationItem.hidesSearchBarWhenScrolling = false
        }else{
            tableView.tableFooterView = searchController.searchBar
        }
    }
    
    func filterContentForSearchText(_ searchText:String,scope:String = "All"){
        filterList = list.filter{ product in
            if !(product.category == scope) && scope != "All"{
                return false
            }
            return product.name.lowercased().contains(searchText.lowercased()) || searchText == ""
        }
        tableView.reloadData()
    }


}

extension ProductListVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filterList.count
        }
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var product:Product
        product = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListCell.description(), for: indexPath) as! ProductListCell
        if searchController.isActive{
            product = filterList[(indexPath as NSIndexPath).row]
        }else{
            product = list[(indexPath as NSIndexPath).row]
        }
        cell.setName(product.name)
        cell.setPrice(product.price)
        cell.setCollect(true)
        cell.setRating(product.rating)
        cell.setTradeName(product.tradename)
        cell.setCover(" ")
        cell.setCategroy(product.category)
        return cell
    }
}
extension ProductListVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = list[indexPath.row]
        let productDetailVC = ProductDetailVC(product: product)
        self.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}

extension ProductListVC:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!,scope: scope)
    }
}

extension ProductListVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!,scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

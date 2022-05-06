//
//  UserTBC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/5/6.
//

import UIKit

class UserTBC: UITabBarController {

    private var productListNC:UINavigationController!
    private var productListVC:ProductListVC!
    private var uploadProductNC:UINavigationController!
    private var uploadProductVC:UploadProductVC!
    private var orderNC:UINavigationController!
    private var orderVC:OrderVC!
    private var mineNC:UINavigationController!
    private var mineVC:MineVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productListVC = ProductListVC()
        productListVC.title = "商品"
        productListVC.tabBarItem.image = UIImage(systemName: "bag")
        productListVC.tabBarItem.selectedImage = UIImage(named: "bag.fill")
        productListVC.tabBarItem.badgeValue = "TOP"
        productListVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        productListNC = UINavigationController(rootViewController: productListVC)
        
        
        uploadProductVC = UploadProductVC()
        uploadProductVC.title = "上传"
        uploadProductVC.tabBarItem.image = UIImage(systemName: "pencil.circle")
        uploadProductVC.tabBarItem.selectedImage = UIImage(systemName: "pencil.circle")
        uploadProductNC = UINavigationController(rootViewController: uploadProductVC)
        
        orderVC = OrderVC()
        orderVC.title = "订单"
        orderVC.tabBarItem.image = UIImage(systemName: "bag")
        orderVC.tabBarItem.selectedImage = UIImage(systemName: "bag.fill")
        orderNC = UINavigationController(rootViewController: orderVC)
        
        mineVC = MineVC()
        mineVC.title = "我的"
        mineVC.tabBarItem.image = UIImage(systemName: "house")
        mineVC.tabBarItem.selectedImage = UIImage(systemName: "house")
        mineNC = UINavigationController(rootViewController: mineVC)

        viewControllers = [productListNC,uploadProductNC,orderNC,mineNC]
     
    }

}

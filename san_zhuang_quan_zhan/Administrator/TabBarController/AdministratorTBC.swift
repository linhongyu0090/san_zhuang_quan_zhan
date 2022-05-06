//
//  AdministratorTBC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/11.
//

import UIKit
import SwiftUI

class AdministratorTBC: UITabBarController,UITabBarControllerDelegate{
    private var productListNC:UINavigationController!
    private var productListVC:ProductListVC!
    private var examineNC:UINavigationController!
    private var examineVC:ExamineVC!
//    private var examineDoneVC:ExamineDoneVC!
    private var conductNC:UINavigationController!
    private var conductVC:ConductVC!
    private var mineNC:UINavigationController!
    private var mineVC:MineVC!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        productListVC = ProductListVC()
        productListVC.title = "商品"
        productListVC.tabBarItem.image = UIImage(systemName: "bag")
        productListVC.tabBarItem.selectedImage = UIImage(named: "bag.fill")
        productListVC.tabBarItem.badgeValue = "TOP"
        productListVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        productListNC = UINavigationController(rootViewController: productListVC)
        
        examineVC = ExamineVC()
        examineVC.title = "审核"
        examineVC.tabBarItem.image = UIImage(systemName: "list.dash")
        examineVC.tabBarItem.selectedImage = UIImage(systemName: "list.dash")
//        examineDoneVC()
        examineNC = UINavigationController(rootViewController: examineVC)
        
        conductVC = ConductVC()
        conductVC.title = "处理"
        conductVC.tabBarItem.image = UIImage(systemName: "pencil.circle")
        conductVC.tabBarItem.selectedImage = UIImage(systemName: "pencil.circle")
        conductNC = UINavigationController(rootViewController: conductVC)
        
        mineVC = MineVC()
        mineVC.title = "我的"
        mineVC.tabBarItem.image = UIImage(systemName: "house")
        mineVC.tabBarItem.selectedImage = UIImage(systemName: "house")
        mineNC = UINavigationController(rootViewController: mineVC)
        
        
        tabBar.tintColor = .systemOrange
        tabBar.contentMode = .scaleAspectFill
        
        let tabbarAppearance = UITabBarAppearance()
        tabbarAppearance.configureWithDefaultBackground()
        
        let tabbarItemAppearance = UITabBarItemAppearance()
        tabbarItemAppearance.normal.iconColor = .label
        tabbarItemAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor.label,
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 11,weight: .light)
        ]
        tabbarItemAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 11,weight: .light)
        ]
        
        tabbarAppearance.stackedLayoutAppearance = tabbarItemAppearance
        tabBar.standardAppearance = tabbarAppearance
        tabBar.scrollEdgeAppearance = tabbarAppearance

        viewControllers = [productListNC,examineNC,conductNC,mineNC]
        
        // Do any additional setup after loading the view.
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let items = tabBar.items!
        let itemNames = ["购物","审核","处理","我的"]
        let homeTabbarItem = items[0]
        let index = tabBar.items!.firstIndex(of: item)!
        if(index == 0){
            homeTabbarItem.title = nil
            homeTabbarItem.badgeColor = .systemRed
        }else{
            homeTabbarItem.title = itemNames[0]
            homeTabbarItem.imageInsets = .zero
        }
        
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}

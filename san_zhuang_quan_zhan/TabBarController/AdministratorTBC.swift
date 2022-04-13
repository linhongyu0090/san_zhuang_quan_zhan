//
//  AdministratorTBC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/11.
//

import UIKit

class AdministratorTBC: UITabBarController {
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
        
        productListVC = ProductListVC()
        productListVC.title = "商品"
        productListVC.tabBarItem.image = UIImage(systemName: "globe.americas")
        productListVC.tabBarItem.selectedImage = UIImage(systemName: "globe.americas.fill")
        productListNC = UINavigationController(rootViewController: productListVC)
        
        examineVC = ExamineVC()
        examineVC.title = "审核"
        examineVC.tabBarItem.image = UIImage(systemName: "leaf.circle")
        examineVC.tabBarItem.selectedImage = UIImage(systemName: "leaf.circle.fill")
//        examineDoneVC()
        examineNC = UINavigationController(rootViewController: examineVC)
        
        conductVC = ConductVC()
        conductVC.title = "处理"
        conductVC.tabBarItem.image = UIImage(systemName: "house.circle")
        conductVC.tabBarItem.selectedImage = UIImage(systemName: "house.circle.fill")
        conductNC = UINavigationController(rootViewController: conductVC)
        
        mineVC = MineVC()
        mineVC.title = "我的"
        mineVC.tabBarItem.image = UIImage(systemName: "start")
        mineVC.tabBarItem.selectedImage = UIImage(systemName: "start.fill")
        mineNC = UINavigationController(rootViewController: mineVC)
        

        viewControllers = [productListNC,examineNC,conductNC,mineNC]
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

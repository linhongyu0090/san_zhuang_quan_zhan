//
//  ExamineVC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/11.
//

import UIKit

class ExamineVC: UIViewController {
    var products:[Product]!
    var product1:Product!
    var product2:Product!
    var product3:Product!
    private var segmentControl:UISegmentedControl!
    private var navItem:UINavigationItem!
    private var scrollView:UIScrollView!
    private var notExaminedTableView:UITableView!
    private var examinedTableView:UITableView!
    
    var height:CGFloat!
    var width:CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        height = self.view.bounds.height
        width = self.view.bounds.width
        
        let segmentTextContent = [
        NSLocalizedString("未审核", comment: ""),
        NSLocalizedString("已审核", comment: "")
        ]
        segmentControl = UISegmentedControl(items: segmentTextContent)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.autoresizingMask = .flexibleWidth
        segmentControl.frame = CGRect(x: 50, y: 200, width: 400, height: 30)
//        segmentControl.tintColor = .orange
        segmentControl.selectedSegmentTintColor = .systemBlue
        segmentControl.backgroundColor = .systemGray5
        segmentControl.addTarget(self, action: #selector(segmentDidChanged), for: .valueChanged)
        self.navigationItem.titleView = segmentControl
        
//        navigationItem.titleView = segment
//        self.view.addSubview(segment)
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y:100, width: width, height: height - 80))
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.contentSize = CGSize(width: width * 2, height: height)
        scrollView.backgroundColor = .systemGray5
        
        self.view.addSubview(scrollView)

        
        notExaminedTableView = UITableView(frame: CGRect(x: 0, y: self.view.safeAreaInsets.top, width: width, height: height))
        notExaminedTableView.translatesAutoresizingMaskIntoConstraints = false
        notExaminedTableView.delegate = self
        notExaminedTableView.dataSource = self
        notExaminedTableView.register(ExamineListCell.self, forCellReuseIdentifier: ExamineListCell.description())
        notExaminedTableView.separatorStyle = .none
        notExaminedTableView.rowHeight = 150
        scrollView.addSubview(notExaminedTableView)
        
//        NSLayoutConstraint.activate([
//            notExaminedTableView.topAnchor.constraint(equalTo: view.topAnchor, constant:150),
////            notExaminedTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
////            notExaminedTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
//            notExaminedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
//        ])
        
        examinedTableView = UITableView(frame: CGRect(x: width, y: 0, width: width, height: height))
        examinedTableView.translatesAutoresizingMaskIntoConstraints = false
        examinedTableView.delegate = self
        examinedTableView.dataSource = self
        examinedTableView.register(ExamineListCell.self, forCellReuseIdentifier: ExamineListCell.description())
        examinedTableView.separatorStyle = .none
        examinedTableView.rowHeight = 150
        scrollView.addSubview(examinedTableView)
        
//        NSLayoutConstraint.activate([
//            examinedTableView.topAnchor.constraint(equalTo: view.topAnchor, constant:150),
////            examinedTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
////            examinedTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
//            examinedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
//        ])
        
        

        // Do any additional setup after loading the view.
    }
    @objc func segmentDidChanged(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            scrollView.contentOffset.x = 0
        }else if sender.selectedSegmentIndex == 1{
            scrollView.contentOffset.x = width
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x >= width && scrollView.contentOffset.x <= width * 2{
            segmentControl.selectedSegmentIndex = 1
        }else{
            segmentControl.selectedSegmentIndex = 0
        }
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
extension ExamineVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == notExaminedTableView{
            return 10
        }else{
            return 5
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExamineListCell.description(), for: indexPath) as! ExamineListCell
//        cell.setCover(products[indexPath.row].cover!)
//        cell.setName(products[indexPath.row].name!)
//        cell.setPrice(products[indexPath.row].price!)
//        cell.setCollect(true)
//        cell.setRating(products[indexPath.row].rating!)
//        cell.setTradeName(products[indexPath.row].tradeName!)
        cell.setName("the name")
        cell.setCover("")
        cell.setPrice(20)
        cell.setTradeName("the trade name")
        return cell
    }
}

extension ExamineVC:UITableViewDelegate{
    
}

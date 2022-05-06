//
//  ConductVC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/11.
//

import UIKit

class ConductVC: UIViewController {
    private var tableView:UITableView!
    private var optionBarItem:UIBarButtonItem!
    private var changeBarItem:UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 250
        tableView.separatorStyle = .none
        tableView.register(ConductCell.self, forCellReuseIdentifier: ConductCell.description())
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.allowsMultipleSelectionDuringEditing = .BooleanLiteralType
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        navigationItem.prompt = NSLocalizedString("Navigation prompts appear at the top.", comment: "")
        
        
        let barButtonMenu = UIMenu(title: "", children: [
            UIAction(title:"Copy", image: UIImage(systemName: "doc.on.doc"),handler: menuHandler),
            UIAction(title: "Move", image: UIImage(systemName: "folder"), handler: menuHandler)
        ])
        
        
        optionBarItem = UIBarButtonItem(systemItem: .edit)
        optionBarItem.menu = barButtonMenu
        self.navigationItem.rightBarButtonItem = optionBarItem
        
        changeBarItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(change))
        changeBarItem.menu = barButtonMenu
        self.navigationItem.leftBarButtonItem = changeBarItem
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemRed
        appearance.titleTextAttributes = [.foregroundColor:UIColor.lightText]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        let doneButtonAppearance = UIBarButtonItemAppearance()
        doneButtonAppearance.normal.titleTextAttributes = [.foregroundColor:UIColor.systemYellow]
        navigationItem.standardAppearance?.doneButtonAppearance = doneButtonAppearance
        navigationItem.compactAppearance?.doneButtonAppearance = doneButtonAppearance
        
        

        // Do any additional setup after loading the view.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    
    func menuHandler(action:UIAction){
        Swift.debugPrint("Menu handler:\(action.title)")
    }
    
    @objc func change(){
        let title = NSLocalizedString("Choose a UIBarStyle", comment: "")
        let cancelButtonTitle = NSLocalizedString("Cancel", comment: "")
        let defaultButtonTitle = NSLocalizedString("Default", comment: "")
        let blackOpaqueTitle = NSLocalizedString("Black Opaque", comment: "")
        
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: NSLocalizedString(cancelButtonTitle, comment: ""), style: .default, handler: { _ in
        }))
        alertController.addAction(UIAlertAction(title: NSLocalizedString(defaultButtonTitle, comment: ""), style: .default, handler: { _ in
            self.navigationController!.navigationBar.barStyle = .default
            self.navigationController!.navigationBar.isTranslucent = true
            self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.black]
            self.navigationController!.navigationBar.tintColor = nil
        }))
        alertController.addAction(UIAlertAction(title: NSLocalizedString(blackOpaqueTitle, comment: ""),
                                                style: .default) { _ in
            self.navigationController!.navigationBar.barStyle = .black
            self.navigationController!.navigationBar.isTranslucent = false
            self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        })
        self.navigationController?.present(alertController, animated: true)
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
extension ConductVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConductCell.description(), for: indexPath) as! ConductCell
        cell.setCount(count: 1)
        cell.setTradeName(trade: "the name of the trade")
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        .delete
//    }
}

extension ConductVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

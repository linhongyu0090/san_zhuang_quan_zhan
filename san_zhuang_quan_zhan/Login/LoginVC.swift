
//  LoginVC.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/8.


import UIKit
import SnapKit

class LoginVC: UIViewController {
    var phoneTextField:UITextField!
    var passwordTextField:UITextField!
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        super.viewDidLoad()
//        self.view.backgroundColor = .white
        self.view.backgroundColor = .systemBlue
        self.view.layer.opacity = 0.96
        
//        let logoView = UIImageView(image: UIImage(systemName: "star"))
        let logoView = UIImageView(image: UIImage(named: "fzu"))
        view.addSubview(logoView)
        logoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
        let phoneIconView = UIImageView(image: UIImage(systemName: "star.fill"))
        phoneTextField = UITextField()
        phoneTextField.leftView = phoneIconView
        phoneTextField.leftViewMode = .always
        phoneTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.textColor = UIColor.hexColor(0x333333)
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.clearButtonMode = .always
        phoneTextField.layer.masksToBounds = true
        phoneTextField.layer.shadowOffset = CGSize(width: 10, height: 10)
        phoneTextField.layer.shadowColor = UIColor.black.cgColor
        phoneTextField.placeholder = "请输入手机号"
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(logoView.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        
        let passwordIconView = UIImageView(image: UIImage(systemName: "star"))
        passwordTextField = UITextField()
        passwordTextField.leftView = passwordIconView
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.textColor = UIColor.hexColor(0x333333)
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        passwordTextField.clearButtonMode = .always
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "请输入密码"
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
//            make.top.equalTo(phoneTextField.snp.bottom).offset(80)
            make.top.equalTo(logoView.snp.bottom).offset(80)
            make.height.equalTo(50)
        }

        let loginButton = UIButton(type: .custom)
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        loginButton.backgroundColor = UIColor.hexColor(0xf8892e)
//        loginButton.backgroundColor = UIColor.hexColor(0x008B8B)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
//            make.top.equalTo(passwordTextField).offset(20)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
                        make.height.equalTo(50)
        }
        loginButton.addTarget(self, action: #selector(clickLoginButton), for: .touchUpInside)
        
        let registerLabel = UILabel()
        registerLabel.text = "没有账号?"
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        registerLabel.textColor = .black
//        registerLabel.backgroundColor = .white
        registerLabel.textAlignment = .left
        view.addSubview(registerLabel)
        registerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(100)
            make.top.equalTo(loginButton.snp.bottom).offset(10)
        }
        
        let registerButton = UIButton()
//        registerButton.backgroundColor = .white
        registerButton.setTitle("现在注册", for: .normal)
        registerButton.setTitleColor(.systemOrange, for: .normal)
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(100)
            make.top.equalTo(loginButton.snp.bottom).offset(10)
        }
        registerButton.addTarget(self, action: #selector(clickRegisterButton), for: .touchUpInside)
        
        
    }
    @objc func clickLoginButton(){
//        VerifyView.show(SuperView: self.view){ isSuccessful in
//            if (isSuccessful){
                let AdministratorTBC = AdministratorTBC()
                AdministratorTBC.modalPresentationStyle = .fullScreen
                let UserTBC = UserTBC()
                UserTBC.modalPresentationStyle = .fullScreen
                self.present(AdministratorTBC, animated: true, completion: nil)
//            }
//        }
    }
    
    @objc func didClickButton() {

        
    }
    
    @objc func clickRegisterButton(){
        let registerVC = RegisterVC()
        self.present(registerVC, animated: true)
    }
    func showToast(){
        let alertVC = UIAlertController(title: "提示", message: "用户名或者密码错误", preferredStyle: .alert)
        present(alertVC, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            alertVC.dismiss(animated: true, completion: nil)
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

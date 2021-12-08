//
//  LoginViewController.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/07.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    //MARK: - Properties
    private let backgroundImage = UIImageView().then{
        $0.image = UIImage(named: "Tita-LoginVCBack")
    }
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "Tita-Logo")
    }
    private let helloLabel = UILabel().then {
        $0.text = "어서오세요,\nTimeTable입니다!"
        $0.dynamicFont(fontSize: 27, currentFontName: "NotoSans-Bold")
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    private let idInputView = LoginInputView().then {
        $0.dataSetting(placeholderText: "아이디", forgotButtonTitle: "아이디를 잊으셨나요?")
    }
    private lazy var pwInputView = LoginInputView().then {
        $0.dataSetting(placeholderText: "비밀번호", forgotButtonTitle: "비밀번호를 잊으셨나요?")
        $0.loginTextField.loginTextField.isSecureTextEntry = true
    }
    private let loginButton = LoginButton().then {
        $0.dataSetting(buttonText: "입장하기")
    }
    private let signUpButton = UIButton().then {
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("혹시 아직 회원이 아니신가요?", for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "NotoSans")
        $0.setUnderline()
        $0.backgroundColor = .white
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [backgroundImage, logoImage, helloLabel, idInputView, pwInputView, loginButton, signUpButton].forEach { view.addSubview($0) }
    }
    
    // MARK: - Location
    private func location(){
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        logoImage.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(4.31)
            make.height.equalToSuperview().dividedBy(10.15)
            make.top.equalToSuperview().offset(self.view.frame.height/6.71)
            make.left.equalToSuperview().offset(self.view.frame.width/5.86)
        }
        helloLabel.snp.makeConstraints { make in
            make.left.equalTo(logoImage)
            make.top.equalTo(logoImage.snp.bottom).offset(self.view.frame.height/32.48)
        }
        idInputView.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(self.view.frame.height/15.92)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.42)
            make.height.equalToSuperview().dividedBy(11.77)
        }
        pwInputView.snp.makeConstraints { make in
            make.top.equalTo(idInputView.snp.bottom).offset(self.view.frame.height/20.3)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.42)
            make.height.equalToSuperview().dividedBy(11.77)
        }
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pwInputView.snp.bottom).offset(self.view.frame.height/11.77)
            make.width.equalToSuperview().dividedBy(3.18)
            make.height.equalToSuperview().dividedBy(20.3)
        }
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(self.view.frame.height/31.23)
            make.width.equalToSuperview().dividedBy(2.53)
            make.height.equalToSuperview().dividedBy(50.75)
        }
    }
}

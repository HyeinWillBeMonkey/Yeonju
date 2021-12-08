//
//  LoginInputView.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/07.
//

import UIKit

class LoginInputView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let loginTextField = LoginTextFieldView().then {
        $0.dataSetting(placeholderText: "아이디")
    }
    
    private let forgotButton = UIButton().then {
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.dynamicFont(fontSize: 12, currentFontName: "NotoSans")
        $0.setUnderline()
        $0.contentHorizontalAlignment = .left
    }
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI(){
        addView()
        location()
        
        self.loginTextField.layer.cornerRadius = 10
        self.loginTextField.layer.shadowColor = UIColor.rgba(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.loginTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.loginTextField.layer.shadowRadius = 10
        self.loginTextField.layer.shadowOpacity = 0.3
    }
    // MARK: - addView
    private func addView(){
        [loginTextField, forgotButton].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        loginTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(viewBounds.width/1.42)
            make.height.equalTo(viewBounds.height/19.33)
        }
        
        forgotButton.snp.makeConstraints { make in
            make.left.equalTo(loginTextField)
            make.top.equalTo(loginTextField.snp.bottom).offset(viewBounds.height/73.82)
            make.width.equalTo(viewBounds.width/2.62)
            make.height.equalTo(viewBounds.height/50.75)
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(placeholderText:String, forgotButtonTitle:String){
        loginTextField.dataSetting(placeholderText: placeholderText)
        forgotButton.setTitle(forgotButtonTitle, for: .normal)
    }
}

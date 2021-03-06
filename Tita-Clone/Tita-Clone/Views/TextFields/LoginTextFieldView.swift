//
//  LoginTextFieldView.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/07.
//

import UIKit

class LoginTextFieldView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    lazy var loginTextField = UITextField().then{
        $0.placeholder = "아이디"
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.setLeftPaddingPoints(viewBounds.width/18.75)
        $0.setPlaceholderColor(.rgb(red: 175, green: 175, blue: 175))
        $0.dynamicFont(fontSize: 12, currentFontName: "NotoSans")
    }
    
    private let forgotButton = UIButton().then {
        $0.setTitle("아이디를 잊으셨나요?", for: .normal)
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
        
        self.loginTextField.layer.cornerRadius = viewBounds.width/37.5
        self.layer.applySketchShadow(color: .black, alpha: 0.25, x: 2, y: 2, blur: 10, spread: 0)
    }
    // MARK: - addView
    private func addView(){
        self.addSubview(loginTextField)
    }
    
    // MARK: - location
    private func location(){
        loginTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(placeholderText:String){
        loginTextField.placeholder = placeholderText
    }
}

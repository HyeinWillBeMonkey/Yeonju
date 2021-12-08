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
    
    private let pwInputView = LoginInputView().then {
        $0.dataSetting(placeholderText: "비밀번호", forgotButtonTitle: "비밀번호를 잊으셨나요?")
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
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [backgroundImage, logoImage, helloLabel, idInputView, pwInputView].forEach { view.addSubview($0) }
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
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
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct LoginViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        LoginViewController()
    }
}
@available(iOS 13.0, *)
struct LoginViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            LoginViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

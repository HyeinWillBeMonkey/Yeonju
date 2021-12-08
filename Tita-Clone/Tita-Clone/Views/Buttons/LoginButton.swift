//
//  LoginButton.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/08.
//

import UIKit

class LoginButton: UIButton {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
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
        self.dynamicFont(fontSize: 18, currentFontName: "NotoSans-Bold")
        self.setTitleColor(.black, for: .normal)
        self.layer.cornerRadius = viewBounds.width/37.5
        self.backgroundColor = .rgb(red: 255, green: 251, blue: 235)
        
        self.layer.shadowColor = UIColor.rgba(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = viewBounds.width/37.5
        self.layer.shadowOpacity = 0.3
    }
    
    // MARK: - dataSetting
    func dataSetting(buttonText: String){
        self.setTitle(buttonText, for: .normal)
    }
}

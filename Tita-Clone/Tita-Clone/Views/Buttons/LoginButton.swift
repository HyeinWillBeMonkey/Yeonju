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
        self.layer.applySketchShadow(color: .black, alpha: 0.25, x: 2, y: 2, blur: 10, spread: 0)
    }
    
    // MARK: - dataSetting
    func dataSetting(buttonText: String){
        self.setTitle(buttonText, for: .normal)
    }
}

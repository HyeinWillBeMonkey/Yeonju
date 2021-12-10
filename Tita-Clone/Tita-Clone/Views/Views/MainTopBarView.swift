//
//  MainTopBarView.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/10.
//

import UIKit

class MainTopBarView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let schoolLabel = UILabel().then {
        $0.dynamicFont(fontSize: 22, currentFontName: "NotoSans-Bold")
        $0.textColor = .black
    }
    
    private let searchButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-SearchButton"), for: .normal)
    }
    
    private let myPageButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-MyPageButton"), for: .normal)
    }
    
    private let underLine = UIView().then {
        $0.backgroundColor = .rgb(red: 167, green: 203, blue: 234)
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
    }
    
    // MARK: - addView
    private func addView(){
        [schoolLabel, searchButton, myPageButton, underLine].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        schoolLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(viewBounds.height/14.25)
            make.left.equalToSuperview().offset(viewBounds.width/13.89)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(schoolLabel)
            make.left.equalTo(schoolLabel.snp.right).offset(viewBounds.width/23.44)
            make.width.equalTo(viewBounds.width/11.36)
            make.height.equalTo(viewBounds.height/21.71)
        }
        
        myPageButton.snp.makeConstraints { make in
            make.centerY.equalTo(schoolLabel)
            make.left.equalTo(searchButton.snp.right).offset(viewBounds.width/26.79)
            make.width.equalTo(viewBounds.width/25)
            make.height.equalTo(viewBounds.height/17.86)
        }
        
        underLine.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(viewBounds.height/203)
        }
    }
        
    // MARK: - dataSetting
    func dataSetting(schoolName: String){
        schoolLabel.text = schoolName
    }
}

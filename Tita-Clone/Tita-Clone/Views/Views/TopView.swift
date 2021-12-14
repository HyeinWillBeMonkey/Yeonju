//
//  TopView.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/14.
//

import UIKit

class TopView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let backButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-BackButton"), for: .normal)
    }
    
    private let noticeName = UILabel().then {
        $0.dynamicFont(fontSize: 22, currentFontName: "NotoSans-Bold")
        $0.textColor = .black
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
        [backButton, noticeName, underLine].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        backButton.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/53.57)
            make.height.equalTo(viewBounds.height/47.76)
            make.left.equalToSuperview().offset(viewBounds.width/13.89)
            make.top.equalToSuperview().offset(viewBounds.height/13.04)
        }
        
        noticeName.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.left.equalTo(backButton.snp.right).offset(viewBounds.width/24.85)
        }
        
        underLine.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(viewBounds.height/203)
        }
    }
        
    // MARK: - dataSetting
    func dataSetting(noticeNameString: String){
        noticeName.text = noticeNameString
    }
}

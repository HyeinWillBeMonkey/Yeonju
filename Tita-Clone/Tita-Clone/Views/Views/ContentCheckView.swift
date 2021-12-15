//
//  ContentCheckView.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/15.
//

import UIKit

class ContentCheckView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let heartButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-HeartButton"), for: .normal)
    }
    
    private let heartLabel = UILabel().then {
        $0.text = "0"
        $0.textColor = .rgb(red: 255, green: 123, blue: 123)
        $0.dynamicFont(fontSize: 11, currentFontName: "NotoSans")
    }
    
    private let momentButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-MomentButton"), for: .normal)
    }
    
    private let momentLabel = UILabel().then {
        $0.text = "8"
        $0.textColor = .rgb(red: 112, green: 135, blue: 255)
        $0.dynamicFont(fontSize: 11, currentFontName: "NotoSans")
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
        [heartButton, heartLabel, momentButton, momentLabel].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        heartButton.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(viewBounds.width/28.58)
            make.height.equalTo(viewBounds.height/76.10)
        }
        
        heartLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(heartButton.snp.right).offset(viewBounds.width/73.24)
        }
        
        momentButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(heartLabel.snp.right).offset(viewBounds.width/21.08)
            make.width.equalTo(viewBounds.width/28.85)
            make.height.equalTo(viewBounds.height/67.67)
        }
        
        momentLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(momentButton.snp.right).offset(viewBounds.width/73.24)
        }
    }
}

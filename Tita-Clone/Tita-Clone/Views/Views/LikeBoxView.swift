//
//  LikeBoxView.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/15.
//

import UIKit

class LikeBoxView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let likeButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-NoticeLike"), for: .normal)
    }
    
    private let centerLine = UIView().then {
        $0.backgroundColor = .rgb(red: 125, green: 125, blue: 125)
    }
    
    private let setButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-NoticeSet"), for: .normal)
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
        [likeButton, centerLine, setButton].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        self.layer.borderWidth = viewBounds.width/694.44
        self.layer.borderColor = UIColor.rgb(red: 125, green: 125, blue: 125).cgColor
        self.layer.cornerRadius = viewBounds.width/116.82
        
        centerLine.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(viewBounds.width/1388.89)
            make.height.equalTo(viewBounds.height/81.2)
        }
        
        likeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(viewBounds.width/35.38)
            make.height.equalTo(viewBounds.height/106.28)
            make.right.equalTo(centerLine.snp.left).inset(viewBounds.width/52.97)
        }
        
        setButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(viewBounds.width/141.51)
            make.height.equalTo(viewBounds.height/89.43)
            make.left.equalTo(centerLine.snp.right).offset(viewBounds.width/43.76)
        }
    }
}

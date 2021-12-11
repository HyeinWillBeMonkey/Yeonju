//
//  NoticeView.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/12.
//

import UIKit

class NoticeView: UIView {
    // MARK: - Properties
    private let viewBounds = UIScreen.main.bounds
    
    private let underLine = UIView().then {
        $0.backgroundColor = .rgba(red: 255, green: 196, blue: 196, alpha: 0.75)
    }
    
    private let mainLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "주요 공지글"
        $0.dynamicFont(fontSize: 18, currentFontName: "NotoSans-Bold")
    }
    
    private let authorLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "학생회"
        $0.dynamicFont(fontSize: 14, currentFontName: "NotoSans-Bold")
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "체육대회 공지사항"
        $0.dynamicFont(fontSize: 14, currentFontName: "NotoSans")
    }
    
    private let contentLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "체육대회 당일 오후 우천으로 인한 일정 변동이 있습니다. 모든 학생들은\n확인해주시기 바랍니다. 또한, 첨부한 사진에 오타가 있습니다. 농구\n경기의 경우 60분이니 확인 부탁드립니다."
        $0.dynamicFont(fontSize: 10, currentFontName: "NotoSans")
        $0.numberOfLines = 0
    }
    
    private let moreButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(UIColor.rgb(red: 152, green: 152, blue: 152), for: .normal)
        $0.backgroundColor = .white
        $0.dynamicFont(fontSize: 8, currentFontName: "NotoSans")
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
        [underLine, mainLabel, authorLabel, titleLabel, contentLabel, moreButton].forEach { addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        self.backgroundColor = .white
        self.layer.cornerRadius = viewBounds.width/18.75
        self.layer.borderColor = UIColor.rgb(red: 175, green: 175, blue: 175).cgColor
        self.layer.borderWidth = viewBounds.width/375
        self.clipsToBounds = false
        self.layer.applySketchShadow(x: 4, y: 4, blur: 4)
        
        underLine.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(viewBounds.width/20.83)
            make.top.equalToSuperview().offset(viewBounds.height/24.61)
            make.width.equalTo(mainLabel.snp.width)
            make.height.equalTo(viewBounds.height/86.11)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(viewBounds.height/54.13)
            make.left.equalTo(underLine)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(underLine.snp.bottom).offset(viewBounds.height/406)
            make.left.equalTo(underLine)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(underLine)
            make.top.equalTo(authorLabel.snp.bottom).offset(viewBounds.height/67.67)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(viewBounds.height/95.08)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom)
            make.left.equalToSuperview().offset(viewBounds.width/1.95)
            make.width.equalTo(viewBounds.width/16.30)
            make.height.equalTo(viewBounds.height/86.11)
        }
    }
        
    // MARK: - dataSetting
    func dataSetting(underLineColor: UIColor, maintext: String){
        underLine.backgroundColor = underLineColor
        mainLabel.text = maintext
    }
}

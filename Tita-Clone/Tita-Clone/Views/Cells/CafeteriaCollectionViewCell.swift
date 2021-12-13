//
//  CafeteriaCollectionViewCell.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/12.
//

import UIKit

class CafeteriaCollectionViewCell: UICollectionViewCell {
    private let viewBounds = UIScreen.main.bounds
    
    static let identifier = "\(CafeteriaCollectionViewCell.self)"
    
    let image = UIImageView().then {
        $0.image = UIImage(named: "Tita-Breakfast")
        $0.contentMode = .scaleAspectFit
    }
    
    let title = UILabel().then {
        $0.text = "오늘의 아침"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 18, currentFontName: "NotoSans-Bold")
    }
    
    let menu = UILabel().then {
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.dynamicFont(fontSize: 14, currentFontName: "NotoSans")
        $0.text = "백미밥\n시레기된장국\n감자채어묵볶음\n치즈계란말이\n깍두기\n시리얼/우유"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI(){
        self.backgroundColor = .white
        self.layer.cornerRadius = viewBounds.width/18.75
        self.layer.borderColor = UIColor.rgb(red: 202, green: 202, blue: 202).cgColor
        self.layer.borderWidth = viewBounds.width/375
        self.layer.applySketchShadow(x: 2, y: 2, blur: 4)
        
        [image, title, menu].forEach { contentView.addSubview($0) }
        
        image.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/10.14)
            make.height.equalTo(image.snp.width)
            make.left.equalToSuperview().offset(viewBounds.width/7.21)
            make.top.equalToSuperview().offset(viewBounds.height/40.6)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(viewBounds.height/62.46)
            make.left.equalTo(image.snp.right).offset(viewBounds.width/62.5)
        }
        
        menu.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(title.snp.bottom).offset(viewBounds.height/116)
        }
    }
}

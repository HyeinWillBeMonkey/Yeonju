//
//  FreeNoticeTableViewCell.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/15.
//

import UIKit

class FreeNoticeTableViewCell: UITableViewCell {
    private let viewBounds = UIScreen.main.bounds
    
    static let FreeNoticeTableViewCellIdentifier = "\(FreeNoticeTableViewCell.self)"
    
    private let anonymousLabel = UILabel().then {
        $0.dynamicFont(fontSize: 17, currentFontName: "NotoSans-Bold")
        $0.textColor = .black
        $0.text = "익명"
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "05/24 14:20"
        $0.textColor = .rgb(red: 185, green: 185, blue: 185)
        $0.dynamicFont(fontSize: 13, currentFontName: "12")
    }
    
    private let likeBox = LikeBoxView()
    
    private let titleLabel = UILabel().then {
        $0.dynamicFont(fontSize: 16, currentFontName: "NotoSans")
        $0.text = "이번 한국사 시험 범위 아는 사람!"
        $0.textColor = .black
    }
    
    private let contentLabel = UILabel().then {
        $0.text = "급하니까 제대로 아는사람 빨리 알려줘ㅜㅜ"
        $0.dynamicFont(fontSize: 12, currentFontName: "NotoSans")
        $0.textColor = .black
    }
    
    private let contentCheck = ContentCheckView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        location()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func addView(){
        [anonymousLabel, dateLabel, likeBox, titleLabel, contentLabel, contentCheck].forEach{ contentView.addSubview($0) }
    }
    
    private func location(){
        anonymousLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(anonymousLabel)
            make.left.equalTo(anonymousLabel.snp.right).offset(viewBounds.width/96.40)
        }
        
        likeBox.snp.makeConstraints { make in
            make.right.top.equalToSuperview()
            make.width.equalTo(viewBounds.width/8.3)
            make.height.equalTo(viewBounds.height/50.75)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(anonymousLabel)
            make.top.equalTo(anonymousLabel.snp.bottom).offset(viewBounds.height/353.04)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.left.equalTo(anonymousLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(viewBounds.height/270.67)
        }
        
        contentCheck.snp.makeConstraints { make in
            make.left.equalTo(anonymousLabel)
            make.top.equalTo(contentLabel.snp.bottom).offset(viewBounds.height/93.75)
            make.width.equalTo(viewBounds.width/5.59)
            make.height.equalTo(viewBounds.height/54.13)
        }
    }

}

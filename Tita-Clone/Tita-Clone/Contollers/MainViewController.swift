//
//  MainViewController.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/10.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Properties
    
    private let cefeteriaImage: [String] = ["Tita-Breakfast", "Tita-Lunch", "Tita-Dinner"]
    private let titleLabel: [String] = ["오늘의 아침", "오늘의 점심", "오늘의 저녁"]
    private let menuLabel: [String] = ["백미밥\n시레기된장국\n감자채어묵볶음\n치즈계란말이\n깍두기\n시리얼/우유", "순두부찌개\n마른새우조림\n느타리버섯호박볶음\n찜닭덮밥\n깍두기\n아이스크림", "백미밥\n바지락살미역국\n영양갈비찜\n깻잎순나물\n두부쑥갓구이/양념장\n깍두기"]
    
    private let mainTopView = MainTopBarView().then {
        $0.dataSetting(schoolName: "광주소프트웨어마이스터고")
    }
    
    private let cafeteriaCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        $0.register(CafeteriaCollectionViewCell.self, forCellWithReuseIdentifier: CafeteriaCollectionViewCell.identifier)
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
        $0.collectionViewLayout = layout
    }
    
    private let noticeView = NoticeView().then {
        $0.dataSetting(underLineColor: .rgba(red: 255, green: 196, blue: 196, alpha: 0.75), maintext: "주요 공지글")
    }
    
    private let bestView = NoticeView().then {
        $0.dataSetting(underLineColor: .rgba(red: 255, green: 253, blue: 196, alpha: 0.75), maintext: "BEST 게시글")
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
        collectionViewSetting()
        addView()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [mainTopView, cafeteriaCollectionView, noticeView, bestView].forEach { view.addSubview($0) }
    }
    
    // MARK: - Location
    private func location(){
        mainTopView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(7.59)
        }
        
        cafeteriaCollectionView.snp.makeConstraints { make in
            make.height.equalTo(self.view.frame.height/4.34)
            make.width.equalToSuperview().dividedBy(1.08)
            make.top.equalTo(mainTopView.snp.bottom).offset(self.view.frame.height/20.82)
            make.left.equalToSuperview().offset(self.view.frame.width/12.93)
        }
        
        noticeView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.17)
            make.height.equalToSuperview().dividedBy(4.6)
            make.centerX.equalToSuperview()
            make.top.equalTo(mainTopView.snp.bottom).offset(self.view.frame.height/3.14)
        }
        
        bestView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.17)
            make.height.equalToSuperview().dividedBy(4.6)
            make.centerX.equalToSuperview()
            make.top.equalTo(noticeView.snp.bottom).offset(self.view.frame.height/24.61)
        }
    }
    
    //MARK: - collectionViewSetting
    private func collectionViewSetting() {
        cafeteriaCollectionView.dataSource = self
        cafeteriaCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cafeteriaCollectionView.dequeueReusableCell(withReuseIdentifier: "CafeteriaCollectionViewCell", for: indexPath) as! CafeteriaCollectionViewCell
        cell.dataSetting(imageName: cefeteriaImage[indexPath.row], titleLabel: titleLabel[indexPath.row], menuLabel: menuLabel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.width/1.19, height: self.view.frame.height/4.34)
    }
}

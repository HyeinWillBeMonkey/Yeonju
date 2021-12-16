//
//  NoticeViewController.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/11.
//

import UIKit
import SnapKit
import Then

class NoticeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    private let topView = TopView().then {
        $0.dataSetting(noticeNameString: "자유게시판")
    }
    
    private let noticeTableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .singleLine
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
        addView()
        cornerRadius()
        location()
        tableViewSetting()
    }
    
    // MARK: - Add View
    private func addView(){
        [topView, noticeTableView].forEach{ view.addSubview($0) }
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(7.59)
        }
        
        noticeTableView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/38.10)
            make.width.equalToSuperview().dividedBy(1.32)
            make.height.equalToSuperview()
        }
    }
    
    private func tableViewSetting(){
        noticeTableView.dataSource = self
        noticeTableView.delegate = self
        
        noticeTableView.register(FreeNoticeTableViewCell.self, forCellReuseIdentifier: FreeNoticeTableViewCell.FreeNoticeTableViewCellIdentifier)
        
        noticeTableView.separatorInset.left = 0
        noticeTableView.separatorInset.right = 0

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = noticeTableView.dequeueReusableCell(withIdentifier: "FreeNoticeTableViewCell") as! FreeNoticeTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/7.09
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct NoticeViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        NoticeViewController()
    }
}
@available(iOS 13.0, *)
struct NoticeViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            NoticeViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif


//
//  TabBarViewController.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/11.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    private func configureUI(){
        self.tabBar.tintColor = .black
        
        let mainVC = UINavigationController(rootViewController: MainViewController())
        mainVC.tabBarItem.selectedImage = UIImage(named: "Tita-SMain")
        mainVC.tabBarItem.image = UIImage(named: "Tita-Main")
        
        let noticeVC = UINavigationController(rootViewController: NoticeViewController())
        noticeVC.tabBarItem.selectedImage = UIImage(named: "Tita-SNotice")
        noticeVC.tabBarItem.image = UIImage(named: "Tita-Notice")
        
        let alarmVC = UINavigationController(rootViewController: AlarmViewController())
        alarmVC.tabBarItem.selectedImage = UIImage(named: "Tita-SAlarm")
        alarmVC.tabBarItem.image = UIImage(named: "Tita-Alarm")
        
        let myPageVC = UINavigationController(rootViewController: MyPageViewController())
        myPageVC.tabBarItem.selectedImage = UIImage(named: "Tita-SMyPage")
        myPageVC.tabBarItem.image = UIImage(named: "Tita-MyPage")
        
        viewControllers = [mainVC, noticeVC, alarmVC, myPageVC]
        
        mainVC.tabBarItem.imageInsets = .init(top: 0, left: 0, bottom: -30, right: 0)
        noticeVC.tabBarItem.imageInsets = .init(top: 0, left: 0, bottom: -30, right: 0)
        alarmVC.tabBarItem.imageInsets = .init(top: 0, left: 0, bottom: -30, right: 0)
        myPageVC.tabBarItem.imageInsets = .init(top: 0, left: 0, bottom: -30, right: 0)
        
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .white
        self.tabBar.frame.size.height = self.view.frame.height/13.53
    }

}

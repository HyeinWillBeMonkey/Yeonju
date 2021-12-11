//
//  MyPageViewController.swift
//  Tita-Clone
//
//  Created by 노연주 on 2021/12/12.
//

import UIKit
import SnapKit
import Then

class MyPageViewController: UIViewController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .orange
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct MyPageViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        MyPageViewController()
    }
}
@available(iOS 13.0, *)
struct MyPageViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            MyPageViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif


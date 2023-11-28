//
//  RootTabbarViewController.swift
//  DekD
//
//  Created by Chareef on 24/11/2566 BE.
//

import UIKit

class RootTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initTabbar()
    }
    
    private func initTabbar() {
        self.viewControllers?.removeAll()
        
        let novelListVC = NovelListRouter.newInstance()
        self.viewControllers?.append(novelListVC)
        self.selectedIndex = 0
    }

}

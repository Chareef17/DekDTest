//
//  NovelListViewController.swift
//  DekD
//
//  Created by Chareef on 23/11/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NovelListDisplayLogic: class {
    
}

class NovelListViewController: UIViewController {
    
    // MARK: - Static Properties
    
    // MARK: - IBOutlet Properties
    
    // MARK: - Properties
    var interactor: NovelListBusinessLogic?
    var router: (NSObjectProtocol & NovelListRoutingLogic & NovelListDataPassing)?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        self.interactor?.getNovelList()
    }
    
    // MARK: - Functions
    func setupView() {
      
    }
    
    // MARK: - Actions
    
}

// MARK: - Display Logic
extension NovelListViewController: NovelListDisplayLogic {
    
}

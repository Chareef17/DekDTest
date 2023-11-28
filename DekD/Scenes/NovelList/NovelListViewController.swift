//
//  NovelListViewController.swift
//  DekD
//
//  Created by Chareef on 23/11/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NovelListDisplayLogic: class {
    func displayNovelList(viewModel: NovelList.GetNovel.ViewModel)
}

class NovelListViewController: UIViewController {
    
    // MARK: - Static Properties
    
    // MARK: - IBOutlet Properties
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var novels: NovelListModel?
    var interactor: NovelListBusinessLogic?
    var router: (NSObjectProtocol & NovelListRoutingLogic & NovelListDataPassing)?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        self.interactor?.getNovelList(request: .init(pageIndex: 1))
    }
    
    // MARK: - Functions
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register your custom cell if you have one
        tableView.register(NovelTableViewCell.self, forCellReuseIdentifier: String(describing: NovelTableViewCell.self))
    }
    
    // MARK: - Actions
    
}

// MARK: - Display Logic
extension NovelListViewController: NovelListDisplayLogic {
    func displayNovelList(viewModel: NovelList.GetNovel.ViewModel) {
        self.novels = viewModel.novels
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension NovelListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.novels?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = self.novels?.list?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NovelTableViewCell.self), for: indexPath) as! NovelTableViewCell
        cell.backgroundColor = UIColor.systemBlue
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle cell selection
    }
    
}

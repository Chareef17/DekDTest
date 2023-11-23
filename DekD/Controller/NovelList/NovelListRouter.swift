//
//  NovelListRouter.swift
//  DekD
//
//  Created by Chareef on 23/11/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NovelListRoutingLogic {
    
}

protocol NovelListDataPassing {
    var dataStore: NovelListDataStore? { get }
}

class NovelListRouter: NSObject, NovelListDataPassing {
    
    class func newInstance() -> NovelListViewController {
        let viewController = NovelListViewController(nibName: String(describing: NovelListViewController.self), bundle: nil)
        let interactor = NovelListInteractor()
        let presenter = NovelListPresenter()
        let router = NovelListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
        
        // router.dataStore?.something = something
        
        return viewController
    }
    
    // MARK: - Properties
    private weak var viewController: NovelListViewController?
    
    var dataStore: NovelListDataStore?
    
}

extension NovelListRouter: NovelListRoutingLogic {
    
}

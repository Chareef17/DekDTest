//
//  NovelListInteractor.swift
//  DekD
//
//  Created by Chareef on 23/11/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NovelListBusinessLogic {
    func getNovelList()
}

protocol NovelListDataStore {
    
}

class NovelListInteractor: NovelListDataStore {
    
    // MARK: - Properties
    var presenter: NovelListPresentationLogic?
    
}

extension NovelListInteractor: NovelListBusinessLogic {
    func getNovelList() {
        NovelListService.shared.requestNovelList(page: 1)
    }
}

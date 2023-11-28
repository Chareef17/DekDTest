//
//  NovelListInteractor.swift
//  DekD
//
//  Created by Chareef on 23/11/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NovelListBusinessLogic {
    func getNovelList(request: NovelList.GetNovel.Request)
}

protocol NovelListDataStore {
    
}

class NovelListInteractor: NovelListDataStore {
    
    // MARK: - Properties
    var presenter: NovelListPresentationLogic?
    
}

extension NovelListInteractor: NovelListBusinessLogic {
    func getNovelList(request: NovelList.GetNovel.Request) {
        NovelListService.shared.requestNovels(page: request.pageIndex) { [weak self] novelList in
            self?.presenter?.presentNovelList(response: .init(novels: novelList))
        } completionError: { error in
            
        }

    }
}

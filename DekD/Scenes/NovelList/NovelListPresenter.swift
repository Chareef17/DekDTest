//
//  NovelListPresenter.swift
//  DekD
//
//  Created by Chareef on 23/11/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

protocol NovelListPresentationLogic {
    func presentNovelList(response: NovelList.GetNovel.Response)

}

class NovelListPresenter {

    // MARK: - Properties
    weak var viewController: NovelListDisplayLogic?
    
}

extension NovelListPresenter: NovelListPresentationLogic {
    func presentNovelList(response: NovelList.GetNovel.Response) {
        self.viewController?.displayNovelList(viewModel: .init(novels: response.novels))
    }
    
    
}

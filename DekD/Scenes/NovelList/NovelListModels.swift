//
//  NovelListModels.swift
//  DekD
//
//  Created by Chareef on 23/11/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

enum NovelList {
  
    enum GetNovel {
        
        struct Request {
            let pageIndex: Int
        }
        
        struct Response {
            let novels: NovelListModel
        }
        
        struct ViewModel {
            let novels: NovelListModel
        }
        
    }
    
}

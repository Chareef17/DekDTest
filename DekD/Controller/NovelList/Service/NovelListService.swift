//
//  NovelListService.swift
//  DekD
//
//  Created by Chareef on 23/11/2566 BE.
//

import UIKit

class NovelListService {
    // Create a static shared instance
    static let shared = NovelListService()
    
    // Private initializer to prevent creating instances outside the class
    private init() {
        // Initialization code (if needed)
    }
    
    // Your class functions and properties go here
    func requestNovelList(page: Int) {
        let service = BaseService()

        // Replace the URL, HTTP method, parameters, headers, and the expected data model type
        let apiUrl = URL(string: "http://www.dek-d.com/api/rest/open/quiz/novel/list")!
        let method = BaseService.HTTPMethod.get
        let parameters: [String: Any]? = ["page": page]
        let headers: [String: String]? = ["SECRET": "DrVDKp2ancYmyW2b3wRVU6yssBcjiyJ4"]
        service.request(url: apiUrl, method: method, parameters: parameters, headers: headers) { (result: Result<NovelListModel, Error>) in
            switch result {
            case .success(let data):
                // Handle successful API response
                print("API response data: \(data)")
            case .failure(let error):
                // Handle API request error
                print("API request error: \(error)")
            }
        }
    }
}

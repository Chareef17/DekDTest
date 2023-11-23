//
//  NovelModel.swift
//  DekD
//
//  Created by Chareef on 23/11/2566 BE.
//

import UIKit

struct NovelListModel: Codable {
    let pageInfo: PageInfo?
    let list: [Item]?
    
    enum CodingKeys: CodingKey {
        case pageInfo
        case list
    }
}

struct PageInfo: Codable {
    let currentPage: Int?
    let totalItems: Int?
    let itemsPerPage: Int?
    let hasPrevious: Bool?
    let hasNext: Bool?
}

struct Category: Codable {
    let main: Int?
    let sub: Int?
    let mainTitle: String?
    let subTitle: String?
}

struct Owner: Codable {
    let id: Int?
    let username: String?
    let alias: String?
    let role: String?
}

struct Thumbnail: Codable {
    let normal: String?
    let landscape: String?
}

struct Engagement: Codable {
    let view: View?
    let comment: Comment?
}

struct View: Codable {
    let month: Int?
    let overall: Int?
}

struct Comment: Codable {
    let primary: Int?
    let overall: Int?
}

struct Novel: Codable {
    let id: Int?
    let updatedAt: String?
    let title: String?
    let type: String?
    let description: String?
    let totalChapter: Int?
    let category: Category?
    let tags: [String]?
    let owners: [Owner]?
    let thumbnail: Thumbnail?
    let engagement: Engagement?
    let order: Int?
}

struct Section: Codable {
}

struct Item: Codable {
    let novel: Novel?
    let section: Section?
}

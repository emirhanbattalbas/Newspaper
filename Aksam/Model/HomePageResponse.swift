//
//  HomePageResponse.swift
//  Aksam
//
//  Created by emirhan battalbaş on 25.03.2020.
//  Copyright © 2020 emirhan battalbaş. All rights reserved.
//

import Foundation

// MARK: - HomePage
struct HomePage: Codable {
    let secitons: [Section]

    enum CodingKeys: String, CodingKey {
        case secitons = "Secitons"
    }
}

// MARK: - Seciton
struct Section: Codable {
    let sectionType, repeatType: String
    let itemCountInRow: Int
    let lazyLoadingEnabled, titleVisible: Bool
    let title, titleColor, imageURL, sectionBgColor: String
    let itemList: [ItemList]

    enum CodingKeys: String, CodingKey {
        case sectionType, repeatType, itemCountInRow, lazyLoadingEnabled, titleVisible, title, titleColor
        case imageURL = "imageUrl"
        case sectionBgColor, itemList
    }
}

// MARK: - ItemList
struct ItemList: Codable {
    let itemID: Int
    let imageURL: String
    let videoURL: String
    let date, title: String
    let itemListDescription: String?

    enum CodingKeys: String, CodingKey {
        case itemID = "itemId"
        case imageURL = "ImageUrl"
        case videoURL = "videoUrl"
        case date, title
        case itemListDescription = "description"
    }
}

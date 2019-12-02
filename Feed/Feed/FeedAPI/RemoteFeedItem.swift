//
//  RemoteFeedItem.swift
//  Feed
//
//  Created by Stas Lee on 12/1/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import Foundation

public struct RemoteFeedItem: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: URL
    let urlToImage: URL?
    
    init(author: String?, title: String?, description: String?, url: URL, urlToImage: URL?) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
    }
}


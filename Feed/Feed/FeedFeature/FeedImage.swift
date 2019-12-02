//
//  FeedImage.swift
//  Feed
//
//  Created by Stas Lee on 12/1/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import Foundation

public struct FeedImage {
    public let author: String?
    public let title: String?
    public let description: String?
    public let url: URL
    public let urlToImage: URL?
    
    init(author: String?, title: String?, description: String?, url: URL, urlToImage: URL?) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
    }
}

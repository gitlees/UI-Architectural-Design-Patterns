//
//  FeedItemsMapper.swift
//  Feed
//
//  Created by Stas Lee on 12/1/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import Foundation

final class FeedItemsMapper {
    private struct Root: Decodable {
        let status: String
        let totalResults: Int
        let articles: [RemoteFeedItem]
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteFeedLoader.Error.invalidData
        }

        return root.articles
    }
}

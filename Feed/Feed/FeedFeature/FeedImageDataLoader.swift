//
//  FeedImageDataLoader.swift
//  Feed
//
//  Created by Stas Lee on 12/1/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import Foundation

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}

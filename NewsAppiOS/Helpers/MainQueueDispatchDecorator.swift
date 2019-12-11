//
//  MainQueueDispatchDecorator.swift
//  NewsAppiOS
//
//  Created by Stas Lee on 12/2/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import Foundation
import Feed

public final class MainQueueDispatchDecorator<T> {
    private let decoratee: T
    
    public init(decoratee: T) {
        self.decoratee = decoratee
    }
    
    func dispatch(completion: @escaping () -> Void){
        guard Thread.isMainThread else{
            return DispatchQueue.main.async(execute: completion)
        }
        
        completion()
    }
}

extension MainQueueDispatchDecorator: FeedLoader where T == FeedLoader {
    public func load(completion: @escaping (FeedLoader.Result) -> Void) {
        decoratee.load { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}

extension MainQueueDispatchDecorator: FeedImageDataLoader where T == FeedImageDataLoader {
    public func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        return decoratee.loadImageData(from: url) { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}


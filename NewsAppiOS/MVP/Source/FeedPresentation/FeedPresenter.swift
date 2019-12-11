//
//  FeedPresenter.swift
//  MVP
//
//  Created by Stas Lee on 12/3/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import Foundation
import Feed

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}

protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}

protocol FeedErrorView {
    func display(_ viewModel: FeedErrorViewModel)
}

final class FeedPresenter {
    private let feedView: FeedView
    private let feedErrorView: FeedErrorView
    private let loadingView: FeedLoadingView
    
    init(feedView: FeedView, feedErrorView: FeedErrorView, loadingView: FeedLoadingView) {
        self.feedView = feedView
        self.feedErrorView = feedErrorView
        self.loadingView = loadingView
    }

    static var title: String {
        return "Title"
    }

    var loadError: String {
        return "Error"
    }

    func didStartLoadingFeed() {
        loadingView.display(FeedLoadingViewModel(isLoading: true))
    }
    
    func didFinishLoadingFeed(with feed: [FeedImage]) {
        feedView.display(FeedViewModel(feed: feed))
        loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
    func didFinishLoadingFeed(with error: Error) {
        feedErrorView.display(FeedErrorViewModel(errorMessage: loadError))
    }
}


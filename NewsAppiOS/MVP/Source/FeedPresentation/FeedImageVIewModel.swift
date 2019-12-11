//
//  FeedImageVIewModel.swift
//  MVP
//
//  Created by Stas Lee on 12/3/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import Foundation

struct FeedImageViewModel<Image> {
    let description: String?
    let author: String?
    let title: String?
    let image: Image?
    let isLoading: Bool
}

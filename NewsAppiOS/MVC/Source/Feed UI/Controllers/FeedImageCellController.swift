//
//  FeedImageCellController.swift
//  MVC
//
//  Created by Stas Lee on 12/2/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import UIKit
import Feed

final class FeedImageCellController {
    private let model: FeedImage
    private let imageLoader: FeedImageDataLoader
    
    private var task: FeedImageDataLoaderTask?
    private var cell: FeedImageCell?

    init(model: FeedImage, imageLoader: FeedImageDataLoader) {
        self.model = model
        self.imageLoader = imageLoader
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
        cell?.authorLabel.text = model.author
        cell?.descriptionLabel.text = model.description
        cell?.timeAgoLabel.text = "model.publishedAt"
        cell?.feedImageView.image = nil
        cell?.feedImageContainer.isShimmering = true
        loadImage()
        return cell!
    }
    
    func preload() {
        loadImage()
    }
    
    func cancelLoad() {
        releaseCellForReuse()
        task?.cancel()
    }
    
    private func loadImage() {
        if let url = model.urlToImage {
            task = imageLoader.loadImageData(from: url) { [weak self] result in
                let data = try? result.get()
                let image = UIImage(data: data!)
                self?.cell?.feedImageView.setImageAnimated(image)
                self?.cell?.feedImageContainer.isShimmering = false
            }
        }
    }
    
    private func releaseCellForReuse() {
        cell = nil
    }
}

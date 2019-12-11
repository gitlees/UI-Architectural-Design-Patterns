//
//  FeedImageCell.swift
//  MVP
//
//  Created by Stas Lee on 12/3/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import Foundation
import UIKit

public final class FeedImageCell: UITableViewCell {
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var feedImageContainer: UIView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

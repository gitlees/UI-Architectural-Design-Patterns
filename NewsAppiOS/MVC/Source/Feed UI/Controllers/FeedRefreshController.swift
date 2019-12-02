//
//  FeedRefreshController.swift
//  MVC
//
//  Created by Stas Lee on 12/2/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import UIKit
import Feed

final class FeedRefreshViewController: NSObject {

    @IBOutlet weak var error: ErrorView!
    @IBOutlet weak var refreshView: UIRefreshControl!
    
    var feedLoader: FeedLoader?
    var onRefresh: (([FeedImage]) -> Void)?
    
    @IBAction func refresh() {
        refreshView?.beginRefreshing()
           error?.hideMessage()
           feedLoader?.load { [weak self] result in
               do {
                   self?.onRefresh?(try result.get())
               } catch {
                   self?.error?.show(message: "message")
               }
               self?.refreshView?.endRefreshing()
           }
    }
}

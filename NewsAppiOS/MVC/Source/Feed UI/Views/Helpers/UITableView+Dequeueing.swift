//
//  UITableView+Dequeueing.swift
//  MVC
//
//  Created by Stas Lee on 12/2/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}

//
//  ErrorView.swift
//  MVP
//
//  Created by Stas Lee on 12/3/19.
//  Copyright © 2019 Stas Lee. All rights reserved.
//

import Foundation
import UIKit

public final class ErrorView: UIView {

    @IBOutlet var button: UIButton!
   
    public var message: String? {
        return isVisible ? button.title(for: .normal) : nil
    }

    private var isVisible: Bool {
        return alpha > 0
    }

    public override func awakeFromNib() {
        super.awakeFromNib()

        button.setTitle(nil, for: .normal)
        alpha = 0
    }

    func show(message: String) {
        self.button.setTitle(message, for: .normal)

        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }

    @IBAction func hideMessage() {
        UIView.animate(
            withDuration: 0.25,
            animations: { self.alpha = 0 },
            completion: { completed in
                if completed {
                    self.button.setTitle(nil, for: .normal)
                }
        })
    }
}

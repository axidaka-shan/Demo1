//
//  UIAlertControllerExtension.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    convenience init(title: String?, message: String?, preferredStyle: UIAlertController.Style, actions: [UIAlertAction]) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        actions.forEach { addAction($0) }
    }
}

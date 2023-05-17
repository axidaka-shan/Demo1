//
//  AlertController.swift
//  Demo1
//
//  Created by axidaka on 2023/3/22.
//  Copyright © 2023 shan. All rights reserved.
//

import UIKit
import SwiftUI

struct AlertController: UIViewControllerRepresentable {
  
  var title: String?
  var message: String?
  var preferredStyle: UIAlertController.Style
  var actions: [UIAlertAction]
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<AlertController>) -> UIAlertController {
      return UIAlertController(title: title, message: message, preferredStyle: preferredStyle, actions: actions)
  }
  
  func updateUIViewController(_ uiViewController: UIAlertController, context: UIViewControllerRepresentableContext<AlertController>) {}
  
}



//
//  UITextFieldWithKeyboardObserver.swift
//  Demo1
//
//  Created by axidaka on 2023/3/10.
//

import UIKit
import Combine

class UITextFieldWithKeyboardObserver: UITextField {
  private var keyboardPublisher: AnyCancellable?
  var oneShot: DispatchSourceTimer!

  func setupKeyboardObserver() {
    keyboardPublisher = KeybordManager.shared.$keyboardFrame
        .receive(on: DispatchQueue.main)
        .sink { [weak self] keyboardFrame in
        if let strongSelf = self, let keyboardFrame = keyboardFrame {
            strongSelf.update(with: keyboardFrame)
        }
    }
  }

  private func update(with keyboardFrame: CGRect) {
    if let parentScrollView = superview(of: UIScrollView.self), isFirstResponder {
      let frame = parentScrollView.frame
      let height = UIScreen.main.bounds.height - keyboardFrame.height - 10
      if let frameView = self.superview {
        let framNew =  parentScrollView.convert(self.frame, from: frameView)
        oneShot = DispatchSource.makeTimerSource(queue: DispatchQueue.main)
        oneShot.schedule(deadline: .now() + (0.25))
        oneShot.setEventHandler {
          parentScrollView.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: height)
          parentScrollView.clipsToBounds = true
          parentScrollView.scrollRectToVisible(framNew, animated: true)
        }
        oneShot.setCancelHandler {
        }
        oneShot.resume()
      }
    } else if let parentScrollView = superview(of: UIScrollView.self), keyboardFrame.height == 0 {
      let frame = parentScrollView.frame
      let height = UIScreen.main.bounds.height
      DispatchQueue.main.async {
        if self.oneShot != nil {
          self.oneShot.cancel()
          self.oneShot = nil
        }
        parentScrollView.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: height)
      }
    }
  }
}

extension UIView {
  func superview<T>(of type: T.Type) -> T? {
    return superview as? T ?? superview?.superview(of: type)
  }
}

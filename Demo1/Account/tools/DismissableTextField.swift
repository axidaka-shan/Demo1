//
//  DismissableTextField.swift
//  Demo1
//
//  Created by axidaka on 2023/3/10.
//

import SwiftUI
import Combine
import UIKit

struct DismissableTextField: UIViewRepresentable {
  
  class Coordinator: NSObject, UITextFieldDelegate {

    @Binding var text: String
    @Binding var nextResponder: Bool?
    @Binding var prevResponder: Bool?
    @Binding var isResponder: Bool?
    var onFirstResponderResigned: (() -> Void)?
    var onBecomeResponder: (() -> Void)?
    var onCommit: (() -> Void)?
    var placeholder: String?

    init(text: Binding<String>,
         nextResponder: Binding<Bool?>,
         prevResponder: Binding<Bool?>,
         isResponder: Binding<Bool?>,
         onFirstResponderResigned: (() -> Void)? = nil,
         onBecomeResponder: (() -> Void)? = nil,
         onCommit: (() -> Void)? = nil,
         placeholder: String?) {
      _text = text
      _isResponder = isResponder
      _nextResponder = nextResponder
      _prevResponder = prevResponder
      self.placeholder = placeholder
      self.onFirstResponderResigned = onFirstResponderResigned
      self.onBecomeResponder = onBecomeResponder
      self.onCommit = onCommit
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
      text = textField.text ?? ""
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
      DispatchQueue.main.async {
        self.isResponder = true
        self.onBecomeResponder?()
      }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
      DispatchQueue.main.async {
        self.isResponder = false
        textField.resignFirstResponder()
        self.onFirstResponderResigned?()
      }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if textField.returnKeyType == .done || textField.returnKeyType == .search {
        doneButtonTapped()
        self.onCommit?()
        return true
      }

      downButtonTapped()
      return true
   }

    @objc func upButtonTapped() {
      DispatchQueue.main.async {
        self.isResponder = false
        if self.prevResponder != nil {
          self.prevResponder = true
        }
      }
    }

    @objc func downButtonTapped() {
      DispatchQueue.main.async {
        self.isResponder = false
        if self.nextResponder != nil {
          self.nextResponder = true
          if self.placeholder == "Password" {
            UIApplication.shared.resignResponder()
          }
        }
      }
    }

    @objc func doneButtonTapped() {
      DispatchQueue.main.async {
        self.isResponder = false
        UIApplication.shared.resignResponder()
      }
    }
  }

  @Binding var text: String
  @Binding var nextResponder: Bool?
  @Binding var prevResponder: Bool?
  @Binding var isResponder: Bool?

  var placeholder: String?
  var isSecured: Bool = false
  var keyboard: UIKeyboardType
  var returnKeyType: UIReturnKeyType = .default
  var textContentType: UITextContentType?
  var onFirstResponderResigned: (() -> Void)?
  var onBecomeResponder: (() -> Void)?
  var onCommit: (() -> Void)?
  var textFiledChange: ((UITextField) -> Void)?
  var textcontentVerticalAlignment: UIControl.ContentVerticalAlignment?
  var disableToolBar: Bool = false
  var keybordManagerEnable: Bool?

  func makeUIView(context: UIViewRepresentableContext<DismissableTextField>) -> UITextField {
    let textField = UITextFieldWithKeyboardObserver(frame: .zero)
    textField.placeholder = placeholder
    textField.isSecureTextEntry = isSecured
    textField.autocapitalizationType = .none
    textField.autocorrectionType = .no
    textField.keyboardType = keyboard
    textField.returnKeyType = returnKeyType
    textField.textContentType = textContentType
    textField.delegate = context.coordinator
    textField.autocapitalizationType = .none
    textField.autocorrectionType = .no
    textField.contentVerticalAlignment = textcontentVerticalAlignment ?? .center
    textField.rightView = UIView(frame: .zero)
    textField.setContentCompressionResistancePriority(.init(rawValue: 0), for: .horizontal)
    if !disableToolBar {
//      let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 45))
//      let upButton = UIBarButtonItem(image: UIImage(systemName: "chevron.up"), style: .plain, target: context.coordinator, action: #selector(DismissableTextField.Coordinator.upButtonTapped))
//      let downButton = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .plain, target: context.coordinator, action: #selector(DismissableTextField.Coordinator.downButtonTapped))
//      let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//      let doneButton = UIBarButtonItem(title: NSLocalizedString("doneButton", comment: "done button text"), style: .done, target: context.coordinator, action: #selector(DismissableTextField.Coordinator.doneButtonTapped))
//      toolBar.items = [upButton, downButton, flexible, doneButton]
//      toolBar.setItems([upButton, downButton, flexible, doneButton], animated: true)
//      textField.inputAccessoryView = toolBar
    }
    if let textFiledChange = self.textFiledChange {
      textFiledChange(textField)
    }
    return textField
  }

  func makeCoordinator() -> DismissableTextField.Coordinator {
    return Coordinator(text: $text, nextResponder: $nextResponder, prevResponder: $prevResponder, isResponder: $isResponder, onFirstResponderResigned: onFirstResponderResigned, onBecomeResponder: onBecomeResponder, onCommit: onCommit, placeholder: self.placeholder)
  }

  func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<DismissableTextField>) {
    uiView.text = text
    uiView.isSecureTextEntry = isSecured
    if let uiView = uiView as? UITextFieldWithKeyboardObserver, let enable = self.keybordManagerEnable, enable {
      uiView.setupKeyboardObserver()
    }
    if isResponder ?? false {
      DispatchQueue.main.async {
        uiView.becomeFirstResponder()
      }
    }
  }
}



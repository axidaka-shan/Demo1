//
//  TextFields.swift
//  Demo1
//
//  Created by axidaka on 2023/3/10.
//

import SwiftUI

/// textfield that has a placeholder and animated label when editting text; used on forms
struct FloatingTextField: View {
  let title: String
  let text: Binding<String>
  let isSecured: Bool

  var nextResponder: Binding<Bool?>
  var prevResponder: Binding<Bool?>
  var isResponder: Binding<Bool?>
  var keyboardType: UIKeyboardType
  var returnKeyType: UIReturnKeyType = .default
  var textContentType: UITextContentType?
  var onFirstResponderResigned: (() -> Void)?
  var onBecomeResponder: (() -> Void)?
  var onCommit: (() -> Void)?
  var textFiledChange: ((UITextField) -> Void)?
  var textcontentVerticalAlignment: UIControl.ContentVerticalAlignment?
  var keybordManagerEnable: Bool?

  var body: some View {
    ZStack(alignment: .leading) {
//      Text(title)
//        .foregroundColor(text.wrappedValue.isEmpty ? (textcontentVerticalAlignment == .bottom ? Color(.clear) : Color(.placeholderText)) : Color(.systemGray))
//        .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
      // needed to switch security for now TODO: look into making binding actionable
        DismissableTextField(text: text,
                             nextResponder: nextResponder,
                             prevResponder: prevResponder,
                             isResponder: isResponder,
                             placeholder: title,
                             isSecured: isSecured,
                             keyboard: keyboardType,
                             returnKeyType: returnKeyType,
                             textContentType: textContentType,
                             onFirstResponderResigned: onFirstResponderResigned,
                             onBecomeResponder: onBecomeResponder,
                             onCommit: onCommit,
                             textFiledChange: textFiledChange,
                             textcontentVerticalAlignment: textcontentVerticalAlignment,
                             keybordManagerEnable: keybordManagerEnable)
    }
//    .padding(.top, (textcontentVerticalAlignment == .bottom ? -15 : 15))
    .animation(.spring(response: 0.2, dampingFraction: 0.5))
  }

  static func preview() -> some View {
    FloatingTextField(title: "Floating Text Field", text: .constant("Floating Text"), isSecured: false, nextResponder: .constant(nil), prevResponder: .constant(nil), isResponder: .constant(nil), keyboardType: .alphabet, textContentType: nil, onFirstResponderResigned: nil, keybordManagerEnable: true)
  }
}



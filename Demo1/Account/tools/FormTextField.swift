//
//  FormTextField.swift
//  Demo1
//
//  Created by axidaka on 2023/5/6.
//

import Foundation
import SwiftUI

struct FormTextField: View {
  @Binding private var text: String
  private var title: String

  var nextResponder: Binding<Bool?>
  var prevResponder: Binding<Bool?>
  var isResponder: Binding<Bool?>
  var keyboardType: UIKeyboardType
  var returnKeyType: UIReturnKeyType
  var textContentType: UITextContentType?
  var onFirstResponderResigned: (() -> Void)?
  var onBecomeResponder: (() -> Void)?
  var textFiledChange: ((UITextField) -> Void)?
  var textcontentVerticalAlignment: UIControl.ContentVerticalAlignment?
  var keybordManagerEnable: Bool? = false
  var isContentValid: Bool?

  init(title: String,
       text: Binding<String>,
       nextResponder: Binding<Bool?>,
       prevResponder: Binding<Bool?>,
       isResponder: Binding<Bool?>,
       keyboardType: UIKeyboardType = .default,
       returnKeyType: UIReturnKeyType = .default,
       textContentType: UITextContentType? = nil,
       onFirstResponderResigned: (() -> Void)? = nil,
       onBecomeResponder: (() -> Void)? = nil,
       textFiledChange: ((UITextField) -> Void)? = nil,
       textcontentVerticalAlignment: UIControl.ContentVerticalAlignment? = nil,
       keybordManagerEnable: Bool?,
       isContentValid: Bool? = true
  ) {
    self.title = title
    self._text = text
    self.nextResponder = nextResponder
    self.prevResponder = prevResponder
    self.isResponder = isResponder
    self.keyboardType = keyboardType
    self.returnKeyType = returnKeyType
    self.textContentType = textContentType
    self.onFirstResponderResigned = onFirstResponderResigned
    self.onBecomeResponder = onBecomeResponder
    self.textFiledChange = textFiledChange
    self.textcontentVerticalAlignment = textcontentVerticalAlignment
    self.keybordManagerEnable = keybordManagerEnable
    self.isContentValid = isContentValid
  }

  var body: some View {
    ZStack(alignment: .trailing) {
      VStack(alignment: .leading) {
        HStack(alignment: .center) {
          Spacer().frame(width: 10)
          Image(systemName: "envelope")
            .padding(.top, 5)

          FloatingTextField(title: title,
                                  text: $text,
                                  isSecured: false,
                                  nextResponder: nextResponder,
                                  prevResponder: prevResponder,
                                  isResponder: isResponder,
                                  keyboardType: .emailAddress,
                                  returnKeyType: returnKeyType,
                                  textContentType: textContentType,
                                  onFirstResponderResigned: onFirstResponderResigned,
                                  onBecomeResponder: onBecomeResponder,
                                  textFiledChange: textFiledChange,
                                  textcontentVerticalAlignment: textcontentVerticalAlignment,
                                  keybordManagerEnable: keybordManagerEnable)
          
        }
        AccountTools.SeparatorView(color: isContentValid ?? true ? Color(isResponder.wrappedValue ?? false ? .clear : .clear) : Color(.red))
          .padding(.top, 1)
      }
    }
  }

  static func preview() -> some View {
    FormTextField(title: "Form Text Field", text: .constant("Text Field"), nextResponder: .constant(nil), prevResponder: .constant(nil), isResponder: .constant(nil), keybordManagerEnable: false)
  }
}

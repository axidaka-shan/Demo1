//
//  SecureTextField.swift
//  Demo1
//
//  Created by axidaka on 2023/5/6.
//

import SwiftUI

/// secure textfield used on forms; accepts the previous and next responder to navigate textfields without scrolling.
struct SecureTextField: View {
  @Binding private var text: String
  @State private var isSecured: Bool = true
  private var title: String
  private var textContentType: UITextContentType?
  var shouldShowFaceIDButton: Bool
  private let faceIdAction: (() -> Void)?

  var nextResponder: Binding<Bool?>
  var prevResponder: Binding<Bool?>
  var isResponder: Binding<Bool?>
  var returnKeyType: UIReturnKeyType
  var onFirstResponderResigned: (() -> Void)?
  var onBecomeResponder: (() -> Void)?
  var onCommit: (() -> Void)?
  var textFiledChange: ((UITextField) -> Void)?
  var textcontentVerticalAlignment: UIControl.ContentVerticalAlignment?
  var keybordManagerEnable: Bool? = false
  var isContentValid: Bool?

  init(title: String,
       text: Binding<String>,
       textContentType: UITextContentType? = nil,
       nextResponder: Binding<Bool?>,
       prevResponder: Binding<Bool?>,
       isResponder: Binding<Bool?>,
       returnKeyType: UIReturnKeyType = .default,
       shouldShowFaceIDButton: Bool = true,
       faceIdAction: (() -> Void)? = nil,
       onFirstResponderResigned: (() -> Void)? = nil,
       onBecomeResponder: (() -> Void)? = nil,
       onCommit: (() -> Void)? = nil,
       textFiledChange: ((UITextField) -> Void)? = nil,
       textcontentVerticalAlignment: UIControl.ContentVerticalAlignment? = nil,
       keybordManagerEnable: Bool?,
       isContentValid: Bool? = true
  ) {
    self.title = title
    self.textContentType = textContentType
    self._text = text
    self.nextResponder = nextResponder
    self.prevResponder = prevResponder
    self.isResponder = isResponder
    self.returnKeyType = returnKeyType
    self.shouldShowFaceIDButton = shouldShowFaceIDButton
    self.faceIdAction = faceIdAction
    self.onFirstResponderResigned = onFirstResponderResigned
    self.onBecomeResponder = onBecomeResponder
    self.onCommit = onCommit
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
          Image(systemName: "lock")
            .padding(.top, 5)
          FloatingTextField(title: title,
                                  text: $text,
                                  isSecured: isSecured,
                                  nextResponder: nextResponder,
                                  prevResponder: prevResponder,
                                  isResponder: isResponder,
                                  keyboardType: .default,
                                  returnKeyType: returnKeyType,
                                  textContentType: textContentType,
                                  onFirstResponderResigned: onFirstResponderResigned,
                                  onBecomeResponder: onBecomeResponder,
                                  onCommit: onCommit,
                                  textFiledChange: textFiledChange,
                                  textcontentVerticalAlignment: textcontentVerticalAlignment,
                                  keybordManagerEnable: keybordManagerEnable)
          Button(action: {
            isSecured.toggle()
          }) {
            Image(systemName: self.isSecured ? "eye.slash" : "eye")
              .accentColor(Color(.black))
          }
          Spacer().frame(width: 5)
        }
        AccountTools.SeparatorView(color: isContentValid ?? true ? Color(isResponder.wrappedValue ?? false ? .black : .systemGray) : Color(.red))
          .padding(.top, textcontentVerticalAlignment == .bottom ? 1 : 0)
      }
    }
  }

  static func preview() -> some View {
    SecureTextField(title: "Password FIeld", text: .constant("Password"), nextResponder: .constant(nil), prevResponder: .constant(nil), isResponder: .constant(nil), returnKeyType: .default, keybordManagerEnable: false)
  }
}

//
//  BaseButton.swift
//  Demo1
//
//  Created by axidaka on 2023/5/6.
//

import SwiftUI

struct BaseButtonStyle: ButtonStyle {

  private let primaryBackgroundColor: Color = Color(.label)
  private let altBackgroundColor: Color = Color(.clear)
#if os(iOS)
  private let disabledBackgroundColor: Color = Color(.systemGray5)
#else
  private let disabledBackgroundColor: Color = Color(.lightGray)
#endif
  private let isEnabled: Bool
  private let primary: Bool

  public init(isEnabled: Bool, primary: Bool) {
    self.isEnabled = isEnabled
    self.primary = primary
  }

  func makeBody(configuration: Self.Configuration) -> some View {
    return configuration.label
      .padding([.top, .bottom], 14)
      .padding([.leading, .trailing], 20)
      .background(primary ? (isEnabled ? primaryBackgroundColor : disabledBackgroundColor) : altBackgroundColor)
      .cornerRadius(4)
      .overlay(
        RoundedRectangle(cornerRadius: 4)
          .stroke(isEnabled ? primaryBackgroundColor : disabledBackgroundColor)
          .foregroundColor(.clear)
      )
      .font(Font(UIFont.systemFont(ofSize: 17)))
  }
}

struct BaseButton: View {
  private let title: String
  private let action: () -> Void
  private var isEnabled: Bool
  private let foregroundColor: Color = Color( .white)
  private let disabledForegroundColor: Color = Color(.systemGray)
  private let primary: Bool
  private let isLoading: Bool

  init(title: String,
       action: @escaping () -> Void,
       isEnabled: Bool,
       primary: Bool = true,
       isLoading: Bool = false) {
    self.title = title
    self.action = action
    self.isEnabled = isEnabled
    self.primary = primary
    self.isLoading = isLoading
  }

  var body: some View {

      Button(action: self.action) {
        Group {
          if isLoading {
            Text(self.title)
              .hidden()
              .overlay(Group {
                if #available(iOS 16.0, *) {
                  ProgressView()
                    .tint(primary ? foregroundColor : Color(UIColor.label))
                } else {
                  ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: primary ? foregroundColor : Color(UIColor.label)))
                }
              })
          } else {
            Text(self.title)
              .foregroundColor(primary ? (isEnabled ? foregroundColor : disabledForegroundColor) : Color(UIColor.label))
          }
        }
        .frame(maxWidth: .infinity)
      }
      .buttonStyle(BaseButtonStyle(isEnabled: isEnabled, primary: primary))
  }
}

struct BaseButton2: View {
  private var title: String = ""
  private var action: () -> Void = {}
  private var primary: Bool = false
  private var textColor: Color = .white
  private var backgroundColor: Color = .black
  private var font: Font = Font.system(size: 16, weight: .bold, design: .default)
  private var height: CGFloat = 50
  private var cornerRadius: CGFloat = 5

//  init(title: String, action: @escaping () -> Void, primary: Bool = false) {
//
//    if primary {
//      self.title = title
//      self.action = action
//      self.primary = true
//      self.textColor = Color.white
//      self.backgroundColor = Color.red
//    } else {
//      self.title = title
//      self.action = action
//      self.primary = false
//      self.textColor = Color.black
//      self.backgroundColor = Color.white
//    }
//  }

  var body: some View {
    
    Button(action: self.action) {
      Text(title)
        .foregroundColor(textColor)
    }
    .frame(maxWidth: .infinity)
    .frame(height: height)
    .background(backgroundColor)
    .cornerRadius(cornerRadius)
    .font(font)

  }
}

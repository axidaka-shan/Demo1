//
//  AccountTools.swift
//  Demo1
//
//  Created by axidaka on 2023/5/6.
//

import Foundation
import SwiftUI

struct AccountTools {
  /// basic line separator used on forms
  static func SeparatorView(color: Color) -> some View {
    color
      .frame(maxWidth: .infinity, maxHeight: 1)
  }
  
  static func CaptionText(_ string: String, color: Color) -> some View {
    Text(string)
      .font(Font.caption)
      .foregroundColor(color)
      .multilineTextAlignment(.leading)
  }
}


// https://stackoverflow.com/questions/56490250/dynamically-hiding-view-in-swiftui
public extension View {
  /// Hide or show the view based on a boolean value.
  ///
  /// Example for visibility:
  ///
  ///     Text("Label")
  ///         .isHidden(true)
  ///
  /// Example for complete removal:
  ///
  ///     Text("Label")
  ///         .isHidden(true, remove: true)
  ///
  /// - Parameters:
  ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
  ///   - remove: Boolean value indicating whether or not to remove the view.
  @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
    if hidden {
      if !remove {
        self.hidden()
      }
    } else {
      self
    }
  }
}

// dismiss keyboard
extension UIApplication {
  func resignResponder() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}


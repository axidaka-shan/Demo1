//
//  RefreshableList.swift
//  Demo1
//
//  Created by axidaka on 2023/4/3.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct RefreshableList<Content: View>: View {
  private var content: Content
  private var onRefresh: () -> Void
  
  @State private var isRefreshing = false
  
  init(onRefresh: @escaping () -> Void, @ViewBuilder content: () -> Content) {
      self.content = content()
      self.onRefresh = onRefresh
  }
  
  var body: some View {
      List {
          content
      }
      .overlay(
          GeometryReader { geo in
              Color.clear
                  .preference(key: RefreshableKey.self, value: geo.frame(in: .global).minY)
          }
      )
      .onPreferenceChange(RefreshableKey.self) { value in
          let offset = value
          if offset < -60 && !isRefreshing {
              isRefreshing = true
              onRefresh()
          }
      }
      .offset(y: isRefreshing ? 30 : 0)
      .animation(.easeInOut)
  }
}

private struct RefreshableKey: PreferenceKey {
  static var defaultValue: CGFloat = 0
  
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
      value = nextValue()
  }
}
